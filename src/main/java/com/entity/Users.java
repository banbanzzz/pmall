package com.entity;

import java.io.Serializable;

/**
 * 用户表实体对象
 * @author Wxj
 * @date 2019年8月1日17:36:18
 */
public class Users implements Serializable {
    private Integer user_id;
    private String user_name;
    private String user_pass;
    private String user_email;
    private String user_img;
    private String user_phone;
    private Integer user_state;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_img() {
        return user_img;
    }

    public void setUser_img(String user_img) {
        this.user_img = user_img;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public Integer getUser_state() {
        return user_state;
    }

    public void setUser_state(Integer user_state) {
        this.user_state = user_state;
    }

    public Users(Integer user_id, String user_name, String user_pass, String user_email, String user_phone, Integer user_state, String user_img){
        super();
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_pass = user_pass;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_state = user_state;
        this.user_img = user_img;
    }
    public Users(){
        super();
    }
}
