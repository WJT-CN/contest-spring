package com.contestspring.controller;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.dto.LoginDto;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.*;
import com.contestspring.entity.excel.StudentQuery;
import com.contestspring.entity.excel.UserQuery;
import com.contestspring.service.AdminRoleService;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.StudentService;
import com.contestspring.service.UserService;

import org.apache.ibatis.annotations.Delete;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-19
 */


@CrossOrigin
@RestController
public class UserController {
    @Value("${myfile.road}")
    String road;
    @Value("${file.location}")
    String location;
    @Autowired
    UserService userService;
    @Autowired
    AdminUserRoleService adminUserRoleService;
    @Autowired
    AdminRoleService adminRoleService;
    @Autowired
    StudentService studentService;
    @GetMapping("/list")
    public Result UserLists(){
        List<User> users = userService.list();
        return Result.succ(users);
    }

    @PostMapping("/getList")
    public Result getList(@RequestBody(required = false)UserQuery userQuery){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if(userQuery != null){
            if(!StringUtils.isEmpty(userQuery.getUsername())){
                queryWrapper.eq("username",userQuery.getUsername());
            }
            if(!StringUtils.isEmpty(userQuery.getUsertype())){
                queryWrapper.like("usertype",userQuery.getUsertype());
            }
        }
        queryWrapper.orderByAsc("created");
        List<User> users = userService.list(queryWrapper);
        return Result.succ(users);
    }

    @PostMapping("/admin/userList/{size}/{page}")
    public Result getStudentPageByQuery(@PathVariable("size") int size, @PathVariable("page") int page, @RequestBody(required = false)UserQuery userQuery) {
        Page<User> userPage = new Page<>(page, size);
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if(userQuery != null){
            if(!StringUtils.isEmpty(userQuery.getUsername())){
                queryWrapper.eq("username",userQuery.getUsername());
            }
            if(!StringUtils.isEmpty(userQuery.getUsertype())){
                queryWrapper.like("usertype",userQuery.getUsertype());
            }
        }
        queryWrapper.orderByAsc("created");
        return Result.succ(userService.page(userPage,queryWrapper));
    }

    @PostMapping("/user/register")
    public Result register(@Validated @RequestBody User user) {
        String username = user.getUsername();
        String password = user.getPassword();

        username = HtmlUtils.htmlEscape(username);
        user.setUsername(username);
        password = SecureUtil.md5(password);
        user.setPassword(password);
        user.setCreated(LocalDateTime.now());
        user.setStatus(true);
        if (username.equals("") || password.equals("")) {
            return Result.fail("用户名和密码不能为空");
        }
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",username);
        User findUser = userService.getOne(queryWrapper);
        if (null != findUser){
            return Result.fail("用户已存在");
        }
        userService.saveOrUpdate(user);
        user = userService.getOne(new QueryWrapper<User>().eq("username", user.getUsername()));
        addRole(user.getId(),user.getUsertype());
        return Result.succ("注册成功");
    }
    @DeleteMapping("/user/remove/{id}")
    public Result deleteUser(@PathVariable("id") Integer id){
        userService.removeById(id);
        return Result.succ("删除成功");
    }
    @PutMapping("/user/resetpassword")
    public Result resetPassword(@RequestBody @Validated User requestUser) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",requestUser.getUsername());
        User user = userService.getOne(queryWrapper);
        String Spassword = SecureUtil.md5("123");
        user.setPassword(Spassword);
        userService.saveOrUpdate(user);
        return Result.succ("重置密码成功");
    }
    @PutMapping("/admin/usereditor")
    public Result editUser(@RequestBody @Valid User requestUser) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("username",requestUser.getUsername());
        User userInDB = userService.getOne(userQueryWrapper);
        userInDB.setEmail(requestUser.getEmail());
        userInDB.setStatus(true);
        userInDB.setRoles(requestUser.getRoles());
        userInDB.setUsertype(requestUser.getRoles().get(0).getNameZh());
        System.out.println(userInDB);
        userService.saveOrUpdate(userInDB);
        //更新roles
        Integer uid=userInDB.getId();
        System.out.println("uid"+uid);
        List<AdminRole> roles=userInDB.getRoles();
        System.out.println("roles"+roles);
        QueryWrapper<AdminUserRole> adminUserRoleQueryWrapper = new QueryWrapper<>();
        adminUserRoleQueryWrapper.eq("uid",uid);
        adminUserRoleService.remove(adminUserRoleQueryWrapper);
        List<AdminUserRole> urs = new ArrayList<>();
        roles.forEach(r -> {
            AdminUserRole ur = new AdminUserRole();
            ur.setUid(uid);
            ur.setRid(r.getId());
            urs.add(ur);
        });
        adminUserRoleService.saveOrUpdateBatch(urs);
        return Result.succ(urs);
    }
    @GetMapping("/admin/userlist")
    public Result userlist() {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("id","username", "avatar","email","status","usertype");
        List<User> users = userService.list(queryWrapper);
        users.forEach(u -> {
            List<AdminRole> roles = listRolesByUser(u.getUsername());
            u.setRoles(roles);
        });
        return Result.succ(users);
    }
    public List<AdminRole> listRolesByUser(String username) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("username",username);
        int uid = userService.getOne(userQueryWrapper).getId();
        QueryWrapper<AdminUserRole> adminUserRoleQueryWrapper = new QueryWrapper<>();
        adminUserRoleQueryWrapper.eq("uid",uid);
        if (CollectionUtil.isEmpty(adminUserRoleService.list(adminUserRoleQueryWrapper))){
            return null;
        }
        List<Integer> rids = adminUserRoleService.list(adminUserRoleQueryWrapper)
                .stream().map(AdminUserRole::getRid).collect(Collectors.toList());
        Collection<AdminRole> adminRoleCollection = adminRoleService.listByIds(rids);
        List<AdminRole> AdminRoleList = new ArrayList<AdminRole>(adminRoleCollection);
        return AdminRoleList;
    }
