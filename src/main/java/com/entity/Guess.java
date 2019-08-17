package com.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 收藏表实体对象
 *
 * @author Wxj
 * @date 2019年8月1日20:09:06
 */
public class Guess implements Serializable {
    private Integer guess_id;
    private Goods guess_goods;
    private Users guess_user;
    private Date guess_date;

    public Integer getGuess_id() {
        return guess_id;
    }

    public void setGuess_id(Integer guess_id) {
        this.guess_id = guess_id;
    }

    public Goods getGuess_goods() {
        return guess_goods;
    }

    public void setGuess_goods(Goods guess_goods) {
        this.guess_goods = guess_goods;
    }

    public Users getGuess_user() {
        return guess_user;
    }

    public void setGuess_user(Users guess_user) {
        this.guess_user = guess_user;
    }

    public Date getGuess_date() {
        return guess_date;
    }

    public void setGuess_date(Date guess_date) {
        this.guess_date = guess_date;
    }

    public Guess(Integer guess_id, Goods guess_goods, Users guess_user, Date guess_date) {
        super();
        this.guess_id = guess_id;
        this.guess_goods = guess_goods;
        this.guess_user = guess_user;
        this.guess_date = guess_date;
    }

    public Guess(Goods guess_goods, Users guess_user, Date guess_date) {
        super();
        this.guess_goods = guess_goods;
        this.guess_user = guess_user;
        this.guess_date = guess_date;
    }

    public Guess() {
        super();
    }
}
