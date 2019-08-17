package com.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 商品表实体对象
 *
 * @author Wxj
 * @date 2019年8月1日20:24:58
 */
public class Goods implements Serializable {
    private Integer goods_id;
    private String goods_name;
    private double goods_price;
    private Integer goods_num;
    private GoodsType goods_type;
    private Memory goods_memory;
    private String goods_color;
    private String goods_img;
    private Integer goods_state;
    private String goods_desc;
    private Integer goods_volume;
    private List<Evaluate> evaList;

    public List<Evaluate> getEvaList() {
        return evaList;
    }

    public void setEvaList(List<Evaluate> evaList) {
        this.evaList = evaList;
    }

    public Integer getGoods_volume() {
        return goods_volume;
    }

    public void setGoods_volume(Integer goods_volume) {
        this.goods_volume = goods_volume;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public double getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(double goods_price) {
        this.goods_price = goods_price;
    }

    public Integer getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(Integer goods_num) {
        this.goods_num = goods_num;
    }

    public GoodsType getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(GoodsType goods_type) {
        this.goods_type = goods_type;
    }

    public Memory getGoods_memory() {
        return goods_memory;
    }

    public void setGoods_memory(Memory goods_memory) {
        this.goods_memory = goods_memory;
    }

    public String getGoods_color() {
        return goods_color;
    }

    public void setGoods_color(String goods_color) {
        this.goods_color = goods_color;
    }

    public String getGoods_img() {
        return goods_img;
    }

    public void setGoods_img(String goods_img) {
        this.goods_img = goods_img;
    }

    public Integer getGoods_state() {
        return goods_state;
    }

    public void setGoods_state(Integer goods_state) {
        this.goods_state = goods_state;
    }

    public String getGoods_desc() {
        return goods_desc;
    }

    public void setGoods_desc(String goods_desc) {
        this.goods_desc = goods_desc;
    }

    public Goods() {
        super();
    }

    public Goods(Integer goods_id, String goods_name, double goods_price, Integer goods_num, GoodsType goods_type,
                 Memory goods_memory, String goods_color, String goods_img, Integer goods_state, String goods_desc, Integer goods_volume) {
        super();
        this.goods_id = goods_id;
        this.goods_name = goods_name;
        this.goods_price = goods_price;
        this.goods_num = goods_num;
        this.goods_type = goods_type;
        this.goods_memory = goods_memory;
        this.goods_color = goods_color;
        this.goods_img = goods_img;
        this.goods_state = goods_state;
        this.goods_desc = goods_desc;
        this.goods_volume = goods_volume;
    }

    public Goods(String goods_name, double goods_price, Integer goods_num, GoodsType goods_type, Memory goods_memory,
                 String goods_color, String goods_img, Integer goods_state, String goods_desc) {
        super();
        this.goods_name = goods_name;
        this.goods_price = goods_price;
        this.goods_num = goods_num;
        this.goods_type = goods_type;
        this.goods_memory = goods_memory;
        this.goods_color = goods_color;
        this.goods_img = goods_img;
        this.goods_state = goods_state;
        this.goods_desc = goods_desc;
    }
}
