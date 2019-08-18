package com.controller;

import com.entity.*;
import com.service.IAddressService;
import com.service.ICartService;
import com.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IAddressService addressService;
    @Autowired
    private ICartService cartService;

    /**
     * 下单 未测试
     * @author: wxj
     * @param addr  判断 这是单个还是数组
     * @param goodslist
     * @param singleTotal
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("takeOrder")
    @ResponseBody
    public String takeOrder(Integer addr, Integer [] goodslist,double singleTotal, Model model, HttpServletRequest request){
        Address address = addressService.findAddressById(addr);
        String order_address = address.getAddr_province() + address.getAddr_city() + address.getAddr_area() + address.getAddr_detail();
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        Order preOrder = new Order(user,new Date(),singleTotal,0,address.getAddr_nickname(),address.getAddr_phone(),order_address);
        List<OrderDetail> detailList = new ArrayList<OrderDetail>();
        for(Integer id : goodslist){
            Cart cart = cartService.findCartById(id);
            OrderDetail detail = new OrderDetail(cart.getCart_goods(),cart.getCart_price(),cart.getCart_num());
            detailList.add(detail);
        }
        preOrder.setDetailList(detailList);
        Order order = orderService.takeOrder(preOrder);
        model.addAttribute("order",order);
        return "user/takeorder";
    }

    @RequestMapping("payForOrder")
    @ResponseBody
    public String payForOrder(String orderId){
        Integer rs = orderService.payForOrder(orderId);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }
}
