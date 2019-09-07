package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 评价表实体对象
 * @author Wxj
 * @date 2019年8月1日17:37:07
 */
public class Evaluate implements Serializable {
    private Integer eva_id;
    private Users eva_user;
    private String eva_content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date eva_date;
    private Goods eva_goods;
    private Integer eva_state; //评价状态 根据评分 评分1星：-1（差评）评分2-3星：0（中评）评分4-5星：1（好评
    private Integer eva_level; //评分
    private List<Evaimg> imgList;

    public Integer getEva_id() {
        return eva_id;
    }

    public void setEva_id(Integer eva_id) {
        this.eva_id = eva_id;
    }

    public Users getEva_user() {
        return eva_user;
    }

    public void setEva_user(Users eva_user) {
        this.eva_user = eva_user;
    }

    public String getEva_content() {
        return eva_content;
    }

    public void setEva_content(String eva_content) {
        this.eva_content = eva_content;
    }

    public Date getEva_date() {
        return eva_date;
    }

    public void setEva_date(Date eva_date) {
        this.eva_date = eva_date;
    }

    public Goods getEva_goods() {
        return eva_goods;
    }

    public void setEva_goods(Goods eva_goods) {
        this.eva_goods = eva_goods;
    }

    public Integer getEva_state() {
        return eva_state;
    }

    public void setEva_state(Integer eva_state) {
        this.eva_state = eva_state;
    }

    public Integer getEva_level() {
        return eva_level;
    }

    public void setEva_level(Integer eva_level) {
        this.eva_level = eva_level;
    }

    public List<Evaimg> getImgList() {
        return imgList;
    }

    public void setImgList(List<Evaimg> imgList) {
        this.imgList = imgList;
    }

    public Evaluate(Integer evaId, Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
                    Integer evaLevel, List<Evaimg> imgList) {
        super();
        this.eva_id = evaId;
        this.eva_user = evaUser;
        this.eva_content = evaContent;
        this.eva_date = evaDate;
        this.eva_goods = evaGoods;
        this.eva_state = evaState;
        this.eva_level = evaLevel;
        this.imgList = imgList;
    }

    public Evaluate(Integer evaId, Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
                    Integer evaLevel) {
        super();
        this.eva_id = evaId;
        this.eva_user = evaUser;
        this.eva_content = evaContent;
        this.eva_date = evaDate;
        this.eva_goods = evaGoods;
        this.eva_state = evaState;
        this.eva_level = evaLevel;
    }

    public Evaluate(Users evaUser, String evaContent, Date evaDate, Goods evaGoods, Integer evaState,
                    Integer evaLevel) {
        super();
        this.eva_user = evaUser;
        this.eva_content = evaContent;
        this.eva_date = evaDate;
        this.eva_goods = evaGoods;
        this.eva_state = evaState;
        this.eva_level = evaLevel;
    }
    public Evaluate() {
        super();
    }
}
