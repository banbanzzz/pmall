package com.service;

import com.entity.GoodsType;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IGoodsTypeService {
    List<GoodsType> findAllType();
    Integer addGoodsType(GoodsType type);
    Integer updateGoodsType(GoodsType type);
    Integer changeTypeState(Integer state,Integer type_id);
    Integer deleteGoodsType(Integer type_id);
    PageInfo<GoodsType> findTypeBySplitPage(Integer page, Integer limit, String keyword);
}
