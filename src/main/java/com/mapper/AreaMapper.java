package com.mapper;

import com.entity.Areas;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AreaMapper {
    Areas findAreaById(String id);
    Areas findAreaByName(@Param("name") String name,@Param("city_id") String city_id);
    List<Areas> findAreasByCityId(String city_id);
}
