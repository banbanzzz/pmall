package com.service;

import com.entity.Address;
import com.entity.Areas;
import com.entity.Cities;
import com.entity.Provinces;

import java.util.List;

public interface IAddressService {
    List<Address> findAddressByUserId(Integer user_id);
    Address findAddressById(Integer id);
    Provinces findProByProName(String name);
    Cities findCityByCityName(String name, String province_id);
    Areas findAreaByAreaName(String name, String city_id);
    Integer addAddress(Address address);
    Integer deleteAddress(Integer id);
    Integer updateAddress(Address address);
}
