package com.entity;

import java.io.Serializable;

/**
 * 管理员表实体对象
 * @author Wxj
 * @date 2019年8月2日13:40:33
 */
public class Admins implements Serializable {
    private Integer admin_id;
    private String admin_name;
    private String admin_pass;
    private String admin_phone;
    private Integer admin_state;
    private String admin_img;
    private Role admin_role;

    public Integer getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(Integer admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_pass() {
        return admin_pass;
    }

    public void setAdmin_pass(String admin_pass) {
        this.admin_pass = admin_pass;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    public Integer getAdmin_state() {
        return admin_state;
    }

    public void setAdmin_state(Integer admin_state) {
        this.admin_state = admin_state;
    }

    public String getAdmin_img() {
        return admin_img;
    }

    public void setAdmin_img(String admin_img) {
        this.admin_img = admin_img;
    }

    public Role getAdmin_role() {
        return admin_role;
    }

    public void setAdmin_role(Role admin_role) {
        this.admin_role = admin_role;
    }

    public Admins(){
        super();
    }

    public Admins(Integer admin_id, String admin_name, String admin_pass, String admin_phone, String admin_img,
                  Integer admin_state, Role admin_role) {
        super();
        this.admin_id = admin_id;
        this.admin_name = admin_name;
        this.admin_pass = admin_pass;
        this.admin_phone = admin_phone;
        this.admin_img = admin_img;
        this.admin_state = admin_state;
        this.admin_role = admin_role;
    }
}
