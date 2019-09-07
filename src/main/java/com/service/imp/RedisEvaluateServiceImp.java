package com.service.imp;

import com.alibaba.fastjson.JSON;
import com.entity.Evaluate;
import com.entity.Goods;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import com.service.IRedisEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
@Service
public class RedisEvaluateServiceImp implements IRedisEvaluateService {
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IEvaluateService evaluateService;
    @Autowired
    private JedisPool jedisPool;

    @Override
    public void RefreshEvaluate(Integer goods_id) {
        Goods goods = goodsService.findGoodsById(goods_id);
        List<Evaluate> evaList = evaluateService.findEvaluateByGoods(goods_id);
        goods.setEvaList(evaList);
        Jedis jedis = jedisPool.getResource();
        jedis.set(goods_id+"", JSON.toJSONString(goods));
        jedis.close();
    }
}
