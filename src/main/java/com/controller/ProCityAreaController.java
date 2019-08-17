package com.controller;

import com.entity.Areas;
import com.entity.Cities;
import com.entity.Provinces;
import com.service.IProCityAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/proCityArea")
public class ProCityAreaController {
    @Autowired
    private IProCityAreaService service;

    @RequestMapping("findAllPro")
    @ResponseBody
    public List<Provinces> findAllProvinces(){
        return service.findAllProvinces();
    }

    @RequestMapping("findCityByProId")
    @ResponseBody
    public List<Cities> findCityByProId(String province_id){
        return service.findCityByProvincesId(province_id);
    }

    @RequestMapping("findAreaByCityId")
    @ResponseBody
    public List<Areas> findAreaByCityId(String city_id){
        return service.findAreasByCityId(city_id);
    }
}
