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
	public final static String savePath = "D:/images";

	/**
	 * spring xml name
	 */
	public final static String springXMLName = "applicationContext.xml";
	
	/**
	 * get img by name
	 */
	public final static String admin = "admin";
}
