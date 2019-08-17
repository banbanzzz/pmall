package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 订单表实体对象
 *
 * @author Wxj
 * @date 2019年8月1日20:00:40
 */
public class Order implements Serializable {
    private String order_id;
    private Users order_user;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date order_date;
    private double order_price;
    private Integer order_state;
    private String order_username;
    private String order_phone;
    private String order_address;
    private String order_expressno;
    private List<OrderDetail> detailList;

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrder_expressno() {
        return order_expressno;
    }

    public void setOrder_expressno(String order_expressno) {
        this.order_expressno = order_expressno;
    }

    public Users getOrder_user() {
        return order_user;
    }

    public void setOrder_user(Users order_user) {
        this.order_user = order_user;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getOrder_price() {
        return order_price;
    }

    public void setOrder_price(double order_price) {
        this.order_price = order_price;
    }

    public Integer getOrder_state() {
        return order_state;
    }

    public void setOrder_state(Integer order_state) {
        this.order_state = order_state;
    }

    public String getOrder_username() {
        return order_username;
    }

    public void setOrder_username(String order_username) {
        this.order_username = order_username;
    }

    public String getOrder_phone() {
        return order_phone;
    }

    public void setOrder_phone(String order_phone) {
        this.order_phone = order_phone;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public List<OrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<OrderDetail> detailList) {
        this.detailList = detailList;
    }

    public Order(String order_id, Users order_user, Date order_date, double order_price, Integer order_state, String order_username,
                 String order_phone, String order_address, String order_expressno, List<OrderDetail> detailList) {
        super();
        this.order_id = order_id;
        this.order_user = order_user;
        this.order_date = order_date;
        this.order_price = order_price;
        this.order_state = order_state;
        this.order_username = order_username;
        this.order_phone = order_phone;
        this.order_address = order_address;
        this.order_expressno = order_expressno;
        this.detailList = detailList;
    }

    public Order(String order_id, Users order_user, Date order_date, double order_price, Integer order_state, String order_username,
                 String order_phone, String order_address) {
        super();
        this.order_id = order_id;
        this.order_user = order_user;
        this.order_date = order_date;
        this.order_price = order_price;
        this.order_state = order_state;
        this.order_username = order_username;
        this.order_phone = order_phone;
        this.order_address = order_address;
    }

    public Order(Users order_user, Date order_date, double order_price, Integer order_state, String order_username,
                 String order_phone, String order_address) {
        super();
        this.order_user = order_user;
        this.order_date = order_date;
        this.order_price = order_price;
        this.order_state = order_state;
        this.order_username = order_username;
        this.order_phone = order_phone;
        this.order_address = order_address;
    }

    public Order() {
        super();
    }
}
