package com.controller;

import com.entity.Admins;
import com.service.IAdminService;
import com.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Scope("prototype")
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;

    @RequestMapping("login")
    @ResponseBody
    public String login(String admin_name, String admin_pass, HttpServletRequest request){
        Admins admin = adminService.login(admin_name,admin_pass);
        if(admin != null){
            HttpSession session = request.getSession();
            session.setAttribute("admin",admin);
            return "success";
        }
        return "fail";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return "forword:/view/admin";
    }

    @RequestMapping("updatePass")
    @ResponseBody
    public String updatePass(String oldPass,String newPass,HttpServletRequest request){
        HttpSession session = request.getSession();
        Admins admin = (Admins)session.getAttribute("admin");
        if(MD5Util.passToMD5(oldPass).equals(admin.getAdmin_pass())){
            admin.setAdmin_pass(MD5Util.passToMD5(newPass));
            adminService.updateAdmin(admin);
            session.removeAttribute("admin");
            return "success";
        }
        return "fail";
    }
}
