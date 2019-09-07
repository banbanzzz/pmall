package com.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 角色表实体对象
 * @author Wxj
 * @date 2019年8月2日14:10:12
 */
public class Role implements Serializable {
    private Integer role_id;
    private String role_name;
    private List<Funs> role_funs;

    public List<Funs> getRole_funs() {
        return role_funs;
    }

    public void setRole_funs(List<Funs> role_funs) {
        this.role_funs = role_funs;
    }

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

    public Role(Integer role_id, String role_name, List<Funs> role_funs) {
        this.role_id = role_id;
        this.role_name = role_name;
        this.role_funs = role_funs;
    }
}
