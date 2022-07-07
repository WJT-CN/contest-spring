package com.contestspring.service.impl;

import com.contestspring.entity.AdminMenu;
import com.contestspring.mapper.AdminMenuMapper;
import com.contestspring.service.AdminMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-26
 */
@Service
public class AdminMenuServiceImpl extends ServiceImpl<AdminMenuMapper, AdminMenu> implements AdminMenuService {
}
