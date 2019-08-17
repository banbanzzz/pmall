package com.mapper;

import com.entity.Order;
import com.util.OrderSearchVO;
import com.util.OrderVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    Order findOrderById(String order_id);
    Integer addOrder(Order order);
    Integer deleteOrder(String order_id);
    Integer payOrder(String order_id);
    Integer deliverOrder(String order_id,String expressNo);
    Integer receiveOrder(String order_id);
    Integer evaOrder(String order_id);
    Integer updateOrder(Order order);
    List<Order> findAllOrder();
    List<Order> findAllOrderByUser(Integer user_id);
    List<Order> findOrderByUserAndState(Integer state,Integer user_id);
    Integer findTotalOrder();
    Integer findTotalDeliverOrder();
    List<Order> findAllOrderBySearchVO(OrderSearchVO vo);
    List<OrderVO> findTotalMoneyByMonth(Integer limit);
}
