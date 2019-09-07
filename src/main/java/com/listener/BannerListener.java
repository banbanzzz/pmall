package com.listener;

import com.entity.Banner;
import com.service.IBannerService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * 轮播图监听器：
 * 将轮播图数据加载到内存中,设置为全局共享
 * @author Wxj
 * @date 2019年8月13日17:49:29
 */
public class BannerListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        IBannerService bannerService = app.getBean(IBannerService.class);
        ServletContext application =  servletContextEvent.getServletContext();
        List<Banner> bannerList = bannerService.findAllShowBanner();
        application.setAttribute("bannerList",bannerList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
