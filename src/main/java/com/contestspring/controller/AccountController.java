package com.contestspring.controller;

import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.contestspring.common.dto.AlertPasswordDto;
import com.contestspring.entity.Student;
import com.contestspring.entity.Teacher;
import com.contestspring.entity.User;
import com.contestspring.service.StudentService;
import com.contestspring.service.TeacherService;
import com.contestspring.service.UserService;
import com.contestspring.shiro.AccountRealm;
import com.contestspring.shiro.JwtToken;
import com.contestspring.util.JwtUtils;
import com.contestspring.common.dto.LoginDto;
import com.contestspring.common.lang.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@RestController
public class AccountController {

    @Autowired
    UserService userService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    StudentService studentService;

    @Autowired
    JwtUtils jwtUtils;

    @RequiresAuthentication
    @GetMapping("/acount/test")
    public Result roleTest(){
        System.out.println(SecurityUtils.getSubject());
        return Result.succ("cg");
    }

    @PostMapping("/login")
    public Result login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response) {

        User user = userService.getOne(new QueryWrapper<User>().eq("username", loginDto.getUsername()));
        Assert.notNull(user, "???????????????");

        if(!user.getPassword().equals(SecureUtil.md5(loginDto.getPassword()))){
            return Result.fail("???????????????");
        }
        String jwt = jwtUtils.generateToken(user.getId());

        response.setHeader("Authorization", jwt);
        response.setHeader("Access-control-Expose-Headers", "Authorization");

        Subject subject = SecurityUtils.getSubject();
        subject.login(new JwtToken(jwt));
        Object moreInfo = null;
        if (user.getUsertype().equals("?????????")){
            moreInfo="?????????";
        }else if (user.getUsertype().equals("??????")){
            QueryWrapper<Teacher> teacherQueryWrapper = new QueryWrapper<>();
            teacherQueryWrapper.eq("teacher_no",user.getUsername());
            moreInfo = teacherService.getOne(teacherQueryWrapper);
        }else if(user.getUsertype().equals("??????")){
            QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
            studentQueryWrapper.eq("student_no",user.getUsername());
            moreInfo = studentService.getOne(studentQueryWrapper);
        }

        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("username", user.getUsername())
                .put("avatar", user.getAvatar())
                .put("usertype", user.getUsertype())
                .put("moreInfo", moreInfo)
                .map()
        );
    }
    @PostMapping("/loginTest")
    public Result loginTest(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response) {
        String username = loginDto.getUsername();
        username = HtmlUtils.htmlEscape(username);
        User user = userService.getOne(new QueryWrapper<User>().eq("username", username));

        if (user==null) {
            user = new User();
            user.setId(0);
            user.setStatus(true);
        }
        System.out.println(user.getId());
        String jwt = jwtUtils.generateToken(user.getId());
        response.setHeader("Authorization", jwt);
        response.setHeader("Access-control-Expose-Headers", "Authorization");

        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new JwtToken(jwt));
            Object moreInfo = null;
            if (subject.hasRole("sysAdmin")){
                moreInfo="?????????";
                System.out.println("?????????");
            }else if (subject.hasRole("teacher")){
                System.out.println("??????");
                QueryWrapper<Teacher> teacherQueryWrapper = new QueryWrapper<>();
                teacherQueryWrapper.eq("teacher_no",user.getUsername());
                moreInfo = teacherService.getOne(teacherQueryWrapper);
            }else if(subject.hasRole("student")){
                System.out.println("??????");
                QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
                studentQueryWrapper.eq("student_no",user.getUsername());
                moreInfo = studentService.getOne(studentQueryWrapper);
            }

/*            if (user.getUsertype().equals("?????????")){
                moreInfo="?????????";
            }else if (user.getUsertype().equals("??????")){
                QueryWrapper<Teacher> teacherQueryWrapper = new QueryWrapper<>();
                teacherQueryWrapper.eq("teacher_no",user.getUsername());
                moreInfo = teacherService.getOne(teacherQueryWrapper);
            }else if(user.getUsertype().equals("??????")){
                QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
                studentQueryWrapper.eq("student_no",user.getUsername());
                moreInfo = studentService.getOne(studentQueryWrapper);
            }*/

            return Result.succ(MapUtil.builder()
                    .put("id", user.getId())
                    .put("username", user.getUsername())
                    .put("avatar", user.getAvatar())
                    .put("usertype", user.getUsertype())
                    .put("moreInfo", moreInfo)
                    .map());
        } catch (IncorrectCredentialsException e) {
            return Result.fail("????????????");
        } catch (UnknownAccountException e) {
            return Result.fail("???????????????");
        }
    }

    @RequiresAuthentication
    @RequestMapping("/logout")
    public Result logout() {
        System.out.println("??????");
        SecurityUtils.getSubject().logout();
        System.out.println("??????");
        return Result.succ("null");
    }

    @GetMapping("/users")
    public Result users() {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("id","username", "avatar","email","status","usertype");
        List<User> users = userService.list(queryWrapper);
        return Result.succ(users);
    }

        @GetMapping("/user/{id}")
    public Result userByid(@PathVariable Long id) {
        User user = userService.getById(id);
            Object moreInfo = null;
            if (user.getUsertype().equals("?????????")){
                moreInfo="?????????";
            }else if (user.getUsertype().equals("??????")){
                QueryWrapper<Teacher> teacherQueryWrapper = new QueryWrapper<>();
                teacherQueryWrapper.eq("teacher_no",user.getUsername());
                moreInfo = teacherService.getOne(teacherQueryWrapper);
            }else if(user.getUsertype().equals("??????")){
                QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
                studentQueryWrapper.eq("student_no",user.getUsername());
                moreInfo = studentService.getOne(studentQueryWrapper);
            }

        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("username", user.getUsername())
                .put("avatar", user.getAvatar())
                .put("usertype", user.getUsertype())
                .put("moreInfo", moreInfo)
                .map());
    }

    @PutMapping("/user/status")
    public Result updateUserStatus(@RequestBody @Valid User requestUser) {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("username",requestUser.getUsername()).set("status", requestUser.getStatus());
        userService.update(updateWrapper);
        return Result.succ("????????????????????????");
    }

    @PutMapping("/user/password")
    public Result updateUserPassword(@RequestBody @Valid AlertPasswordDto alertPasswordDto) {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("username",alertPasswordDto.getUsername());
        User user = userService.getOne(updateWrapper);
        if(!SecureUtil.md5(alertPasswordDto.getOldpassword()).equals(user.getPassword())){
            return Result.fail("???????????????");
        }
        updateWrapper.set("password",SecureUtil.md5(alertPasswordDto.getPassword()));
        userService.update(updateWrapper);
        return Result.succ("????????????????????????");
    }

    @GetMapping("/user/authentication")
    public String authentication() {
        return "??????????????????";
    }
}
