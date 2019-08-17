package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.GoodsType;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController {
    @Autowired
    private IGoodsTypeService goodsTypeService;

    @RequestMapping("findAll")
    @ResponseBody
    public List<GoodsType> findAllType(){
        return goodsTypeService.findAllType();
    }

    @RequestMapping("findTypeBySplitPage")
    @ResponseBody
    public JSONObject findTypeBySplitPage(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit, String keyword){
        PageInfo<GoodsType> info = goodsTypeService.findTypeBySplitPage(page, limit, keyword);
        JSONObject obj = new JSONObject();
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("deleteGoodsType")
    @ResponseBody
    public String deleteGoodsType(Integer type_id){
        Integer rs = goodsTypeService.deleteGoodsType(type_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("updateGoodsType")
    @ResponseBody
    public String updateGoodsType(GoodsType type){
        Integer rs = goodsTypeService.updateGoodsType(type);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("changeTypeState")
    @ResponseBody
    public String changeTypeState(Integer state,Integer type_id){
        Integer rs = goodsTypeService.changeTypeState(state, type_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("batchDelete")
    @ResponseBody
    public String batchDelete(String batch){
        String[] list = batch.split(",");
        boolean flag = true;
        for(String id : list){
            Integer type_id = Integer.valueOf(id);
            Integer rs = goodsTypeService.deleteGoodsType(type_id);
            if(rs < 0){
                flag = false;
            }
        }
        if(flag){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("addGoodsType")
    @ResponseBody
    public String addGoodsType(GoodsType type){
        Integer rs = goodsTypeService.addGoodsType(type);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }
}
