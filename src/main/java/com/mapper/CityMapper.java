package com.mapper;

import com.entity.Cities;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityMapper {
    Cities findCityByName(@Param("name") String name,@Param("province_id") String province_id);
    Cities findCityById(String id);
    List<Cities> findCitiesByProvinceId(String province_id);
}
