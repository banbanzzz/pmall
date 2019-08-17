package com.mapper;

import com.entity.Provinces;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProvinceMapper {
    Provinces findProByName(String name);
    Provinces findProById(String id);
    List<Provinces> findAllProvince();
}
