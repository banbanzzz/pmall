package com.mapper;

import com.entity.Cities;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityMapper {
    Cities findCityByName(String name,String province_id);
    Cities findCityById(String id);
    List<Cities> findCitiesByProvinceId(String province_id);
}
