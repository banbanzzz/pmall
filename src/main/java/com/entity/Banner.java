package com.entity;

import java.io.Serializable;

/**
 * 轮播图表实体对象
 * @author Wxj
 * @date 2019年8月2日14:16:02
 */
public class Banner implements Serializable {
    private Integer banner_id;
    private String banner_name;
    private String banner_url;
    private String banner_img;
    private Integer banner_state;

    public Integer getBanner_id() {
        return banner_id;
    }

    public void setBanner_id(Integer banner_id) {
        this.banner_id = banner_id;
    }

    public String getBanner_name() {
        return banner_name;
    }

    public void setBanner_name(String banner_name) {
        this.banner_name = banner_name;
    }

    public String getBanner_url() {
        return banner_url;
    }

    public void setBanner_url(String banner_url) {
        this.banner_url = banner_url;
    }

    public String getBanner_img() {
        return banner_img;
    }

    public void setBanner_img(String banner_img) {
        this.banner_img = banner_img;
    }

    public Integer getBanner_state() {
        return banner_state;
    }

    public void setBanner_state(Integer banner_state) {
        this.banner_state = banner_state;
    }

    public Banner(){
        super();
    }

    public Banner(Integer banner_id, String banner_name, String banner_url, String banner_img, Integer banner_state) {
        super();
        this.banner_id = banner_id;
        this.banner_name = banner_name;
        this.banner_url = banner_url;
        this.banner_img = banner_img;
        this.banner_state = banner_state;
    }
}
