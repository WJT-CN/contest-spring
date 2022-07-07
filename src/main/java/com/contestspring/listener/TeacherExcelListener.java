package com.contestspring.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Teacher;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.TeacherData;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.TeacherService;
import com.contestspring.service.UserService;
import org.springframework.util.DigestUtils;


public class TeacherExcelListener extends AnalysisEventListener<TeacherData> {

    public TeacherService teacherService;
    public UserService userService;
    public AdminUserRoleService userRoleService;

    public TeacherExcelListener() {}
    public TeacherExcelListener(TeacherService teacherService, UserService userService, AdminUserRoleService userRoleService) {
        this.teacherService = teacherService;
        this.userService = userService;
        this.userRoleService = userRoleService;
    }

    @Override
    public void invoke(TeacherData teacherData, AnalysisContext analysisContext) {
        if(teacherData == null) {
            throw new RuntimeException();
        }

        //一行一行读取
        //判断一级分类是否重复
        Teacher existTeacher = this.existTeacher(teacherService, teacherData.getTeacherNo());
        if(existTeacher == null) { //没有相同一级分类，进行添加
            existTeacher = new Teacher();
            existTeacher.setTeacherNo(teacherData.getTeacherNo());
            existTeacher.setTeacherName(teacherData.getTeacherName());
            existTeacher.setTeacherSex(teacherData.getTeacherSex());
            existTeacher.setTeacherCollege(teacherData.getTeacherCollege());
            existTeacher.setTeacherEducation(teacherData.getTeacherEducation());
            existTeacher.setTeacherEmail(teacherData.getTeacherEmail());
            existTeacher.setTeacherPhone(teacherData.getTeacherPhone());
            existTeacher.setTeacherSkill(teacherData.getTeacherSkill());
            User user = new User();
            user.setUsername(teacherData.getTeacherNo());
            user.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
            user.setEmail(teacherData.getTeacherEmail());
            user.setUsertype("教师");
            user.setStatus(true);
            userService.save(user);
            AdminUserRole userRole = new AdminUserRole();
            userRole.setUid(user.getId());
            userRole.setRid(3);
            teacherService.save(existTeacher);
            userRoleService.save(userRole);
        }

    }

    private Teacher existTeacher(TeacherService teacherService, String teacherNo) {
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_no",teacherNo);
        Teacher teacher = teacherService.getOne(wrapper);
        return teacher;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
