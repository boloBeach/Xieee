package net.xieee.spider.util;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * 日志类
 * 
 * @author royzhang
 *
 */
public class Log {

	// Logger实例
	public Logger		logger	= null;

	// 将Log类封装为单例模式
	private static Log	log;



	// 构造函数，用于初始化Logger配置需要的属性
	private Log(Class clazz) {
        //获得日志类logger的实例     
        logger=Logger.getLogger(this.getClass());     
        //logger所需的配置文件路径     
        PropertyConfigurator.configure(this.getClass().getResourceAsStream("/log4j.properties"));   
	}



	public static Log getLogger(Class clazz) {
		if (log != null)
			return log;
		else
			return new Log(clazz);
	}
}
