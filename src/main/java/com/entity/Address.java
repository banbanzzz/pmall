package com.entity;

import java.io.Serializable;

/**
 * 地址表实体对象
 * @author Wxj
 * @date 2019年8月1日17:36:29
 */
public class Address implements Serializable {
    private Integer addr_id;
    private String addr_province;
    private String addr_city;
    private String addr_area;
    private String addr_detail;
    private Integer addr_user;
    private String addr_zipcpde;
    private String addr_phone;
    private String addr_nickname;
    private Integer addr_state; //1：默认  0：取消默认 -1:删除

    public Integer getAddr_id() {
        return addr_id;
    }

    public void setAddr_id(Integer addr_id) {
        this.addr_id = addr_id;
    }

    public String getAddr_province() {
        return addr_province;
    }

    public void setAddr_province(String addr_province) {
        this.addr_province = addr_province;
    }

    public String getAddr_city() {
        return addr_city;
    }

    public void setAddr_city(String addr_city) {
        this.addr_city = addr_city;
    }

    public String getAddr_area() {
        return addr_area;
    }

    public void setAddr_area(String addr_area) {
        this.addr_area = addr_area;
    }

    public String getAddr_detail() {
        return addr_detail;
    }

    public void setAddr_detail(String addr_detail) {
        this.addr_detail = addr_detail;
    }

    public Integer getAddr_user() {
        return addr_user;
    }

    public void setAddr_user(Integer addr_user) {
        this.addr_user = addr_user;
    }

    public String getAddr_zipcpde() {
        return addr_zipcpde;
    }

    public void setAddr_zipcpde(String addr_zipcpde) {
        this.addr_zipcpde = addr_zipcpde;
    }

    public String getAddr_phone() {
        return addr_phone;
    }

    public void setAddr_phone(String addr_phone) {
        this.addr_phone = addr_phone;
    }

    public String getAddr_nickname() {
        return addr_nickname;
    }

    public void setAddr_nickname(String addr_nickname) {
        this.addr_nickname = addr_nickname;
    }

    public Integer getAddr_state() {
        return addr_state;
    }

    public void setAddr_state(Integer addr_state) {
        this.addr_state = addr_state;
    }

    public Address(Integer addr_id, String addr_province, String addr_city, String addr_area, String addr_detail,
                   Integer addr_user, String addr_zipcpde, String addr_phone, String addr_nickname, Integer addr_state) {
        super();
        this.addr_id = addr_id;
        this.addr_province = addr_province;
        this.addr_city = addr_city;
        this.addr_area = addr_area;
        this.addr_detail = addr_detail;
        this.addr_user = addr_user;
        this.addr_zipcpde = addr_zipcpde;
        this.addr_phone = addr_phone;
        this.addr_nickname = addr_nickname;
        this.addr_state = addr_state;
    }

    public Address(){
        super();
    }
}
