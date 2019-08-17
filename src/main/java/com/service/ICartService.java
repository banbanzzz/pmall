package com.service;

import com.entity.Cart;

import java.util.List;

public interface ICartService {
    Integer addGoodsToCart(Cart cart);
    Integer updateCart(Cart cart);
    Integer deleteCart(Integer cart_id);
    Cart findCartById(Integer cart_id);
    Cart findCartByUserId(Integer user_id,Integer goods_id);
    List<Cart> findCartByUserId(Integer user_id);
}
