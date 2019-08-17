package com.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 商品分类表实体对象
 *
 * @author Wxj
 * @date 2019年8月1日20:14:50
 */
public class GoodsType implements Serializable {
    private Integer type_id;
    private String type_name;
    private Integer type_state;
    private List<Goods> goodsList;

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public Integer getType_state() {
        return type_state;
    }

    public void setType_state(Integer type_state) {
        this.type_state = type_state;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public GoodsType() {
        super();
    }

    public GoodsType(Integer type_id, String type_name, Integer type_state) {
        super();
        this.type_id = type_id;
        this.type_name = type_name;
        this.type_state = type_state;
    }
}
