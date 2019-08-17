package com.service;

import com.entity.Users;
import com.github.pagehelper.PageInfo;

public interface IUserService {
    Users login(String user_name,String user_pass);
    Users findUserById(Integer user_id);
    Integer addUser(Users user);
    Integer deleteUser(Integer user_id);
    Integer updateUser(Users user);
    Integer changeUserState(Integer user_state,Integer user_id);
    PageInfo<Users> findAllUsersBySplitPage(Integer page, Integer limit, String keyword);
}
