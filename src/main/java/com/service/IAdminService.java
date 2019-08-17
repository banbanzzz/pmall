package com.service;

import com.entity.Admins;

public interface IAdminService {
    Admins login(String admin_name,String admin_pass);
    Integer updateAdmin(Admins admin);
    Admins findAdminById(Integer id);
}
