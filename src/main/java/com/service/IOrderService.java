package com.service;

import com.entity.Order;
import com.github.pagehelper.PageInfo;
import com.util.OrderSearchVO;
import com.util.OrderVO;

import java.util.List;

public interface IOrderService {
    Order takeOrder(Order order);
    Integer payForOrder(String order_id);  //支付
    Integer deliverOrder(String order_id,String expressNo); //发货
    Integer receiveOrder(String order_id); //收货
    Integer evaOrder(String order_id); //评价
    Integer deleteOrder(String order_id);
    Integer updateOrder(Order order);
    Order findOrderById(String id);
    List<OrderVO> findTotalMoneyByMonth(Integer limit);
    Integer findTotalOrder();
    Integer findTotalDeliverOrder();
    List<Order> findOrdersByUserAndState(Integer user_id,Integer state);
    PageInfo<Order> findOrderBySplitPage(Integer page, Integer limit, OrderSearchVO vo);
}
