package com.contestspring.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.*;
import com.contestspring.service.AdminMenuService;
import com.contestspring.service.AdminRoleMenuService;
import com.contestspring.service.AdminUserRoleService;
import com.contestspring.service.UserService;
import com.contestspring.shiro.AccountProfile;
import com.contestspring.shiro.JwtToken;
import com.contestspring.util.JwtUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class AdminMenuController {
    @Autowired
    AdminMenuService adminMenuService;
    @Autowired
    AdminRoleMenuService adminRoleMenuService;
    @Autowired
    UserService userService;
    @Autowired
    AdminUserRoleService adminUserRoleService;
    @Autowired
    JwtUtils jwtUtils;
    @GetMapping("/menu")
    public Result menusByCurrentUser(HttpServletRequest request) {
        // Get current user in DB.
        String uid = jwtUtils.getClaimByToken(request.getHeader("Authorization")).getSubject();
        User user = userService.getById(uid);

        // Get roles' ids of current user.
        QueryWrapper<AdminUserRole> userRoleQuery = new QueryWrapper<>();
        userRoleQuery.eq("uid",user.getId());
        List<Integer> rids = adminUserRoleService.list(userRoleQuery)
                .stream().map(AdminUserRole::getRid).collect(Collectors.toList());

        // Get menu items of these roles.
        QueryWrapper<AdminRoleMenu> armquery = new QueryWrapper<>();
        armquery.in("rid",rids);
        if (CollectionUtil.isEmpty(adminRoleMenuService.list(armquery))){
            return null;
        }
        List<Integer> menuIds = adminRoleMenuService.list(armquery)
                .stream().map(AdminRoleMenu::getMid).collect(Collectors.toList());
        Collection<AdminMenu> apcollection =adminMenuService.listByIds(menuIds);
        List<AdminMenu> menus = new ArrayList<>(apcollection);
        // Adjust the structure of the menu.
        handleMenus(menus);
        return Result.succ(menus);
    }
    @GetMapping("/admin/role/menu")
    public Result listAllMenus() {
        return Result.succ(getMenusByRoleId(1));
    }


    public List<AdminMenu> getMenusByRoleId(int rid) {
        QueryWrapper<AdminRoleMenu> armquery = new QueryWrapper<>();
        armquery.eq("rid",rid);
        if (CollectionUtil.isEmpty(adminRoleMenuService.list(armquery))){
            return null;
        }
        List<Integer> menuIds = adminRoleMenuService.list(armquery)
                .stream().map(AdminRoleMenu::getMid).collect(Collectors.toList());
        Collection<AdminMenu> apcollection =adminMenuService.listByIds(menuIds);
        List<AdminMenu> menuList = new ArrayList<AdminMenu>(apcollection);
        handleMenus(menuList);
        return menuList;
    }
    public void handleMenus(List<AdminMenu> menus) {
        menus.forEach(m -> {
            QueryWrapper<AdminMenu> amquery = new QueryWrapper<>();
            amquery.eq("parent_id",m.getId());
            List<AdminMenu> children = adminMenuService.list(amquery);
            m.setChildren(children);
        });
        menus.removeIf(m -> m.getParentId() != 0);
    }
}
