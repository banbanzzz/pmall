package com.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 管理员权限功能实体对象
 * @author Wxj
 * @date 2019年9月5日19:19:30
 */
public class Funs implements Serializable {
    private Integer fun_id;
    private String fun_name;
    private String fun_url;
    private Funs fun_pid;
    private String fun_target;
    private List<Funs> funsList;

    public Integer getFun_id() {
        return fun_id;
    }

    public void setFun_id(Integer fun_id) {
        this.fun_id = fun_id;
    }

    public String getFun_name() {
        return fun_name;
    }

    public void setFun_name(String fun_name) {
        this.fun_name = fun_name;
    }

    public String getFun_url() {
        return fun_url;
    }

    public void setFun_url(String fun_url) {
        this.fun_url = fun_url;
    }

    public Funs getFun_pid() {
        return fun_pid;
    }

    public void setFun_pid(Funs fun_pid) {
        this.fun_pid = fun_pid;
    }

    public String getFun_target() {
        return fun_target;
    }

    public void setFun_target(String fun_target) {
        this.fun_target = fun_target;
    }

    public List<Funs> getFunsList() {
        return funsList;
    }

    public void setFunsList(List<Funs> funsList) {
        this.funsList = funsList;
    }

    public Funs(Integer fun_id, String fun_name, String fun_url, Funs fun_pid, String fun_target, List<Funs> funsList) {
        this.fun_id = fun_id;
        this.fun_name = fun_name;
        this.fun_url = fun_url;
        this.fun_pid = fun_pid;
        this.fun_target = fun_target;
        this.funsList = funsList;
    }

    public Funs() {
        super();
    }

    public Funs(Integer fun_id, String fun_name, String fun_url, Funs fun_pid, String fun_target) {
        this.fun_id = fun_id;
        this.fun_name = fun_name;
        this.fun_url = fun_url;
        this.fun_pid = fun_pid;
        this.fun_target = fun_target;
    }
}
