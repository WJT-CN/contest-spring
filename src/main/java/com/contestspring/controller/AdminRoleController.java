package com.contestspring.controller;


import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.*;
import com.contestspring.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

/*
*
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-04-05
*/


@RestController
public class AdminRoleController {
    @Autowired
    AdminRoleService adminRoleService;
    @Autowired
    AdminMenuService adminMenuService;
    @Autowired
    AdminPermissionService adminPermissionService;
    @Autowired
    AdminRolePermissionService adminRolePermissionService;
    @Autowired
    AdminRoleMenuService adminRoleMenuService;
    @GetMapping("/admin/role/lists")
    public Result RoleListsWithPermsAndMenus(){
        List<AdminRole> roles = adminRoleService.list();
        List<AdminPermission> perms;
        List<AdminMenu> menus;
        for (AdminRole role : roles) {
            //取出角色id对应的功能权限
            QueryWrapper<AdminRolePermission> arpquery = new QueryWrapper<>();
            arpquery.eq("rid",role.getId());
            //判断权限是否为空
            if (CollectionUtil.isEmpty(adminRolePermissionService.list(arpquery))){
                continue;
            }
            List<Integer> pids = adminRolePermissionService.list(arpquery)
                        .stream().map(AdminRolePermission::getPid).collect(Collectors.toList());
            Collection<AdminPermission> apcollection =adminPermissionService.listByIds(pids);
            List<AdminPermission> permList = new ArrayList<AdminPermission>(apcollection);
            perms = permList;
            role.setPerms(perms);
            //取出角色id对应的菜单权限
            QueryWrapper<AdminRoleMenu> armquery = new QueryWrapper<>();
            armquery.eq("rid",role.getId());
            //判断菜单权限是否为空
            if (CollectionUtil.isEmpty(adminRoleMenuService.list(armquery))){
                continue;
            }
            List<Integer> menuIds = adminRoleMenuService.list(armquery)
                    .stream().map(AdminRoleMenu::getMid).collect(Collectors.toList());
            Collection<AdminMenu> amcollection =adminMenuService.listByIds(menuIds);
            List<AdminMenu> menuList = new ArrayList<AdminMenu>(amcollection);
            menuList.forEach(m -> {
                QueryWrapper<AdminMenu> amquery = new QueryWrapper<>();
                amquery.eq("parent_id",m.getId());
                List<AdminMenu> children = adminMenuService.list(amquery);
                m.setChildren(children);
            });
            menuList.removeIf(m -> m.getParentId() != 0);
            menus = menuList;
            role.setMenus(menus);

        }
        return  Result.succ(roles);
    }

    @GetMapping("/admin/role/perm")
    public Result listPerms() {
        return Result.succ(adminPermissionService.list());
    }

    @PutMapping("/admin/role/status")
    public Result updateRoleStatus(@RequestBody AdminRole requestRole) {
        UpdateWrapper<AdminRole> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id",requestRole.getId()).set("enabled", requestRole.getEnabled());
        adminRoleService.update(updateWrapper);
        return Result.succ("用户" + requestRole.getId() + "状态更新成功");
    }

    @PostMapping("/admin/role/add")
    public Result addRole(@RequestBody AdminRole requestRole) {
        String rolename = requestRole.getName();
        String rolename_zh = requestRole.getNameZh();

        if (rolename.equals("") || rolename_zh.equals("")) {
            return Result.fail("角色名和描述不能为空");
        }
        QueryWrapper<AdminRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",rolename);
        AdminRole findRole = adminRoleService.getOne(queryWrapper);
        if (null != findRole){
            return Result.fail("角色已存在");
        }
        requestRole.setEnabled(true);
        adminRoleService.saveOrUpdate(requestRole);
        return Result.succ("添加角色成功");
    }

    @PutMapping("/admin/role/editor")
    public Result editRole(@RequestBody AdminRole requestRole) {
        adminRoleService.saveOrUpdate(requestRole);
        int rid =requestRole.getId();
        List<AdminPermission> perms = requestRole.getPerms();
        QueryWrapper<AdminRolePermission> arpquery = new QueryWrapper<>();
        arpquery.eq("rid",rid);
        adminRolePermissionService.remove(arpquery);
        if (CollectionUtil.isEmpty(perms)){
            return Result.succ("成功");
        }
        List<AdminRolePermission> rps = new ArrayList<>();
        perms.forEach(p -> {
            AdminRolePermission rp = new AdminRolePermission();
            rp.setRid(rid);
            rp.setPid(p.getId());
            rps.add(rp);
        });
        adminRolePermissionService.saveOrUpdateBatch(rps);
        return Result.succ("修改角色信息成功");
    }

    @DeleteMapping("/admin/role/remove/{id}")
    public Result deleteRole(@PathVariable("id") Integer id){
        adminRoleService.removeById(id);
        return Result.succ("删除成功");
    }

    @PutMapping("/admin/role/menu")
    public Result updateRoleMenu(@RequestParam int rid, @RequestBody Map<String, List<Integer>> menusIds) {
        QueryWrapper<AdminRoleMenu> armquery = new QueryWrapper<>();
        armquery.eq("rid",rid);
        adminRoleMenuService.remove(armquery);
        if (CollectionUtil.isEmpty(menusIds.get("menusIds"))){
            return Result.succ("成功");
        }
        List<AdminRoleMenu> rms = new ArrayList<>();
        for (Integer mid : menusIds.get("menusIds")) {
            AdminRoleMenu rm = new AdminRoleMenu();
            rm.setMid(mid);
            rm.setRid(rid);
            rms.add(rm);
        }
        adminRoleMenuService.saveOrUpdateBatch(rms);
        return Result.succ("修改角色菜单信息成功");
    }
}
