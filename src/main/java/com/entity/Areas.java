package com.entity;

import java.io.Serializable;

/**
 * 区县表实体对象
 *
 * @author Wxj
 * @date 2019年8月2日14:14:10
 */
public class Areas implements Serializable {
    private String area_id;
    private String area_name;
    private String city_id;

    public String getArea_id() {
        return area_id;
    }

    public void setArea_id(String area_id) {
        this.area_id = area_id;
    }

    public String getArea_name() {
        return area_name;
    }

    public void setArea_name(String area_name) {
        this.area_name = area_name;
    }

    public String getCity_id() {
        return city_id;
    }

    public void setCity_id(String city_id) {
        this.city_id = city_id;
    }

    public Areas() {
        super();
    }

    public Areas(String area_id, String area_name, String city_id) {
        super();
        this.area_id = area_id;
        this.area_name = area_name;
        this.city_id = city_id;
    }
}