/*    @PutMapping("/user/status")
    public Result updateUserStatus(@RequestBody @Valid User user) {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id",user.getId()).set("status", user.getStatus());
        userService.update(updateWrapper);
        return Result.succ("奖项申报状态更新成功");
    }*/

    @PostMapping("/user/getOne/{studentNo}")
    public Result getOneStudent(@PathVariable("studentNo") String studentNo){
        Student student = studentService.getOne(new QueryWrapper<Student>().eq("student_no", studentNo));
        return Result.succ(student);
    }

    @PostMapping("/user/avatarupload")
    public Result awardWorkUpload(@RequestParam("avatarfile") MultipartFile avatarfile) {
        if (avatarfile.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+avatarfile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"img"
                +System.getProperty("file.separator")+"userAvatar";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/img/userAvatar/"+fileName;
        try {
            avatarfile.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }
    }
    @PostMapping("/user/covers")
    public Result coversUpload(@RequestParam("avatarfile") MultipartFile avatarfile,@RequestParam("id") Integer id) {
        if (avatarfile.isEmpty()){
            Result.fail("上传失败");
        }
//        String fileName = System.currentTimeMillis()+avatarfile.getOriginalFilename();
        String fileName = String.valueOf(id)+avatarfile.getOriginalFilename().substring(avatarfile.getOriginalFilename().indexOf("."));
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"img"
//                +System.getProperty("file.separator")+"userAvatar";
        String filePath = location+"img/userAvatar/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/img/userAvatar/"+fileName;
        try {
            avatarfile.transferTo(dest);
            User user = new User();
            user.setId(id);
            user.setAvatar(storeAvatorPath);
            boolean flag = userService.saveOrUpdate(user);
            if (flag){
                return Result.succ(storeAvatorPath);
            } else {
                return Result.fail("");
            }
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }
/*        String folder = System.getProperty("user.dir") + System.getProperty("file.separator")+"img"
                +System.getProperty("file.separator")+"userAvatar";
        File imageFolder = new File(folder);
        File f = new File(imageFolder, StringUtils.getRandomString(6) + file.getOriginalFilename()
                .substring(file.getOriginalFilename().length() - 4));
        if (!f.getParentFile().exists())
            f.getParentFile().mkdirs();
        try {
            file.transferTo(f);
            return Result.succ("http://localhost:8088/api/img/userAvator/" + f.getName());
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }*/
    }

    private void addRole(Integer id,String roleName){
        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setUid(id);
        if(roleName.equals("系统管理员")){
            adminUserRole.setRid(1);
        }
        if(roleName.equals("学生")){
            adminUserRole.setRid(2);
        }
        if(roleName.equals("老师")){
            adminUserRole.setRid(3);
        }
        if(roleName.equals("竞赛负责人")){
            adminUserRole.setRid(10);
        }
        adminUserRoleService.save(adminUserRole);
    }

}
