package com.util;

/**
 * 商品分类销量实体对象
 * @author Wxj
 * @date 2019年9月4日16:36:43
 */
public class GoodsTypeVO {
    String type; //类型
    Integer volumes; //销量

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getVolumes() {
        return volumes;
    }

    public void setVolumes(Integer volumes) {
        this.volumes = volumes;
    }
}
