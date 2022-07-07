package com.contestspring.service.impl;

import com.contestspring.entity.User;
import com.contestspring.mapper.UserMapper;
import com.contestspring.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-03-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
