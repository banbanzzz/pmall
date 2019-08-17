package com.service.imp;

import com.entity.GoodsType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.GoodsMapper;
import com.mapper.GoodsTypeMapper;
import com.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsTypeServiceImp implements IGoodsTypeService {
    @Autowired
    private GoodsTypeMapper goodsTypeMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<GoodsType> findAllType() {
        List<GoodsType> typeList = goodsTypeMapper.findAllType();
        for(GoodsType type : typeList){
            type.setGoodsList(goodsMapper.findGoodsByType(type.getType_id()));
        }
        return typeList;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGoodsType(GoodsType type) {
        return goodsTypeMapper.addGoodsType(type);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateGoodsType(GoodsType type) {
        return goodsTypeMapper.updateGoodsType(type);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer changeTypeState(Integer state, Integer type_id) {
        return goodsTypeMapper.ChangeTypeState(state, type_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteGoodsType(Integer type_id) {
        return goodsTypeMapper.deleteGoodsType(type_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<GoodsType> findTypeBySplitPage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<GoodsType> typeList = new ArrayList<GoodsType>();
        if(keyword != null && !keyword.equals("")){
            typeList = goodsTypeMapper.findAllTypeByLikeName(keyword);
        }else {
            typeList = goodsTypeMapper.findAllType();
        }
        PageInfo<GoodsType> info = new PageInfo<GoodsType>(typeList);
        return info;
    }
}
