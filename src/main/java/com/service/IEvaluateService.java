package com.service;

import com.entity.Evaluate;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IEvaluateService {
    Integer addEvaluate(Evaluate eva,String [] imgs);
    Integer deleteEvaluate(Integer eva_id);
    Evaluate findEvaluateById(Integer eva_id);
    List<Evaluate> findEvaluateByGoods(Integer goods_id);
    PageInfo<Evaluate> findAllEvaluate(Integer page,Integer limit,String keyword);
}
