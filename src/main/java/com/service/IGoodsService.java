package com.service;

import com.entity.Goods;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IGoodsService {
    List<Goods> findAllGoods();
    Goods findGoodsById(Integer id);
    Integer addGoods(Goods goods);
    Integer updateGoods(Goods goods);
    Integer deleteGoods(Integer id);
    List<Goods> findGoodsByType(Integer type_id);
    List<Goods> findGoodsLikeName(String name);
    List<Goods> findHotGoods(Integer num);
    List<Goods> findGoodsByVolume(Integer limit);
    PageInfo<Goods> findBySplitPage(Integer page,Integer limit,String keyword);
}
