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


}
