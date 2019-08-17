package com.mapper;

import com.entity.Cart;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartMapper {
    Integer addCart(Cart cart);
    Integer deleteCart(Integer id);
    Integer updateCart(Cart cart);
    Cart findCartById(Integer id);
    Cart findCartByUserId(Integer user_id,Integer goods_id);
    List<Cart> findCartListByUserId(Integer user_id);
}
