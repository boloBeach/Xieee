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
	 * ps picture save path
	 */
	public final static String ps_picture_save_path = "/usr/local/nginx/html/fannyday/images/ps";

	/**
	 * 搞笑图片的nginx路径
	 */
	public final static String joke_picture_save_path = "/usr/local/nginx/html/fannyday/images";

	/**
	 * save cartoon img path
	 */
	public final static String cartoon_savePath = "/usr/local/nginx/html/fannyday/cartoon";

	/**
	 * 图片显示地址
	 */
	public final static String imgHTTPPath = "http://www.bolobeach.com/images/";

	/**
	 * 节操漫画的图片放置位置
	 */
	public final static String joker_img_save_path = "/usr/local/nginx/html/fannyday/images/joke";

	/**
	 * 节操漫画的图片放置位置
	 */
	public final static String joker_img_http_path = "http://www.bolobeach.com/images/joke/";

	/**
	 * cartoon nginx img path
	 */
	public final static String cartoon_img_http_path = "http://www.bolobeach.com/cartoon/";

	/**
	 * 节操笑话的http img path
	 */
	public final static String virgin_img_http_path = "http://www.bolobeach.com/virgin/";

	/**
	 * 节操笑话的保存路径
	 */
	public final static String virgin_img_save_path = "/usr/local/nginx/html/fannyday/images/virgin";
	
	/**
	 * 存放神回复的地址
	 */
	public final static String god_reply_img_save_path = "/usr/local/nginx/html/fannyday/images/godreply";
	
	/**
	 * 神回复的http地址
	 */
	public final static String god_img_http_path = "http://www.bolobeach.com/images/godreply/";
	
	/**
	 * 今日囧图的nginx 存放地址
	 */
	public final static String today_img_save_path="/usr/local/nginx/html/fannyday/images/today";
	
	/**
	 * 今日囧途的http地址
	 */
	public final static String today_img_http_path = "http://www.bolobeach.com/images/today/";

	/**
	 * ps 图片的http地址
	 */
	public final static String ps_img_http_path = "http://www.bolobeach.com/images/ps/";

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
	 * 首页瀑布流每页显示多少条数据
	 */
	public final static Integer index_picture_count=12;

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

	/**
	 * @see 随机生成12个搞笑漫画出来。
	 */
	public final static Integer rand_cartoon_count = 19;

	/**
	 * @see 节操笑话的key_word
	 */
	public final static Integer key_word = 8;
	
	/**
	 * @see 恶搞图片
	 */
	public final static Integer ps_key_word = 7;
	
	/**
	 * @see detail每个分页的条数
	 */
	public final static Integer detailt_picture_size=1;
	
	/**
	 * 今日囧途的key_wrod
	 */
	public final static Integer today_keyword = 3;
	
	
	/**
	 * @see 神回复
	 */
	public final static Integer god_reply=9;
}
