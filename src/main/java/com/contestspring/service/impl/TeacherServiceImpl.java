package com.contestspring.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Student;
import com.contestspring.entity.Teacher;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.StudentData;
import com.contestspring.entity.excel.TeacherData;
import com.contestspring.listener.StudentExcelListener;
import com.contestspring.listener.TeacherExcelListener;
import com.contestspring.mapper.TeacherMapper;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.contestspring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;

/**
 * <p>
 * 教师表 服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-28
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Autowired
    UserService userService;

    @Autowired
    AdminUserRoleService userRoleService;

    @Override
    public void saveSubject(MultipartFile file, TeacherService teacherService, UserService userService, AdminUserRoleService userRoleService) {
        try {
            //文件输入流
            InputStream in = file.getInputStream();
            //调用方法进行读取
            EasyExcel.read(in, TeacherData.class,new TeacherExcelListener(teacherService,userService,userRoleService)).sheet().doRead();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteListById(Integer[] idList) {
        ArrayList<Integer> removeIds = new ArrayList<>();
        for (Integer id: idList) {
            String teacherNo = baseMapper.selectById(id).getTeacherNo();
            User user = userService.getOne(new QueryWrapper<User>().eq("username", teacherNo));
            userRoleService.remove(new QueryWrapper<AdminUserRole>().eq("uid",user.getId()));
            userService.remove(new QueryWrapper<User>().eq("username",teacherNo));
            removeIds.add(id);
        }
        baseMapper.deleteBatchIds(removeIds);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        Teacher one = baseMapper.selectOne(new QueryWrapper<Teacher>().eq("teacher_no", teacher.getTeacherNo()));
        if(one == null){
            User user = new User();
            user.setUsername(teacher.getTeacherNo());
            user.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
            user.setUsertype("教师");
            user.setStatus(true);
            userService.save(user);
            AdminUserRole userRole = new AdminUserRole();
            userRole.setUid(user.getId());
            userRole.setRid(3);
            baseMapper.insert(teacher);
            userRoleService.save(userRole);
        }

    }
}
