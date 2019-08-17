package com.mapper;

import com.entity.Evaluate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluateMapper {
    Evaluate findEvaById(Integer id);
    Integer addEvaluate(Evaluate eva);
    Integer deleteEvaluate(Integer id);
    Integer updateEvaluate(Evaluate eva);
    List<Evaluate> findEvaByGoodsId(Integer goods_id);
    List<Evaluate> findEvaByUserId(Integer user_id);
    List<Evaluate> findAllEvalute();
    List<Evaluate> findAllEvaluateLikeContent(String content);
    List<Evaluate> findEvaByState(Integer eva_state);
}
