package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Admins;
import com.entity.Role;
import com.github.pagehelper.PageInfo;
import com.service.IAdminService;
import com.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Scope("prototype")
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;

    @RequestMapping("login")
    @ResponseBody
    public String login(String admin_name, String admin_pass, HttpServletRequest request){
        Admins admin = adminService.login(admin_name,MD5Util.passToMD5(admin_pass));
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
        return "forward:/view/admin";
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

    @RequestMapping("addAdmin")
    @ResponseBody
    public String addAdmin(Admins admin){
        admin.setAdmin_pass(MD5Util.passToMD5(admin.getAdmin_pass()));
        Integer rs = adminService.addAdmin(admin);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("adminInfo")
    public String adminInfo(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Admins admin = (Admins)session.getAttribute("admin");
        model.addAttribute("admin",admin);
        return "admin/info";
    }

    @RequestMapping("updateAdmin")
    @ResponseBody
    public String updateAdmin(Admins admin){
        Integer rs = adminService.updateAdmin(admin);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteAdmin")
    @ResponseBody
    public String deleteAdmin(Integer admin_id){
        Integer rs = adminService.deleteAdmin(admin_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("batchDelete")
    @ResponseBody
    public String batchDelete(String batch){
        String [] list = batch.split(",");
        boolean flag = true;
        for(String id : list){
            Integer admin_id = Integer.valueOf(id);
            Integer rs = adminService.deleteAdmin(admin_id);
            if(rs < 0){
                flag = false;
            }
        }
        if(flag){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("changeAdminState")
    @ResponseBody
    public String changeAdminState(Integer state,Integer admin_id){
        Integer rs = adminService.changeAdminState(state, admin_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findAll")
    @ResponseBody
    public JSONObject findAllAdmins(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit", defaultValue = "10") Integer limit){
        PageInfo<Admins> info = adminService.findAllAdminsBySplitPage(page, limit);
        JSONObject obj = new JSONObject();
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("findAllRole")
    @ResponseBody
    public List<Role> findAllRole(){
        return adminService.findAllRole();
    }
}
