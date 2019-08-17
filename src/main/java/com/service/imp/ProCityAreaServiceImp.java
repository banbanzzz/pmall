package com.service.imp;

import com.entity.Areas;
import com.entity.Cities;
import com.entity.Provinces;
import com.mapper.AreaMapper;
import com.mapper.CityMapper;
import com.mapper.ProvinceMapper;
import com.service.IProCityAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProCityAreaServiceImp implements IProCityAreaService {
    @Autowired
    private ProvinceMapper provinceMapper;
    @Autowired
    private CityMapper cityMapper;
    @Autowired
    private AreaMapper areaMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Provinces> findAllProvinces() {
        return provinceMapper.findAllProvince();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Cities> findCityByProvincesId(String province_id) {
        return cityMapper.findCitiesByProvinceId(province_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Areas> findAreasByCityId(String city_id) {
        return areaMapper.findAreasByCityId(city_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Provinces findProvinceById(String id) {
        return provinceMapper.findProById(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Cities findCityById(String id) {
        return cityMapper.findCityById(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Areas findAreaById(String id) {
        return areaMapper.findAreaById(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Provinces findProvinceByName(String name) {
        return provinceMapper.findProByName(name);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Cities findCityByName(String name, String province_id) {
        return cityMapper.findCityByName(name, province_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Areas findAreaByName(String name, String city_id) {
        return areaMapper.findAreaByName(name, city_id);
    }
}
