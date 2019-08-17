package com.controller;

import com.entity.Goods;
import com.entity.Guess;
import com.entity.Users;
import com.service.IGoodsService;
import com.service.IGuessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/guess")
public class GuessController {
    @Autowired
    private IGuessService guessService;
    @Autowired
    private IGoodsService goodsService;

    @RequestMapping("addGuess")
    @ResponseBody
    public String addGuess(Integer goods_id, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        Goods goods = goodsService.findGoodsById(goods_id);
        Guess guess = new Guess(goods,user,new Date());
        Integer rs = guessService.addGuess(guess);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("removeGuess")
    @ResponseBody
    public String removeGuess(Integer guess_id){
        Integer rs = guessService.deleteGuess(guess_id);
        if(rs > 0){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("findGuessByUser")
    @ResponseBody
    public List<Guess> findGuessByUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        return guessService.findGuessByUserId(user.getUser_id());
    }
}
