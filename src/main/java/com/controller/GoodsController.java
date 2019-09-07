package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Evaluate;
import com.entity.Goods;
import com.github.pagehelper.PageInfo;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import com.util.GoodsTypeVO;
import com.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IEvaluateService evaluateService;

    @RequestMapping("findGoodsByType")
    @ResponseBody
    public List<Goods> findGoodsByType(Integer type_id) {
        return goodsService.findGoodsByType(type_id);
    }

    @RequestMapping("detail")
    public String goodsDetail(@RequestParam Integer goodsId, Model model, HttpServletRequest request) {
        Goods goods = goodsService.findGoodsById(goodsId);
        List<Evaluate> evaList = evaluateService.findEvaluateByGoods(goods.getGoods_id());
        request.setAttribute("goods", goods);
        model.addAttribute("evaList", evaList);
        return "user/product_detail";
    }

    @RequestMapping("findHotGoods")
    @ResponseBody
    public List<Goods> findHotGoods() {
        return goodsService.findHotGoods(4);
    }

    @RequestMapping("search")
    public String search(String KeyWord, Model model) {
        List<Goods> list = new ArrayList<Goods>();
        if (KeyWord != null && !KeyWord.equals("")) {
            list = goodsService.findGoodsLikeName(KeyWord);
        } else {
            list = goodsService.findAllGoods();
        }
        model.addAttribute("searchList", list);
        return "user/search";
    }

    @RequestMapping("searchPre")
    @ResponseBody
    public List<Goods> searchPre(String KeyWord){
        List<Goods> list = new ArrayList<Goods>();
        if (KeyWord != null && !KeyWord.equals("")) {
            list = goodsService.findGoodsLikeName(KeyWord);
        } else {
            list = goodsService.findAllGoods();
        }
        return list;
    }

    @RequestMapping("findGoodsBySplitPage")
    @ResponseBody
    public JSONObject findGoodsBySplitPage(@RequestParam(value = "page",defaultValue = "1")Integer page,@RequestParam(value = "limit",defaultValue = "10")Integer limit, String keyword){
        JSONObject obj = new JSONObject();
        PageInfo<Goods> info = goodsService.findBySplitPage(page, limit, keyword);
        obj.put("msg","");
        obj.put("code",0);
        obj.put("count",info.getTotal());
        obj.put("data",info.getList());
        return obj;
    }

    @RequestMapping("batchDelete")
    @ResponseBody
    public String batchDelete(String batch){
        String [] list = batch.split(",");
        boolean flag = true;
        for(String id : list){
            Integer goods_id = Integer.valueOf(id);
            Integer rs = goodsService.deleteGoods(goods_id);
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

    @RequestMapping("updateGoods")
    @ResponseBody
    public String updateGoods(Goods goods){
        Integer rs = goodsService.updateGoods(goods);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("deleteGoods")
    @ResponseBody
    public String deleteGoods(Integer goods_id){
        Integer rs = goodsService.deleteGoods(goods_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("uploadGoodsImg")
    @ResponseBody
    public JSONObject uploadGoodsImg(@RequestParam(value = "file", required = false)MultipartFile file,HttpServletRequest request){
        String str = file.getOriginalFilename();
        String name = UUIDUtil.getUUID() + str.substring(str.lastIndexOf("."));
        String path = request.getServletContext().getRealPath("/upload/") + name;
        try{
            file.transferTo(new File(path));
            System.out.println("文件写入成功，path:"+path);
        }catch (IOException e){
            e.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("goods_img",name);
        return obj;
    }

    @RequestMapping("addGoods")
    @ResponseBody
    public String addGoods(Goods goods){
        Integer rs = goodsService.addGoods(goods);
        if(rs > 0){
            return  "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findGoodsByVolume")
    @ResponseBody
    public JSONObject findGoodsByVolume(){
        JSONObject obj = new JSONObject();
        List<Goods> list = goodsService.findGoodsByVolume(10);
        ArrayList<String> name = new ArrayList<String>();
        ArrayList<Integer> volume = new ArrayList<Integer>();
        for(Goods goods : list){
            name.add(goods.getGoods_name());
            volume.add(goods.getGoods_volume());
        }
        obj.put("name",name);
        obj.put("volume",volume);
        return obj;
    }

    @RequestMapping("findGoodsTypeByVolume")
    @ResponseBody
    public JSONObject findGoodsTypeByVolume(){
        List<GoodsTypeVO> list = goodsService.findGoodsTypeByVolume();
        ArrayList<String> type = new ArrayList<String>();
        ArrayList<Integer> volume = new ArrayList<Integer>();
        for(GoodsTypeVO vo : list){
            type.add(vo.getType());
            volume.add(vo.getVolumes());
        }
        JSONObject obj = new JSONObject();
        obj.put("type",type);
        obj.put("volume",volume);
        return obj;
    }
}
