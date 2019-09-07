package com.mapper;

import com.entity.Goods;
import com.util.GoodsTypeVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {
    List<Goods> findAllBaseData();
    List<Goods> findAllGoods();
    Integer addGoods(Goods goods);
    Integer deleteGoods(Integer good_id);
    Integer outOfStock(Integer good_id);
    Integer updateGoods(Goods goods);
    Integer reduceGoodsVolume(@Param("num") Integer num,@Param("goods_id") Integer goods_id);
    Integer addGoodsVolume(@Param("num") Integer num,@Param("goods_id") Integer goods_id);
    Goods findGoodsById(Integer good_id);
    List<Goods> findGoodsByType(Integer type_id);
    List<Goods> findGoodsLikeName(String name);
    List<Goods> findHotGoods(Integer num);
    List<Goods> findGoodsByVolume(Integer limit);
    List<GoodsTypeVO> findGoodsTypeByVolume();
}
