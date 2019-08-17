package com.mapper;

import com.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    Users findUserById(Integer user_id);
    Integer addUser(Users user);
    Integer deleteUser(Integer user_id);
    Integer changeUserState(Integer user_state,Integer user_id);
    Integer updateUser(Users user);
    List<Users> findAllUser();
    List<Users> findUserByName(String user_name);
    List<Users> findUserLikeName(String user_name);
}
