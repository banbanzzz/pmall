package com.service.imp;

import com.alibaba.fastjson.JSON;
import com.entity.Goods;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.GoodsMapper;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import com.util.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsServiceImp implements IGoodsService {
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private IEvaluateService evaluateService;
    @Autowired
    private JedisPool jedisPool;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<GoodsTypeVO> findGoodsTypeByVolume() {
        return goodsMapper.findGoodsTypeByVolume();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Goods> findAllGoods() {
        return goodsMapper.findAllGoods();
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Goods findGoodsById(Integer id) {
        Jedis jedis = jedisPool.getResource();
        String str = jedis.get(id+"");
        jedis.close();
        if(str == null || str.equals("")) {
            Goods goods = goodsMapper.findGoodsById(id);
            goods.setEvaList(evaluateService.findEvaluateByGoods(goods.getGoods_id()));
            jedis.set(goods.getGoods_id()+"", JSON.toJSONString(goods));
            return goods;
        }else{
            //将json转换为对象
            return JSON.toJavaObject(JSON.parseObject(str),Goods.class);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGoods(Goods goods) {
        Integer rs = goodsMapper.addGoods(goods);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            jedis.set(goods.getGoods_id()+"",JSON.toJSONString(goods));
        }
        jedis.close();
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateGoods(Goods goods) {
        Integer rs = goodsMapper.updateGoods(goods);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            goods.setEvaList(evaluateService.findEvaluateByGoods(goods.getGoods_id()));
            jedis.set(goods.getGoods_id()+"",JSON.toJSONString(goods));
        }
        jedis.close();
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteGoods(Integer id) {
        Integer rs = goodsMapper.deleteGoods(id);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            jedis.del(id+"");
        }
        jedis.close();
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer outOfStock(Integer good_id) {
        Integer rs = goodsMapper.outOfStock(good_id);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            Goods goods = goodsMapper.findGoodsById(good_id);
            jedis.set(good_id+"",JSON.toJSONString(goods));
        }
        jedis.close();
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer reduceGoodsVolume(Integer num,Integer goods_id) {
        Integer rs = goodsMapper.reduceGoodsVolume(num, goods_id);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            Goods goods = goodsMapper.findGoodsById(goods_id);
            jedis.set(goods_id+"",JSON.toJSONString(goods));
        }
        jedis.close();
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGoodsVolume(Integer num,Integer goods_id) {
        Integer rs = goodsMapper.addGoodsVolume(num, goods_id);
        Jedis jedis = jedisPool.getResource();
        if(rs > 0){
            Goods goods = goodsMapper.findGoodsById(goods_id);
            jedis.set(goods_id+"",JSON.toJSONString(goods));
        }
        jedis.close();
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
