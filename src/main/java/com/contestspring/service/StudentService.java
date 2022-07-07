package com.contestspring.service;

import com.contestspring.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 学生表模板 服务类
 * </p>
 *
 * @author Author
 * @since 2021-04-04
 */
public interface StudentService extends IService<Student> {

    void saveSubject(MultipartFile file, StudentService studentService, UserService userService, AdminUserRoleService userRoleService);

    void deleteListById(Integer[] idList);

    void addStudent(Student student);
}
