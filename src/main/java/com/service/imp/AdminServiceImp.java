package com.service.imp;

import com.entity.Admins;
import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.AdminMapper;
import com.mapper.RoleMapper;
import com.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminServiceImp implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Role> findAllRole() {
        return roleMapper.findAllRole();
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteAdmin(Integer admin_id) {
        return adminMapper.deleteAdmin(admin_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer changeAdminState(Integer state, Integer admin_id) {
        return adminMapper.changeAdminState(state, admin_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addAdmin(Admins admin) {
        return adminMapper.addAdmin(admin);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<Admins> findAllAdminsBySplitPage(Integer page, Integer limit){
        PageHelper.startPage(page,limit);
        List<Admins> list = adminMapper.findAllAdmin();
        PageInfo<Admins> info = new PageInfo<Admins>(list);
        return info;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Admins login(String admin_name, String admin_pass) {
        List<Admins> list = adminMapper.findAdminByName(admin_name);
        for(Admins admin : list){
            if(admin.getAdmin_pass().equals(admin_pass)){
                return admin;
            }
        }
        return null;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateAdmin(Admins admin) {
        return adminMapper.updateAdmin(admin);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Admins findAdminById(Integer id) {
        return adminMapper.findAdminById(id);
    }
}
