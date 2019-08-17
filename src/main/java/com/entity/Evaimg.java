package com.entity;

import java.io.Serializable;

/**
 * 评价图片实体对象
 * @author Wxj
 * @date 2019年8月1日19:51:06
 */
public class Evaimg implements Serializable {
    private Integer evaimg_id;
    private String evaimg_name;
    private Integer eva;

    public Integer getEvaimg_id() {
        return evaimg_id;
    }

    public void setEvaimg_id(Integer evaimg_id) {
        this.evaimg_id = evaimg_id;
    }

    public String getEvaimg_name() {
        return evaimg_name;
    }

    public void setEvaimg_name(String evaimg_name) {
        this.evaimg_name = evaimg_name;
    }

    public Integer getEva() {
        return eva;
    }

    public void setEva(Integer eva) {
        this.eva = eva;
    }

    public Evaimg(Integer evaimg_id, String evaimg_name, Integer eva) {
        super();
        this.evaimg_id = evaimg_id;
        this.evaimg_name = evaimg_name;
        this.eva = eva;
    }

    public Evaimg(String evaimg_name, Integer eva) {
        super();
        this.evaimg_name = evaimg_name;
        this.eva = eva;
    }

    public Evaimg() {
        super();
    }
}
