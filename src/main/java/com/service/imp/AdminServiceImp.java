package com.service.imp;

import com.entity.Admins;
import com.mapper.AdminMapper;
import com.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminServiceImp implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;

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
