package com.listener;

import com.entity.Evaluate;
import com.entity.Goods;
import com.entity.GoodsType;
import com.entity.Memory;
import com.service.IEvaluateService;
import com.service.IGoodsService;
import com.service.IGoodsTypeService;
import com.service.IMemoryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * 商品监听器：
 *      将商品、内存、分类数据加载到内存中
 * @author Wxj
 * @date 2019年8月13日18:28:15
 */
public class GoodsListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ApplicationContext app = new ClassPathXmlApplicationContext("spring.xml");
        IGoodsService service = app.getBean(IGoodsService.class);
        IGoodsTypeService typeService = app.getBean(IGoodsTypeService.class);
        IMemoryService memoryService = app.getBean(IMemoryService.class);
        IEvaluateService evaluateService = app.getBean(IEvaluateService.class);
        ServletContext application = servletContextEvent.getServletContext();
        List<GoodsType> typeList = typeService.findAllType();
        application.setAttribute("goodsTypeList",typeList);
        List<Memory> memoryList = memoryService.findAllMemory();
        application.setAttribute("memoryList",memoryList);
        List<Goods> goodsList = service.findAllGoods();
        for(Goods good : goodsList){
            List<Evaluate> evaList = evaluateService.findEvaluateByGoods(good.getGoods_id());
            good.setEvaList(evaList);
        }
        application.setAttribute("goodsList",goodsList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
