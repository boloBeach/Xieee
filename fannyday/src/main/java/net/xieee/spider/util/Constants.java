package net.xieee.spider.util;

/**
 * this class is constants with the splider
 * 
 * @author royzhang
 *
 */
public class Constants {
	/**
	 * url filter,the reason some url can not get this code.
	 */
	public final static String filter = "about,about us";

	/**
	 * the LinkQueue max size
	 */
	public final static int max_url = 1000;

	/**
	 * get html code timeout
	 */
	public final static int timeout = 60000;

	/**
	 * save img path
	 */
	public final static String savePath = "/usr/local/nginx/html/fannyday/images/";
	
	/**
	 * 图片显示地址
	 */
	public final static String imgHTTPPath = "http://192.168.0.112/images/";

	/**
	 * spring xml name
	 */
	public final static String springXMLName = "applicationContext.xml";
	
	/**
	 * get img by name
	 */
	public final static String admin = "admin";
	
	/**
	 * 显示首页的信息的默认的pagesize个数
	 */
	public final static Integer index_pageSize = 5;
	
	/**
	 * 显示首页的信息的默认显示方式，按照时间的先后顺序来进系
	 */
	public final static Integer index_types = 1;
}
