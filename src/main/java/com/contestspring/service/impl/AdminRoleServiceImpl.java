package com.contestspring.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.AdminPermission;
import com.contestspring.entity.AdminRole;
import com.contestspring.entity.AdminUserRole;
import com.contestspring.entity.User;
import com.contestspring.mapper.AdminRoleMapper;
import com.contestspring.service.AdminRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-05
 */
@Service
public class AdminRoleServiceImpl extends ServiceImpl<AdminRoleMapper, AdminRole> implements AdminRoleService {

}
