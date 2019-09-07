package com.mapper;

import com.util.OrderSearchVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface OrderSearchVOMapper {
    Integer addOrderSerchVo(OrderSearchVO vo);
    Integer updateOrderSearchVo(@Param("orderState") Integer orderState,@Param("orderId") String orderId);
    Integer updateEndDate(@Param("endDate") String endDate,@Param("orderState") Integer orderState,@Param("orderId") String orderId);
    OrderSearchVO findByOrderId(String orderId);
}
