package com.mapper;

import com.entity.OrderDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailMapper {
    Integer addOrderDetail(OrderDetail detail);
    OrderDetail findOrderDetailById(Integer id);
    Integer updateOrderDetail(OrderDetail detail);
    List<OrderDetail> findOrderDetailByOrderId(String order_id);
}
