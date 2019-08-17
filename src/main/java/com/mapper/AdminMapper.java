package com.mapper;

import com.entity.Admins;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    Admins findAdminById(Integer admin_id);
    Integer addAdmin(Admins admin);
    Integer deleteAdmin(Integer admin_id);
    Integer disableAdmin(Integer admin_id);
    Integer updateAdmin(Admins admin);
    List<Admins> findAllAdmin();
    List<Admins> findAdminByName(String name);
}
