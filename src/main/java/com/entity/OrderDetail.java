package com.entity;

import java.io.Serializable;

/**
 * 订单详情表实体对象
 * @author Wxj
 * @date 2019年8月1日20:04:38
 */
public class OrderDetail implements Serializable {
    private Integer detail_id;
    private Order detail_order;
    private Goods detail_goods;
    private double detail_price;
    private Integer detail_num;

    public Integer getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(Integer detail_id) {
        this.detail_id = detail_id;
    }

    public Order getDetail_order() {
        return detail_order;
    }

    public void setDetail_order(Order detail_order) {
        this.detail_order = detail_order;
    }

    public Goods getDetail_goods() {
        return detail_goods;
    }

    public void setDetail_goods(Goods detail_goods) {
        this.detail_goods = detail_goods;
    }

    public double getDetail_price() {
        return detail_price;
    }

    public void setDetail_price(double detail_price) {
        this.detail_price = detail_price;
    }

    public Integer getDetail_num() {
        return detail_num;
    }

    public void setDetail_num(Integer detail_num) {
        this.detail_num = detail_num;
    }

    public OrderDetail() {
        super();
    }

    public OrderDetail(Goods detail_goods, double detail_price, Integer detail_num) {
        super();
        this.detail_goods = detail_goods;
        this.detail_price = detail_price;
        this.detail_num = detail_num;
    }

    public OrderDetail(Integer detail_id, Order detail_order, Goods detail_goods, double detail_price, Integer detail_num) {
        super();
        this.detail_id = detail_id;
        this.detail_order = detail_order;
        this.detail_goods = detail_goods;
        this.detail_price = detail_price;
        this.detail_num = detail_num;
    }
}
