package com.service;

import com.entity.Admins;
import com.entity.Role;
import com.entity.Users;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IAdminService {
    Admins login(String admin_name,String admin_pass);
    Integer updateAdmin(Admins admin);
    Admins findAdminById(Integer id);
    Integer deleteAdmin(Integer admin_id);
    Integer changeAdminState(Integer state,Integer admin_id);
    Integer addAdmin(Admins admin);
    PageInfo<Admins> findAllAdminsBySplitPage(Integer page, Integer limit);
    List<Role> findAllRole();
}
