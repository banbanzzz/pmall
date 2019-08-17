package com.mapper;

import com.entity.Areas;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AreaMapper {
    Areas findAreaById(String id);
    Areas findAreaByName(String name,String city_id);
    List<Areas> findAreasByCityId(String city_id);
}
