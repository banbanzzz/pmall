package com.entity;

import java.io.Serializable;

/**
 * 权限表实体对象
 * @author Wxj
 * @date 2019年8月2日14:10:12
 */
public class Role implements Serializable {
    private Integer role_id;
    private String role_name;

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public Role(){
        super();
    }

    public Role(Integer role_id, String role_name){
        super();
        this.role_id = role_id;
        this.role_name = role_name;
    }
}
