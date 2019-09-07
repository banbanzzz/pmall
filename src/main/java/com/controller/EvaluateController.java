package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Evaluate;
import com.entity.Order;
import com.entity.OrderDetail;
import com.entity.Users;
import com.github.pagehelper.PageInfo;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import com.service.IOrderService;
import com.service.IRedisEvaluateService;
import com.util.Time;
import com.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {
    @Autowired
    private IEvaluateService evaluateService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IRedisEvaluateService redisService;

    @RequestMapping("addEvaluate")
    @ResponseBody
    public String addEvaluate(Evaluate eva, String imgUrls, String eva_order, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        Order order = orderService.findOrderById(eva_order);
        List<OrderDetail> list = order.getDetailList();
        String [] imgs = imgUrls.split(",");
        boolean flag = true;
        Integer state = 0;
        switch (eva.getEva_level()){
            case 1: case 2:
                state = 0;
                break;
            case 3:
                state = 1;
                break;
            case 4: case 5:
                state = 2;
                break;
            default: break;
        }
        for(OrderDetail detail : list){
            eva.setEva_goods(detail.getDetail_goods());
            eva.setEva_date(Time.getDate());
            eva.setEva_user(user);
            eva.setEva_state(state);
            Integer rs = evaluateService.addEvaluate(eva,imgs);
            if(rs < 0){
                flag = false;
            }
            redisService.RefreshEvaluate(detail.getDetail_goods().getGoods_id());
        }
        if(flag){
            orderService.evaOrder(eva_order);
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("uploadEvaImg")
    @ResponseBody
    public JSONObject uploadEvaImg(@RequestParam(value = "file",required = false)MultipartFile file,HttpServletRequest request) {
        String str = file.getOriginalFilename();
        String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/upload") + "/" + name;
        JSONObject obj = new JSONObject();
        try {
            file.transferTo(new File(path));
            obj.put("src", name);
            obj.put("code", 0);
        } catch (IOException e) {
            e.printStackTrace();
            obj.put("code", 200);
        }
        return obj;
    }

    @RequestMapping("findAll")
    @ResponseBody
    public JSONObject findAllEvaluates(@RequestParam(value = "page",defaultValue = "1")Integer page,@RequestParam(value = "limit",defaultValue = "10")Integer limit,String keyword){
        PageInfo<Evaluate> info = evaluateService.findAllEvaluate(page, limit, keyword);
        JSONObject obj = new JSONObject();
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("deleteEva")
    @ResponseBody
    public String deleteEva(Integer eva_id){
        Evaluate evaluate = evaluateService.findEvaluateById(eva_id);
        Integer rs = evaluateService.deleteEvaluate(eva_id);
        if(rs > 0){
            redisService.RefreshEvaluate(evaluate.getEva_goods().getGoods_id());
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
            Integer eva_id = Integer.valueOf(id);
            Evaluate evaluate = evaluateService.findEvaluateById(eva_id);
            Integer rs = evaluateService.deleteEvaluate(eva_id);
            if(rs < 0){
                flag = false;
            }
            redisService.RefreshEvaluate(evaluate.getEva_goods().getGoods_id());
        }
        if(flag){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findEvaById")
    @ResponseBody
    public Evaluate findEvaluateById(Integer eva_id){
        return evaluateService.findEvaluateById(eva_id);
    }
}
