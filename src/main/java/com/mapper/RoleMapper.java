package com.mapper;

import com.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {
    Role findById(Integer role_id);
    List<Role> findAllRole();
}
