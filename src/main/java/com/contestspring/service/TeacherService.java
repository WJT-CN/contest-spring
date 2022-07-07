package com.contestspring.service;

import com.contestspring.entity.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 教师表 服务类
 * </p>
 *
 * @author Author
 * @since 2021-04-28
 */
public interface TeacherService extends IService<Teacher> {

    void saveSubject(MultipartFile file, TeacherService teacherService, UserService userService, AdminUserRoleService userRoleService);

    void deleteListById(Integer[] idList);

    void addTeacher(Teacher teacher);
}
