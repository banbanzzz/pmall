package com.entity;

import java.io.Serializable;

/**
 * 省份表实体对象
 * @author Wxj
 * @date 2019年8月2日14:09:48
 */
public class Provinces implements Serializable {
    private String province_id;
    private String province_name;

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    public String getProvince_name() {
        return province_name;
    }

    public void setProvince_name(String province_name) {
        this.province_name = province_name;
    }

    public Provinces(){
        super();
    }

    public Provinces(String province_id, String province_name){
        super();
        this.province_id = province_id;
        this.province_name = province_name;
    }
}
