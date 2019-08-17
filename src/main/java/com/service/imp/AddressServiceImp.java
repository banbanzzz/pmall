package com.service.imp;

import com.entity.Address;
import com.entity.Areas;
import com.entity.Cities;
import com.entity.Provinces;
import com.mapper.AddressMapper;
import com.mapper.AreaMapper;
import com.mapper.CityMapper;
import com.mapper.ProvinceMapper;
import com.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AddressServiceImp implements IAddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Autowired
    private ProvinceMapper provinceMapper;
    @Autowired
    private CityMapper cityMapper;
    @Autowired
    private AreaMapper areaMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Address> findAddressByUserId(Integer user_id) {
        return addressMapper.findAddrByUserId(user_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Address findAddressById(Integer id) {
        return addressMapper.findAddrById(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Provinces findProByProName(String name) {
        return provinceMapper.findProByName(name);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Cities findCityByCityName(String name, String province_id) {
        return cityMapper.findCityByName(name, province_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Areas findAreaByAreaName(String name, String city_id) {
        return areaMapper.findAreaByName(name, city_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addAddress(Address address) {
        return addressMapper.addAddress(address);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteAddress(Integer id) {
        return addressMapper.deleteAddress(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateAddress(Address address) {
        return addressMapper.updateAddress(address);
    }
}
