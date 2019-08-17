package com.service.imp;

import com.entity.Users;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.UserMapper;
import com.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImp implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    @Override
    public Users findUserById(Integer user_id) {
        return userMapper.findUserById(user_id);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    @Override
    public Users login(String user_name, String user_pass) {
        List<Users> usersList = userMapper.findUserByName(user_name);
        for (Users user : usersList) {
            if (user.getUser_pass().equals(user_pass)) {
                return user;
            }
        }
        return null;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public Integer addUser(Users user) {
        return userMapper.addUser(user);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public Integer deleteUser(Integer user_id) {
        return userMapper.deleteUser(user_id);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public Integer updateUser(Users user) {
        return userMapper.updateUser(user);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public Integer changeUserState(Integer user_state, Integer user_id) {
        return userMapper.changeUserState(user_state, user_id);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    @Override
    public PageInfo<Users> findAllUsersBySplitPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page, limit);
        List<Users> list = new ArrayList<Users>();
        if (keyword != null && !keyword.trim().equals("")) {
            list = userMapper.findUserLikeName(keyword);
        } else {
            list = userMapper.findAllUser();
        }
        PageInfo<Users> info = new PageInfo<Users>(list);
        return info;
    }
}
