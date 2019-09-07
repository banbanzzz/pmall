package com.controller;

import com.entity.*;
import com.service.IAddressService;
import com.service.IProCityAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private IAddressService addressService;
    @Autowired
    private IProCityAreaService service;

    @RequestMapping("findAddressByUserId")
    @ResponseBody
    public List<Address> findAddressByUserId(HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        List<Address> list = addressService.findAddressByUserId(user.getUser_id());
        return list;
    }

    @RequestMapping("addAddress")
    @ResponseBody
    public String addAddress(Address addr,HttpServletRequest request){
        addr.setAddr_province(service.findProvinceById(addr.getAddr_province()).getProvince_name());
        addr.setAddr_city(service.findCityById(addr.getAddr_city()).getCity_name());
        addr.setAddr_area(service.findAreaById(addr.getAddr_area()).getArea_name());
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        addr.setAddr_user(user.getUser_id());
        Integer rs = addressService.addAddress(addr);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("modifyAddress")
    @ResponseBody
    public String modifyAddress(Address addr){
        addr.setAddr_province(service.findProvinceById(addr.getAddr_province()).getProvince_name());
        addr.setAddr_city(service.findCityById(addr.getAddr_city()).getCity_name());
        addr.setAddr_area(service.findAreaById(addr.getAddr_area()).getArea_name());
        Integer rs = addressService.updateAddress(addr);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteAddress")
    @ResponseBody
    public String deleteAddress(Integer addr_id){
        Integer rs = addressService.deleteAddress(addr_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findAddressById")
    @ResponseBody
    public Address findAddressById(Integer addr_id){
        Address address = addressService.findAddressById(addr_id);
        Provinces province = service.findProvinceByName(address.getAddr_province());
        Cities city = service.findCityByName(address.getAddr_city(),province.getProvince_id());
        Areas area = service.findAreaByName(address.getAddr_area(),city.getCity_id());
        address.setAddr_province(province.getProvince_id());
        address.setAddr_city(city.getCity_id());
        address.setAddr_area(area.getArea_id());
        return address;
    }
}
