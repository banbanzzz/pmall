package com.controller;


import com.alibaba.fastjson.JSONObject;
import com.entity.Users;
import com.github.pagehelper.PageInfo;
import com.service.IUserService;
import com.util.MD5Util;
import com.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("login")
    @ResponseBody
    public String login(String user_name, String user_pass, HttpServletRequest request){
        Users user = userService.login(user_name,user_pass);
        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return "success";
        }
        return "fail";
    }

    @RequestMapping("logout")
    @ResponseBody
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "index";
    }

    @RequestMapping("register")
    @ResponseBody
    public String register(Users user){
        user.setUser_pass(MD5Util.passToMD5(user.getUser_pass()));
        Integer rs = userService.addUser(user);
        if(rs > 0){
            return "success";
        }else{
            return "fail";
        }
    }

    @RequestMapping("amendinfo")
    public String ModifyInfo(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        model.addAttribute("user",user);
        return "user/amend_info";
    }

    @RequestMapping("upload")
    @ResponseBody
    public JSONObject uploadHeadPic(@RequestParam(value = "file",required = false)MultipartFile file,HttpServletRequest request){
        String str = file.getOriginalFilename();
        String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/upload") + "/" + name;
        try {
            file.transferTo(new File(path));
            System.out.println("文件写入成功,Path:" + path);
        }catch (IOException ex){
            ex.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("user_img", name);
        return obj;
    }

    @RequestMapping("updateUserInfo")
    public String updateUserInfo(Users user,Model model,HttpServletRequest request){
        Integer rs = userService.updateUser(user);
        Users u = userService.findUserById(user.getUser_id());
        HttpSession session = request.getSession();
        session.setAttribute("user",u);
        model.addAttribute("user",u);
        return "user/amend_info";
    }

    @RequestMapping("modifyUserPass")
    @ResponseBody
    public String modifyUserPass(String oldPass,String newPass,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        if(MD5Util.passToMD5(oldPass).equals(user.getUser_pass())){
            user.setUser_pass(MD5Util.passToMD5(newPass));
            userService.updateUser(user);
            session.removeAttribute("user");
            return "success";
        }else{
            return "fail";
        }
    }

    @RequestMapping("findAllUser")
    @ResponseBody
    public JSONObject findAllUser(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10")Integer limit,String keyword){
        PageInfo<Users> info = userService.findAllUsersBySplitPage(page,limit,keyword);
        JSONObject obj = new JSONObject();
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("changeUserState")
    @ResponseBody
    public String changeUserState(Integer state, Integer user_id){
        Integer rs = userService.changeUserState(state,user_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public String updateUser(Users user){
        Integer rs = userService.updateUser(user);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(Integer user_id){
        Integer rs = userService.deleteUser(user_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("batchDelete")
    @ResponseBody
    public String batchDelete(String batch_id){
        String [] list = batch_id.split(",");
        boolean flag = true;
        for(String id : list){
            Integer user_id = Integer.valueOf(id);
            Integer rs = userService.deleteUser(user_id);
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
}
