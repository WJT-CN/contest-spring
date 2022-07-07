package com.contestspring.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Student;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.StudentData;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.StudentService;
import com.contestspring.service.UserService;
import org.springframework.util.DigestUtils;


public class StudentExcelListener  extends AnalysisEventListener<StudentData> {
    //StudentExcelListener，需要自己new，不能注入其他对象
    //不能实现数据库操作
    public StudentService studentService;
    public UserService userService;
    public AdminUserRoleService userRoleService;

    public StudentExcelListener() {}
    public StudentExcelListener(StudentService studentService, UserService userService, AdminUserRoleService userRoleService) {
        this.studentService = studentService;
        this.userService = userService;
        this.userRoleService = userRoleService;
    }

    @Override
    public void invoke(StudentData studentData, AnalysisContext analysisContext) {
        if(studentData == null) {
            throw new RuntimeException();
        }

        //一行一行读取
        //判断一级分类是否重复
        Student existStudent = this.existStudent(studentService, studentData.getStudentNo());
        if(existStudent == null) { //没有相同一级分类，进行添加
            existStudent = new Student();
            existStudent.setStudentNo(studentData.getStudentNo());
            existStudent.setStudentName(studentData.getStudentName());
            existStudent.setStudentSex(studentData.getStudentSex());
            existStudent.setStudentCollege(studentData.getStudentCollege());
            existStudent.setStudentMajor(studentData.getStudentMajor());
            existStudent.setStudentClasses(studentData.getStudentClasses());
            existStudent.setStudentEmail(studentData.getStudentEmail());
            existStudent.setStudentPhone(studentData.getStudentPhone());
            existStudent.setStudentCard(studentData.getStudentCard());
            existStudent.setStudentBank(studentData.getStudentBank());
            User user = new User();
            user.setUsername(studentData.getStudentNo());
            user.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
            user.setEmail(studentData.getStudentEmail());
            user.setUsertype("学生");
            user.setStatus(true);
            userService.save(user);
            AdminUserRole userRole = new AdminUserRole();
            userRole.setUid(user.getId());
            userRole.setRid(2);
            studentService.save(existStudent);
            userRoleService.save(userRole);
        }

    }

    private Student existStudent(StudentService studentService, String stuNo) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("student_no",stuNo);
        Student student = studentService.getOne(wrapper);
        return student;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
