package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端视图控制器
 */
@Controller
@RequestMapping("/view")
public class ViewController {
    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @RequestMapping("register")
    public String register(){
        return "register";
    }

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    @RequestMapping("usercenter")
    public String userCenter(){
        return "user/usercenter";
    }

    @RequestMapping("cart")
    public String cart(){
        return "user/cart";
    }

    @RequestMapping("admin")
    public String adminLogin(){
        return "adminlogin";
    }

    @RequestMapping("adminIndex")
    public String adminIndex(){
        return "admin/index";
    }

    @RequestMapping("main")
    public String main(){
        return "admin/main";
    }

    @RequestMapping("userlist")
    public String userlist(){
        return "admin/userlist";
    }

    @RequestMapping("bannerlist")
    public String bannerlist(){
        return "admin/bannerlist";
    }

    @RequestMapping("addbanner")
    public String addbanner(){
        return "admin/banneradd";
    }

    @RequestMapping("goodslist")
    public String goodslist(){
        return "admin/goodslist";
    }

    @RequestMapping("addGoods")
    public String addGoods(){
        return "admin/addgoods";
    }

    @RequestMapping("evalist")
    public String evalist(){
        return "admin/evalist";
    }

    @RequestMapping("typelist")
    public String typelist(){
        return "admin/typelist";
    }

    @RequestMapping("adminlist")
    public String adminInfo(){
        return "admin/adminlist";
    }

    @RequestMapping("updatepass")
    public String updatePass(){
        return "admin/updatepass";
    }

    @RequestMapping("orderlist")
    public String orderList(){
        return "admin/orderlist";
    }
}
