package com.contestspring.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.Student;
import com.contestspring.entity.User;
import com.contestspring.entity.excel.StudentData;
import com.contestspring.listener.StudentExcelListener;
import com.contestspring.mapper.StudentMapper;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.StudentService;
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
 * 学生表模板 服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-04
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    @Autowired
    UserService userService;

    @Autowired
    AdminUserRoleService userRoleService;

    @Override
    public void saveSubject(MultipartFile file, StudentService studentService, UserService userService, AdminUserRoleService userRoleService) {
        try {
            //文件输入流
            InputStream in = file.getInputStream();
            //调用方法进行读取
            EasyExcel.read(in, StudentData.class,new StudentExcelListener(studentService,userService,userRoleService)).sheet().doRead();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteListById(Integer[] idList) {
        ArrayList<Integer> removeIds = new ArrayList<>();
        for (Integer id: idList) {
            String studentNo = baseMapper.selectById(id).getStudentNo();
            User user = userService.getOne(new QueryWrapper<User>().eq("username", studentNo));
            userRoleService.remove(new QueryWrapper<AdminUserRole>().eq("uid",user.getId()));
            userService.remove(new QueryWrapper<User>().eq("username",studentNo));
            removeIds.add(id);
        }
        baseMapper.deleteBatchIds(removeIds);
    }

    @Override
    public void addStudent(Student student) {
        Student one = baseMapper.selectOne(new QueryWrapper<Student>().eq("student_no", student.getStudentNo()));
        if(one == null){
            User user = new User();
            user.setUsername(student.getStudentNo());
            user.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
            user.setUsertype("学生");
            user.setStatus(true);
            userService.save(user);
            AdminUserRole userRole = new AdminUserRole();
            userRole.setUid(user.getId());
            userRole.setRid(2);
            baseMapper.insert(student);
            userRoleService.save(userRole);
        }
    }
}
