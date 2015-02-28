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
	 * save cartoon img path
	 */
	public final static String cartoon_savePath = "/usr/local/nginx/html/fannyday/cartoon";
	
	/**
	 * 图片显示地址
	 */
	public final static String imgHTTPPath = "http://172.17.111.59:8080/images/";
	
	/**
	 * cartoon nginx img path
	 */
	public final static String cartoon_img_http_path = "http://192.168.0.112/cartoon/";

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
	
	/**
	 * 内涵吧里面的host，主要是抓取漫画的
	 */
	public final static String cartoon_host = "www.neihan8.com";
	
	/**
	 * 抓取内涵吧里面的漫画的referer
	 */
	public final static String cartoon_referer = "http://www.neihan8.com/s/";
	
	/**
	 * @see 在内涵吧里面的返回json中，很多都是一个相对路径，我们需要加上上下文对象。
	 */
	public final static String cartoon_httpHost = "http://www.neihan8.com";
}
