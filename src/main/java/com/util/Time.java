package com.util;

import java.util.Date;
import java.util.TimeZone;

/**
 * 时间格式转换
 * @author Wxj
 */
public class Time {
    public static Date getDate(){
        //TimeZone time = TimeZone.getTimeZone("ETC/GMT-8");
        TimeZone time = TimeZone.getTimeZone("Asia/Shanghai");
        TimeZone.setDefault(time);
        Date now = new Date();
        return now;
    }
}
