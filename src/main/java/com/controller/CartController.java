package com.controller;

import com.entity.Address;
import com.entity.Cart;
import com.entity.Goods;
import com.entity.Users;
import com.service.IAddressService;
import com.service.ICartService;
import com.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private ICartService cartService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IAddressService addressService;

    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(Integer goods_id, Integer num, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        Cart cart = cartService.findCartByUserId(user.getUser_id(),goods_id);
        if(cart != null){
            cart.setCart_num(cart.getCart_num() + num);
            cartService.updateCart(cart);
        }else {
            Goods goods = goodsService.findGoodsById(goods_id);
            Cart c = new Cart(goods,num,goods.getGoods_price(),user);
            cartService.addGoodsToCart(c);
        }
        return "success";
    }

    @RequestMapping("findCartByUser")
    @ResponseBody
    public List<Cart> findCartByUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        return cartService.findCartByUserId(user.getUser_id());
    }

    @RequestMapping("deleteCart")
    @ResponseBody
    public String deleteCart(Integer cart_id){
        Integer rs = cartService.deleteCart(cart_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("addCartNum")
    @ResponseBody
    public String addCartNum(Integer cart_id){
        Cart cart = cartService.findCartById(cart_id);
        cart.setCart_num(cart.getCart_num() + 1);
        Integer rs = cartService.updateCart(cart);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("reduceCartNum")
    @ResponseBody
    public String reduceCartNum(Integer cart_id){
        Cart cart = cartService.findCartById(cart_id);
        cart.setCart_num(cart.getCart_num() - 1);
        Integer rs = cartService.updateCart(cart);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("createOrder")
    public String createOrder(Integer [] goodslist, HttpServletRequest request){
        List<Cart> cartList = new ArrayList<Cart>();
        for(Integer id : goodslist){
            Cart cart = cartService.findCartById(id);
            cartList.add(cart);
        }
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        List<Address> addressList = addressService.findAddressByUserId(user.getUser_id());
        session.setAttribute("cartList",cartList);
        session.setAttribute("addressList",addressList);
        return "redirect:/cart/confirm_order";
    }
    @RequestMapping("/confirm_order")
    public String confirm_order(HttpSession session,Model model){
        model.addAttribute("cartList",session.getAttribute("cartList"));
        model.addAttribute("addressList",session.getAttribute("addressList"));
        return "user/confirm_order";
    }
}
