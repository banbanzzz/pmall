package com.mapper;

import com.entity.Admins;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    Admins findAdminById(Integer admin_id);
    Integer addAdmin(Admins admin);
    Integer deleteAdmin(Integer admin_id);
    Integer changeAdminState(@Param("state") Integer state,@Param("admin_id") Integer admin_id);
    Integer updateAdmin(Admins admin);
    List<Admins> findAllAdmin();
    List<Admins> findAdminByName(String name);
}
