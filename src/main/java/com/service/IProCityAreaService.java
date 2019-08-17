package com.service;

import com.entity.Areas;
import com.entity.Cities;
import com.entity.Provinces;

import java.util.List;

public interface IProCityAreaService {
    List<Provinces> findAllProvinces();
    List<Cities> findCityByProvincesId(String province_id);
    List<Areas> findAreasByCityId(String city_id);
    Provinces findProvinceById(String id);
    Cities findCityById(String id);
    Areas findAreaById(String id);
    Provinces findProvinceByName(String name);
    Cities findCityByName(String name,String province_id);
    Areas findAreaByName(String name,String city_id);
}
