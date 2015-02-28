package net.xieee.spider.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Cartoon;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.apache.commons.lang.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.sun.xml.internal.ws.message.StringHeader;

/**
 * 抓取漫画的信息，主要抓取网站为内涵吧O <class description>
 *
 * @author: royzhang
 * @version: 1.0, 2015年2月27日
 */
public class CartoonSpider {
	public List<Cartoon> getCartoonsByUrl(String url, String host, String referer, String httpHost) throws Exception {
		List<Cartoon> list = new ArrayList<Cartoon>();
		Document document = Jsoup.parse(StringEscapeUtils.unescapeJava(getJsonString(url, host, referer)));
		Elements elementsDiv = document.getElementsByTag("div");
		Element elementImg = null;
		String src = null;
		for (Element element : elementsDiv) {
			src = elementImg.attr("src");
			elementImg = element.getElementsByTag("img").first();
			Cartoon cartoon = new Cartoon();
			cartoon.setCartoon_detail(getDetail(element.text()));
			cartoon.setCartoon_image_name(src.substring(src.lastIndexOf("/")+1));
			cartoon.setCartoon_inter_url(httpHost + src);
			cartoon.setCartoon_user_name("admin");
			cartoon.setCartoon_parent_url(url);
			cartoon.setCartoon_name(elementImg.attr("alt"));
			cartoon.setImage_height(getHeightByStyle(elementImg.attr("style")));
			cartoon.setImage_width(getWidthByStyle(elementImg.attr("style")));
			list.add(cartoon);
		}
		return list;
	}



	/**
	 * 获取长度 <method description>
	 *
	 * @param style
	 * @return
	 */
	public int getHeightByStyle(String style) {
		if (StringUtil.isNull(style)) {
			return 0;
		}
		Pattern pattern = Pattern.compile("ht:(.*?)px;");
		Matcher matcher = pattern.matcher(style);
		if (matcher.find()) {
			return StringUtil.stringToInt(matcher.group(1));
		}
		return 0;
	}



	/**
	 * 获取长度
	 * <method description>
	 *
	 * @param style
	 * @return
	 */
	public int getWidthByStyle(String style) {
		if (StringUtil.isNull(style)) {
			return 0;
		}
		Pattern pattern = Pattern.compile(":(.*?)px;");
		Matcher matcher = pattern.matcher(style);
		if (matcher.find()) {
			return StringUtil.stringToInt(matcher.group(1));
		}
		return 0;
	}



	/**
	 * 获取cartoon的detail <method description>
	 *
	 * @param document
	 * @return
	 */
	public String getDetail(String document) {
		if (StringUtil.isNull(document)) {
			return null;
		}
		Pattern pattern = Pattern.compile("<br>([^>]*)</div>");
		Matcher matcher = pattern.matcher(document.toString());
		if (matcher.find()) {
			return matcher.group(1);
		}
		return null;
	}



	/**
	 * 获取内涵吧返回的数据
	 */
	protected static String getJsonString(String urlPath, String host, String referer) throws Exception {
		URL url = new URL(urlPath);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Accept", "application/json, text/javascript, */*; q=0.01");
		connection.setRequestProperty("Accept-Language", "en-US,en;q=0.8");
		connection.setRequestProperty("Cache-Control", "max-age=0");
		connection.setRequestProperty("Connection", "keep-alive");
		connection.setRequestProperty("Host", host);
		connection.setRequestProperty("Referer", referer);
		InputStream inputStream = connection.getInputStream();
		// 对应的字符编码转换
		Reader reader = new InputStreamReader(inputStream, "UTF-8");
		BufferedReader bufferedReader = new BufferedReader(reader);
		String str = null;
		StringBuffer sb = new StringBuffer();
		while ((str = bufferedReader.readLine()) != null) {
			sb.append(str);
		}
		reader.close();
		connection.disconnect();
		return sb.toString();
	}
}
