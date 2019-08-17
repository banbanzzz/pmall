package com.service.imp;

import com.entity.Cart;
import com.mapper.CartMapper;
import com.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImp implements ICartService {
    @Autowired
    private CartMapper cartMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGoodsToCart(Cart cart) {
        return cartMapper.addCart(cart);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateCart(Cart cart) {
        return cartMapper.updateCart(cart);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteCart(Integer cart_id) {
        return cartMapper.deleteCart(cart_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Cart findCartById(Integer cart_id) {
        return cartMapper.findCartById(cart_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Cart findCartByUserId(Integer user_id, Integer goods_id) {
        return cartMapper.findCartByUserId(user_id, goods_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Cart> findCartByUserId(Integer user_id) {
        return cartMapper.findCartListByUserId(user_id);
    }
}
