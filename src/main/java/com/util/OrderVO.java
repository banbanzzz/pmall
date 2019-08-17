package com.util;

/**
 * 月销售表实体对象
 * @author Wxj
 */
public class OrderVO {
    private Long totalMoney; //总价格
    private String orderMonth; //月份
    private Integer sheets; //订单量

    public Long getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Long totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderMonth() {
        return orderMonth;
    }

    public void setOrderMonth(String orderMonth) {
        this.orderMonth = orderMonth;
    }

    public Integer getSheets() {
        return sheets;
    }

    public void setSheets(Integer sheets) {
        this.sheets = sheets;
    }
}
