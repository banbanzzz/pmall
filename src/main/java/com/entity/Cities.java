package com.entity;

import java.io.Serializable;

/**
 * 城市表实体对象
 * @author Wxj
 * @date 2019年8月2日14:11:34
 */
public class Cities implements Serializable {
    private String city_id;
    private String city_name;
    private String province_id;

    public String getCity_id() {
        return city_id;
    }

    public void setCity_id(String city_id) {
        this.city_id = city_id;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    public Cities(){
        super();
    }

    public Cities(String city_id, String city_name, String province_id){
        super();
        this.city_id = city_id;
        this.city_name = city_name;
        this.province_id = province_id;
    }
}
