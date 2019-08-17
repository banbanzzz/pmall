package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Banner;
import com.github.pagehelper.PageInfo;
import com.service.IBannerService;
import com.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private IBannerService bannerService;

    @RequestMapping("findAllBanner")
    @ResponseBody
    public JSONObject findAllBanner(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit, String keyword){
        JSONObject obj = new JSONObject();
        PageInfo<Banner> info = bannerService.findAllBannerBySplitePage(page, limit, keyword);
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("updateBanner")
    @ResponseBody
    public String updateBanner(Banner banner){
        Integer rs = bannerService.updateBanner(banner);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteBanner")
    @ResponseBody
    public String deleteBanner(Integer banner_id){
        Integer rs = bannerService.deleteBanner(banner_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("changeBannerState")
    @ResponseBody
    public String changeBannerState(Integer state,Integer banner_id){
        Integer rs = bannerService.changeBannerState(state, banner_id);
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
            Integer banner_id = Integer.valueOf(id);
            Integer rs = bannerService.deleteBanner(banner_id);
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

    @RequestMapping("addBanner")
    @ResponseBody
    public String addBanner(Banner banner){
        Integer rs = bannerService.addBanner(banner);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("uploadBannerImg")
    @ResponseBody
    public JSONObject uploadBannerImg(@RequestParam(value = "file",required = false) MultipartFile file, HttpServletRequest request){
        String str = file.getOriginalFilename();
        String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/upload") + "/" + name;
        try {
            file.transferTo(new File(path));
            System.out.println("文件写入成功,Path:" + path);
        }catch (IOException e){
            e.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("banner_img",name);
        return obj;
    }
}
