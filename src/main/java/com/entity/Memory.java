package com.entity;

import java.io.Serializable;

/**
 * 内存表实体对象
 * @author Wxj
 * @date 2019年8月1日20:16:15
 */
public class Memory implements Serializable {
    private Integer memory_id;
    private String memory_name;

    public Integer getMemory_id() {
        return memory_id;
    }

    public void setMemory_id(Integer memory_id) {
        this.memory_id = memory_id;
    }

    public String getMemory_name() {
        return memory_name;
    }

    public void setMemory_name(String memory_name) {
        this.memory_name = memory_name;
    }
}
