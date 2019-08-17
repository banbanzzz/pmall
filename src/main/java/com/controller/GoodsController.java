package com.controller;

import com.entity.Evaluate;
import com.entity.Goods;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    public List<Goods> findGoodsByType(Integer type_id){
        return goodsService.findGoodsByType(type_id);
    }

    @RequestMapping("detail")
    public String goodsDetail(@RequestParam Integer goodsId, Model model, HttpServletRequest request){
        Goods goods = goodsService.findGoodsById(goodsId);
        List<Evaluate> evaList = evaluateService.findEvaluateByGoods(goods.getGoods_id());
        request.setAttribute("goods",goods);
        model.addAttribute("evaList",evaList);
        return "user/product_detail";
    }

    @RequestMapping("findHotGoods")
    @ResponseBody
    public List<Goods> findHotGoods(){
        return goodsService.findHotGoods(4);
    }
}
