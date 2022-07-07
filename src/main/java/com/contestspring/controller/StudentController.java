package com.contestspring.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Award;
import com.contestspring.entity.Student;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.StudentQuery;
import com.contestspring.entity.excel.TeacherQuery;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.StudentService;
import com.contestspring.service.UserService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-13
 */
@CrossOrigin
@RestController
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    UserService userService;
    @Autowired
    AdminUserRoleService userRoleService;
    @GetMapping("/student/lists")
    public Result TeacherList(){
        List<Student> students =  studentService.list();
        return Result.succ(students);
    }
    @GetMapping("/student/{sno}")
    public Result findbysno(@PathVariable("sno") String sno){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("student_no",sno);
        Student student = studentService.getOne(queryWrapper);
        return Result.succ(student);
    }
    @GetMapping("/student/test/{sname}")
    public Result findbysname(@PathVariable("sname") String sname){
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("sname",sname);
        Student student = studentService.getOne(queryWrapper);
        return Result.succ(student);
    }
/*    @PostMapping("/student/update")*/
    @PutMapping("/student/update")
    public Result Updateorsave(@RequestBody @Valid Student student){
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_no",student.getStudentNo());
        studentService.saveOrUpdate(student,queryWrapper);
        return  Result.succ("成功");
    }
    @PostMapping("/admin/student/{size}/{page}")
    public Result getStudentPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Student> studentPage = new Page<>(page, size);
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("student_no");
        return Result.succ(studentService.page(studentPage,queryWrapper));
    }

    @PostMapping("/admin/studentQuery/{size}/{page}")
    public Result getStudentPageByQuery(@PathVariable("size") int size, @PathVariable("page") int page, @RequestBody(required = false) StudentQuery studentQuery) {
        Page<Student> studentPage = new Page<>(page, size);
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
        if(studentQuery != null){
            if(!StringUtils.isEmpty(studentQuery.getStudentNo())){
                queryWrapper.eq("student_no",studentQuery.getStudentNo());
            }
            if(!StringUtils.isEmpty(studentQuery.getStudentName())){
                queryWrapper.like("student_name",studentQuery.getStudentName());
            }
            if(!StringUtils.isEmpty(studentQuery.getStudentCollege())){
                queryWrapper.like("student_college",studentQuery.getStudentCollege());
            }
            if(!StringUtils.isEmpty(studentQuery.getStudentMajor())){
                queryWrapper.like("student_major",studentQuery.getStudentMajor());
            }
            if(!StringUtils.isEmpty(studentQuery.getStudentClasses())){
                queryWrapper.like("student_classes",studentQuery.getStudentClasses());
            }
        }
        queryWrapper.orderByAsc("student_no");
        return Result.succ(studentService.page(studentPage,queryWrapper));
    }

    @DeleteMapping("/admin/student/delete/{sno}")
    public Result deleteBysno(@PathVariable("sno") String sno){
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_no",sno);
        User user = userService.getOne(new QueryWrapper<User>().eq("username", sno));
        studentService.remove(queryWrapper);
        if(user != null){
            userService.remove(new QueryWrapper<User>().eq("username",sno));
            userRoleService.remove(new QueryWrapper<AdminUserRole>().eq("uid",user.getId()));
        }
        return Result.succ("删除成功");
    }

    @PostMapping("/admin/student/addorupdate")
    public Result addorupdateaward(@RequestBody @Valid Student student){
        studentService.saveOrUpdate(student);
        return Result.succ("成功");
    }

    @PostMapping("/admin/student/add")
    public Result add(@RequestBody @Valid Student student){
        studentService.addStudent(student);
        return Result.succ("成功");
    }

    //批量添加学生
    @PostMapping("/admin/student/addStudent")
    public Result addStudent(MultipartFile file) {
        //上传过来excel文件
        studentService.saveSubject(file,studentService,userService,userRoleService);
        return Result.succ("成功");
    }

    //批量删除
    @DeleteMapping("admin/student/deleteStudentList")
    public Result deleteStudentList(@RequestBody Integer[] idList){
        studentService.deleteListById(idList);
        return Result.succ("成功");
    }
    
}
