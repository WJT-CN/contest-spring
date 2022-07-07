package com.contestspring.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Student;
import com.contestspring.entity.Teacher;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.TeacherQuery;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.TeacherService;
import com.contestspring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

/*
*
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-12


*/




@CrossOrigin
@RestController
public class TeacherController {
    @Autowired
    TeacherService teacherService;
    @Autowired
    UserService userService;
    @Autowired
    AdminUserRoleService userRoleService;
    @GetMapping("/teacher/lists")
    public Result TeacherList(){
        List<Teacher> teachers =  teacherService.list();
        return Result.succ(teachers);
    }
    @GetMapping("/teachername/lists")
    public Result TeacherNameList(){
        List<Teacher> teachers =  teacherService.list();
        List<String> teacherNameList = teachers.stream().map(Teacher::getTeacherName).collect(Collectors.toList());
        return Result.succ(teacherNameList);
    }
    @GetMapping("/teacher/{tno}")
    public Result findbytno(@PathVariable("tno") String tno){
        QueryWrapper<Teacher> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("teacher_no",tno);
        Teacher teacher = teacherService.getOne(queryWrapper);
        return Result.succ(teacher);
    }

    @PostMapping("/admin/teacher/{size}/{page}")
    public Result getStudentPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Teacher> studentPage = new Page<>(page, size);
        QueryWrapper<Teacher> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("teacher_no");
        return Result.succ(teacherService.page(studentPage,queryWrapper));
    }

    @PostMapping("/admin/teacherQuery/{size}/{page}")
    public Result getStudentPage(@PathVariable("size") int size, @PathVariable("page") int page, @RequestBody(required = false)TeacherQuery teacherQuery) {
        Page<Teacher> studentPage = new Page<>(page, size);
        QueryWrapper<Teacher> queryWrapper = new QueryWrapper<>();
        if(teacherQuery != null){
            if(!StringUtils.isEmpty(teacherQuery.getTeacherNo())){
                queryWrapper.eq("teacher_no",teacherQuery.getTeacherNo());
            }
            if(!StringUtils.isEmpty(teacherQuery.getTeacherName())){
                queryWrapper.like("teacher_name",teacherQuery.getTeacherName());
            }
            if(!StringUtils.isEmpty(teacherQuery.getTeacherCollege())){
                queryWrapper.like("teacher_college",teacherQuery.getTeacherCollege());
            }
            if(!StringUtils.isEmpty(teacherQuery.getTeacherEducation())){
                queryWrapper.like("teacher_education",teacherQuery.getTeacherEducation());
            }
        }
        queryWrapper.orderByAsc("teacher_no");
        return Result.succ(teacherService.page(studentPage,queryWrapper));
    }

    @PostMapping("/admin/teacher/addorupdate")
    public Result addorupdateaward(@RequestBody @Valid Teacher teacher){
        teacherService.saveOrUpdate(teacher);
        return Result.succ("新增教师信息成功");
    }

    @PostMapping("/admin/teacher/add")
    public Result add(@RequestBody @Valid Teacher teacher){
        teacherService.addTeacher(teacher);
        return Result.succ("新增教师信息成功");
    }

    @DeleteMapping("/admin/teacher/delete/{tno}")
    public Result deleteBysno(@PathVariable("tno") String tno){
        QueryWrapper<Teacher> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("teacher_no",tno);
        User user = userService.getOne(new QueryWrapper<User>().eq("username", tno));
        teacherService.remove(queryWrapper);
        if(user != null){
            userService.remove(new QueryWrapper<User>().eq("username",tno));
            userRoleService.remove(new QueryWrapper<AdminUserRole>().eq("uid",user.getId()));
        }
        return Result.succ("删除成功");
    }

    //批量添加教师
    @PostMapping("/admin/teacher/addTeacher")
    public Result addTeacher(MultipartFile file) {
        //上传过来excel文件
        teacherService.saveSubject(file,teacherService,userService,userRoleService);
        return Result.succ("成功");
    }

    //批量删除
    @DeleteMapping("admin/teacher/deleteTeacherList")
    public Result deleteTeacherList(@RequestBody Integer[] idList){
        teacherService.deleteListById(idList);
        return Result.succ("成功");
    }

    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
    }

}
