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
	public final static String savePath = "/usr/local/nginx/html/xieee/images/";
	
	/**
	 * 图片显示地址
	 */
	public final static String imgHTTPPath = "http://172.17.111.191:8080/images/";

	/**
	 * spring xml name
	 */
	public final static String springXMLName = "applicationContext.xml";
	
	/**
	 * get img by name
	 */
	public final static String admin = "admin";
}
