package com.util;

import java.util.Date;

/**
 * 订单状态表实体对象
 */
public class OrderSearchVO {
    private String orderId;  //订单编号
    private String startDate; //起始日期
    private String endDate; //结束日期
    private Integer orderState; //订单状态  0：待付款 2：待发货（已付款）3：待收货（已发货）4：待评价（已收货） 5、完成

    public OrderSearchVO() {
        super();
    }

    public OrderSearchVO(String orderId, String startDate, String endDate, Integer orderState) {
        this.orderId = orderId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.orderState = orderState;
    }

    public OrderSearchVO(String orderId, String startDate) {
        this.orderId = orderId;
        this.startDate = startDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }
}
