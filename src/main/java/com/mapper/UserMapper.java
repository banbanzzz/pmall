package com.mapper;

import com.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    Users findUserById(Integer user_id);
    Integer addUser(Users user);
    Integer deleteUser(Integer user_id);
    Integer changeUserState(@Param("user_state") Integer user_state, @Param("user_id") Integer user_id);
    Integer updateUser(Users user);
    List<Users> findAllUser();
    List<Users> findUserByName(String user_name);
    List<Users> findUserLikeName(String user_name);
}
