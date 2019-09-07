package com.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.*;
import com.github.pagehelper.PageInfo;
import com.service.IAddressService;
import com.service.ICartService;
import com.service.IGoodsService;
import com.service.IOrderService;
import com.util.OrderSearchVO;
import com.util.OrderVO;
import com.util.Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.awt.image.IntegerComponentRaster;

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
    @Autowired
    private IGoodsService goodsService;

    /**
     * 下单 判断库存
     * @author: wxj
     * @param addr
     * @param goodslist
     * @param request
     * @return
     */
    @RequestMapping("takeOrder")
    public String takeOrder(Integer addr, Integer [] goodslist, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        int flag = 1;
        for(Integer id : goodslist){
            Cart cart = cartService.findCartById(id);
            if(cart.getCart_goods().getGoods_num() < cart.getCart_num()){
                flag = 0;
            }
        }
        //刷新页面清除session
        if(flag == 0){
            redirectAttributes.addFlashAttribute("errmsg","库存不足，购买失败！");
            return "redirect:/cart/confirm_order";
        }else{
            double totalPrice = 0.0;
            List<OrderDetail> detailList = new ArrayList<OrderDetail>();
            for(Integer id : goodslist){
                    Cart cart = cartService.findCartById(id);
                    totalPrice += cart.getCart_price() * cart.getCart_num();
                    OrderDetail detail = new OrderDetail(cart.getCart_goods(), cart.getCart_price(), cart.getCart_num());
                    detailList.add(detail);
                    goodsService.reduceGoodsVolume(cart.getCart_num(),cart.getCart_goods().getGoods_id());
                    cartService.deleteCart(cart.getCart_id());
                    if(goodsService.findGoodsById(cart.getCart_goods().getGoods_id()).getGoods_num() == 0){
                        goodsService.outOfStock(cart.getCart_goods().getGoods_id());
                    }
            }
            Address address = addressService.findAddressById(addr);
            String order_address = address.getAddr_province() + address.getAddr_city() + address.getAddr_area() + address.getAddr_detail();
            Users user = (Users)session.getAttribute("user");
            Order preOrder = new Order(user, Time.getDate(),totalPrice,1,address.getAddr_nickname(),address.getAddr_phone(),order_address);
            preOrder.setDetailList(detailList);
            Order order = orderService.takeOrder(preOrder);
            session.setAttribute("order",order);
            return "redirect:/order/toOrder";
        }
    }
    @RequestMapping("toOrder")
    public String toOrder(HttpSession session,Model model){
        model.addAttribute("order",session.getAttribute("order"));
        session.removeAttribute("cartList");
        session.removeAttribute("addressList");
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

    @RequestMapping("findOrderByUserAndState")
    @ResponseBody
    public List<Order> findOrderByUserAndState(Integer state,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        List<Order> list = orderService.findOrdersByUserAndState(user.getUser_id(),state);
        return list;
    }

    @RequestMapping("receiveOrder")
    @ResponseBody
    public String receiveOrder(String order_id){
        Integer rs = orderService.receiveOrder(order_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteOrder")
    @ResponseBody
    public String deleteOrder(String order_id){
        Integer rs = orderService.deleteOrder(order_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findOrderById")
    @ResponseBody
    public Order findOrderById(String order_id){
        return orderService.findOrderById(order_id);
    }

    @RequestMapping("updateOrder")
    @ResponseBody
    public String updateOrder(Order order){
        Integer rs = orderService.updateOrder(order);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findOrderBySplitPage")
    @ResponseBody
    public JSONObject findOrderBySplitPage(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "limit",defaultValue = "10") Integer limit, OrderSearchVO vo){
        PageInfo<Order> info = orderService.findOrderBySplitPage(page, limit, vo);
        JSONObject obj = new JSONObject();
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("deliverOrder")
    @ResponseBody
    public String deliverOrder(String order_id,String express_no){
        Integer rs = orderService.deliverOrder(order_id, express_no);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findTotalOrder")
    @ResponseBody
    public JSONObject findTotalOrder(Integer limit){
        List<OrderVO> list = orderService.findTotalMoneyByMonth(limit);
        ArrayList<String> month = new ArrayList<String>();
        ArrayList<Integer> sheets = new ArrayList<Integer>();
        ArrayList<Long> total = new ArrayList<Long>();
        for(OrderVO vo : list){
            month.add(vo.getOrderMonth());
            sheets.add(vo.getSheets());
            total.add(vo.getTotalMoney());
        }
        JSONObject obj = new JSONObject();
        obj.put("month",month);
        obj.put("sheets",sheets);
        obj.put("total",total);
        return obj;
    }

    @RequestMapping("findEvent")
    @ResponseBody
    public JSONObject findEvent(){
        Integer total = orderService.findTotalOrder();
        Integer deliver = orderService.findTotalDeliverOrder();
        JSONObject obj = new JSONObject();
        obj.put("total",total);
        obj.put("delever",deliver);
        return obj;
    }
}
