package com.service.imp;

import com.entity.Goods;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.GoodsMapper;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsServiceImp implements IGoodsService {
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private IEvaluateService evaluateService;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findAllGoods() {
        return goodsMapper.findAllGoods();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Goods findGoodsById(Integer id) {
        Goods goods = goodsMapper.findGoodsById(id);
        goods.setEvaList(evaluateService.findEvaluateByGoods(goods.getGoods_id()));
        return goods;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateGoods(Goods goods) {
        Integer rs = goodsMapper.updateGoods(goods);
        if(rs > 0){
            goods.setEvaList(evaluateService.findEvaluateByGoods(goods.getGoods_id()));
        }
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteGoods(Integer id) {
        Integer rs = goodsMapper.deleteGoods(id);
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findGoodsByType(Integer type_id) {
        return goodsMapper.findGoodsByType(type_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findGoodsLikeName(String name) {
        return goodsMapper.findGoodsLikeName(name);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findHotGoods(Integer num) {
        return goodsMapper.findHotGoods(num);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findGoodsByVolume(Integer limit) {
        return goodsMapper.findGoodsByVolume(limit);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<Goods> findBySplitPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<Goods> list = new ArrayList<Goods>();
        if(keyword != null && !keyword.equals("")){
            list = goodsMapper.findGoodsLikeName(keyword);
        }else {
            list = goodsMapper.findAllGoods();
        }
        PageInfo<Goods> info = new PageInfo<Goods>(list);
        return info;
    }
}
