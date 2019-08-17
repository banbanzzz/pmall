package com.entity;

import java.io.Serializable;

/**
 * 购物车表实体对象
 *
 * @author Wxj
 * @date 2019年8月1日20:14:21
 */
public class Cart implements Serializable {
    private Integer cart_id;
    private Goods cart_goods;
    private Users cart_user;
    private Integer cart_num;
    private double cart_price;

    public Integer getCart_id() {
        return cart_id;
    }

    public void setCart_id(Integer cart_id) {
        this.cart_id = cart_id;
    }

    public Goods getCart_goods() {
        return cart_goods;
    }

    public void setCart_goods(Goods cart_goods) {
        this.cart_goods = cart_goods;
    }

    public Users getCart_user() {
        return cart_user;
    }

    public void setCart_user(Users cart_user) {
        this.cart_user = cart_user;
    }

    public Integer getCart_num() {
        return cart_num;
    }

    public void setCart_num(Integer cart_num) {
        this.cart_num = cart_num;
    }

    public double getCart_price() {
        return cart_price;
    }

    public void setCart_price(double cart_price) {
        this.cart_price = cart_price;
    }

    public Cart() {
        super();
    }

    public Cart(Integer cart_id, Goods cart_goods, Integer cart_num, double cart_price, Users cart_user) {
        super();
        this.cart_id = cart_id;
        this.cart_goods = cart_goods;
        this.cart_num = cart_num;
        this.cart_price = cart_price;
        this.cart_user = cart_user;
    }

    public Cart(Goods cart_goods, Integer cart_num, double cart_price, Users cart_user) {
        super();
        this.cart_goods = cart_goods;
        this.cart_num = cart_num;
        this.cart_price = cart_price;
        this.cart_user = cart_user;
    }
}
