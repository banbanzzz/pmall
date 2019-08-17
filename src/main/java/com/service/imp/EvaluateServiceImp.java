package com.service.imp;

import com.entity.Evaimg;
import com.entity.Evaluate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.EvaimgMapper;
import com.mapper.EvaluateMapper;
import com.service.IEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class EvaluateServiceImp implements IEvaluateService {
    @Autowired
    private EvaluateMapper evaluateMapper;
    @Autowired
    private EvaimgMapper evaimgMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addEvaluate(Evaluate eva, String[] imgs) {
        Integer rs = evaluateMapper.addEvaluate(eva);
        if(rs > 0){
            for(String img : imgs){
                Evaimg evaimg = new Evaimg(img, eva.getEva_id());
                evaimgMapper.addEvaimg(evaimg);
            }
        }
        return rs;
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteEvaluate(Integer eva_id) {
        return evaluateMapper.deleteEvaluate(eva_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Evaluate findEvaluateById(Integer eva_id) {
        Evaluate eva = evaluateMapper.findEvaById(eva_id);
        eva.setImgList(evaimgMapper.findEvaimgByEvaId(eva.getEva_id()));
        return eva;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Evaluate> findEvaluateByGoods(Integer goods_id) {
        List<Evaluate> evaList = evaluateMapper.findEvaByGoodsId(goods_id);
        for(Evaluate eva : evaList){
            eva.setImgList(evaimgMapper.findEvaimgByEvaId(eva.getEva_id()));
        }
        return evaList;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<Evaluate> findAllEvaluate(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<Evaluate> evaList = new ArrayList<Evaluate>();
        if(keyword != null && !keyword.equals("")){
            evaList = evaluateMapper.findAllEvaluateLikeContent(keyword);
        }else {
            evaList = evaluateMapper.findAllEvalute();
        }
        PageInfo<Evaluate> info = new PageInfo<Evaluate>(evaList);
        return info;
    }
}
