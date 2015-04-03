package net.xieee.spider.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Picture;

import org.apache.commons.lang.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DuoWanSpider {
	/**
	 * 抓取http://tu.duowan.com/m/bxgif gif信息 <method description>
	 *
	 * @param url
	 *            url地址
	 *            eg:http://tu.duowan.com/m/bxgif?offset=60&order=created&math
	 *            =0.9889702007640153
	 * @see offset 表示从那里开始抓取的，duowan是30条数据分一页，而且必须获取小图片
	 * @param host
	 *            tu.duowan.com
	 * @param referer
	 *            http://tu.duowan.com/m/bxgif
	 * @param httpHost
	 *            表示抓取到的gif地址
	 * @return {@link List<Picture>}
	 */
	public List<Picture> getDuoWanGif(String url, String host, String referer, String httpHost) throws Exception {
		Document document = Jsoup.parse(StringEscapeUtils.unescapeJava(getJsonString(url, host, referer)));
		Elements liElements = document.getElementsByTag("li");
		String hrefDetail = "";
		Element hrefElement = null;
		String href = null;
		String small_img = null;
		String jsonDetail = null;
		List<Picture> list = new ArrayList<Picture>();
		String imgUrl = "";
		for (Element element : liElements) {
			hrefElement = element.getElementsByTag("a").first();
			small_img = element.getElementsByTag("img").first().attr("src");
			href = hrefElement.attr("href");
			hrefDetail = "http://tu.duowan.com/index.php?r=show/getByGallery/&gid="+getSpiderId(href)+"&_=1427690951100";
			jsonDetail = StringEscapeUtils.unescapeJava(getJsonString(hrefDetail, httpHost, referer));
			JSONObject jsonObject = JSONObject.fromObject(jsonDetail);
			JSONArray jsonArray = jsonObject.getJSONArray("picInfo");
			for (Object object : jsonArray) {
				Picture picture = new Picture();
				picture.setSpark_url(hrefDetail);
				picture.setKey_word(Constants.gif_img_keyword+"");
				picture.setInter_url_samll(small_img);
				JSONObject imgObject = (JSONObject)object;
				picture.setDetail(imgObject.getString("add_intro"));
				picture.setAuthor("admin");
				picture.setWidth(imgObject.getInt("file_width"));
				picture.setHeight(imgObject.getInt("file_height"));
				imgUrl = imgObject.getString("url");
				picture.setPicture_name(imgUrl.substring(imgUrl.lastIndexOf("/")+1, imgUrl.length()));
				picture.setInter_url(imgUrl);
				list.add(picture);
			}
			Thread.sleep(1000);
		}
		return list;
	}
	
	/**
	 * 自动抓取的，因为可能每周只有一个gif，所以需要自己抓取
	* <method description>
	*
	* @param url
	* @param host
	* @param referer
	* @param httpHost
	* @return
	* @throws Exception
	 */
	public List<Picture> getSpiderDuoWanGif(String url, String host, String referer, String httpHost) throws Exception {
		Document document = Jsoup.parse(StringEscapeUtils.unescapeJava(getJsonString(url, host, referer)));
		Element element = document.getElementsByTag("li").first();
		String hrefDetail = "";
		Element hrefElement = null;
		String href = null;
		String small_img = null;
		String jsonDetail = null;
		List<Picture> list = new ArrayList<Picture>();
		String imgUrl = "";
		hrefElement = element.getElementsByTag("a").first();
		small_img = element.getElementsByTag("img").first().attr("src");
		href = hrefElement.attr("href");
		hrefDetail = "http://tu.duowan.com/index.php?r=show/getByGallery/&gid="+getSpiderId(href)+"&_=1427690951100";
		jsonDetail = StringEscapeUtils.unescapeJava(getJsonString(hrefDetail, httpHost, referer));
		JSONObject jsonObject = JSONObject.fromObject(jsonDetail);
		JSONArray jsonArray = jsonObject.getJSONArray("picInfo");
		for (Object object : jsonArray) {
			Picture picture = new Picture();
			picture.setSpark_url(hrefDetail);
			picture.setKey_word(Constants.gif_img_keyword+"");
			picture.setInter_url_samll(small_img);
			JSONObject imgObject = (JSONObject)object;
			picture.setDetail(imgObject.getString("add_intro"));
			picture.setAuthor("admin");
			picture.setWidth(imgObject.getInt("file_width"));
			picture.setHeight(imgObject.getInt("file_height"));
			imgUrl = imgObject.getString("url");
			picture.setPicture_name(imgUrl.substring(imgUrl.lastIndexOf("/")+1, imgUrl.length()));
			picture.setInter_url(imgUrl);
			list.add(picture);
		}
		return list;
	}

	 

	/**
	 * 传入一个url地址，获取他对应的10进制id值
	 * <method description>
	 *	
	 * @param url 传入的id
	 * @return java.lang.Integer
	 */
	public int getSpiderId(String url) {
		if (StringUtil.isNull(url)) {
			return 0;
		}
		String hexCode = url.trim().replace("http://tu.duowan.com/g/", "").replace(".html", "").replace("/", "");
		return Integer.parseInt(hexCode, 16);
	}



	/**
	 * 抓取http://tu.duowan.com/m/bxgif 页面 <method description>
	 * 
	 * @param urlPath
	 *            url的路径
	 * @param host
	 *            host地址
	 * @param referer
	 *            从那个网站进入的
	 * @return 抓取的数据
	 */
	public static String getJsonString(String urlPath, String host, String referer) throws Exception {
		URL url = new URL(urlPath);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Accept", "application/json, text/javascript, */*; q=0.01");
		connection.setRequestProperty("Accept-Language", "en-US,en;q=0.8");
		connection.setRequestProperty("Cache-Control", "max-age=0");
		connection.setRequestProperty("Connection", "keep-alive");
		connection.setRequestProperty("Host", host);
		connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36");
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
