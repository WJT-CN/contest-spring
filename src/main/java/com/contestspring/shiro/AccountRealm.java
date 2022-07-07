package com.contestspring.shiro;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.entity.*;
import com.contestspring.service.*;
import com.contestspring.util.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Slf4j
@Component
public class AccountRealm extends AuthorizingRealm {
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    UserService userService;
    @Autowired
    AdminPermissionService adminPermissionService;
    @Autowired
    AdminUserRoleService adminUserRoleService;
    @Autowired
    AdminRoleService adminRoleService;
    @Autowired
    AdminRolePermissionService adminRolePermissionService;
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 获取当前用户的所有权限
        System.out.println(principalCollection.getPrimaryPrincipal());
        AccountProfile profile = (AccountProfile) principalCollection.getPrimaryPrincipal();
        System.out.println(profile);
        System.out.println(profile.getId());
/*        return null;*/
        QueryWrapper<AdminUserRole> userRoleQuery = new QueryWrapper<>();
        userRoleQuery.eq("uid",profile.getId());
        List<Integer> rids = adminUserRoleService.list(userRoleQuery)
                .stream().map(AdminUserRole::getRid).collect(Collectors.toList());

        Collection<AdminRole> arcollection =adminRoleService.listByIds(rids);
        List<AdminRole> roles = new ArrayList<>(arcollection);
        Set<String> roleName = roles.stream().map(AdminRole::getName).collect(Collectors.toSet());
        System.out.println(roleName);

        QueryWrapper<AdminRolePermission> arpquery = new QueryWrapper<>();
        arpquery.in("rid",rids);
        //判断权限是否为空
        if (CollectionUtil.isEmpty(adminRolePermissionService.list(arpquery))){
            //学生账号权限为空
            return null;
        }
        List<Integer> pids = adminRolePermissionService.list(arpquery)
                .stream().map(AdminRolePermission::getPid).collect(Collectors.toList());
        Collection<AdminPermission> apcollection =adminPermissionService.listByIds(pids);
        List<AdminPermission> perms = new ArrayList<>(apcollection);

        Set<String> permissionsUrl = perms.stream().map(AdminPermission::getUrl).collect(Collectors.toSet());
        // 将权限放入授权信息中
        SimpleAuthorizationInfo s = new SimpleAuthorizationInfo();
        s.setStringPermissions(permissionsUrl);
        s.setRoles(roleName);
        System.out.println("getStringPermissions"+s.getStringPermissions());
        System.out.println("roleName"+s.getRoles());
        return s;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        JwtToken jwtToken = (JwtToken) token;
        log.info("jwt----------------->{}", jwtToken);
        log.info("jwt----------------->{}", jwtToken.getPrincipal());
        String userId = jwtUtils.getClaimByToken((String) jwtToken.getPrincipal()).getSubject();
        User user = userService.getById(Long.parseLong(userId));
        if(user == null) {
            throw new UnknownAccountException("账户不存在！");
        }
        if(!user.getStatus()) {
            throw new LockedAccountException("账户已被锁定！");
        }
        AccountProfile profile = new AccountProfile();
        BeanUtil.copyProperties(user, profile);
        log.info("profile----------------->{}", profile.toString());
        return new SimpleAuthenticationInfo(profile, jwtToken.getCredentials(), getName());
    }
}
