package com.service.imp;

import com.entity.Order;
import com.entity.OrderDetail;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.OrderDetailMapper;
import com.mapper.OrderMapper;
import com.service.IOrderService;
import com.util.OrderSearchVO;
import com.util.OrderVO;
import com.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImp implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper detailMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Order takeOrder(Order order) {
        order.setOrder_id(UUIDUtil.getUUID());
        Integer rs = orderMapper.addOrder(order);
        if(rs > 0){
            List<OrderDetail> list = order.getDetailList();
            for(OrderDetail detail : list){
                detail.setDetail_order(order);
                detailMapper.addOrderDetail(detail);
            }
        }
        return order;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer payForOrder(String order_id) {
        return orderMapper.payOrder(order_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deliverOrder(String order_id, String expressNo) {
        return orderMapper.deliverOrder(order_id, expressNo);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer receiveOrder(String order_id) {
        return orderMapper.receiveOrder(order_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer evaOrder(String order_id) {
        return orderMapper.evaOrder(order_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteOrder(String order_id) {
        return orderMapper.deleteOrder(order_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Order findOrderById(String id) {
        Order order = orderMapper.findOrderById(id);
        order.setDetailList(detailMapper.findOrderDetailByOrderId(order.getOrder_id()));
        return order;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<OrderVO> findTotalMoneyByMonth(Integer limit) {
        return orderMapper.findTotalMoneyByMonth(limit);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Integer findTotalOrder() {
        return orderMapper.findTotalOrder();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Integer findTotalDeliverOrder() {
        return orderMapper.findTotalDeliverOrder();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Order> findOrdersByUserAndState(Integer user_id, Integer state) {
        List<Order> list = orderMapper.findOrderByUserAndState(state, user_id);
        for (Order order : list){
            order.setDetailList(detailMapper.findOrderDetailByOrderId(order.getOrder_id()));
        }
        return list;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<Order> findOrderBySplitPage(Integer page, Integer limit, OrderSearchVO vo) {
        PageHelper.startPage(page,limit);
        List<Order> list = new ArrayList<Order>();
        if(vo != null){
            list = orderMapper.findAllOrderBySearchVO(vo);
        }else {
            list = orderMapper.findAllOrder();
        }
        PageInfo<Order> info = new PageInfo<Order>(list);
        return info;
    }
}
