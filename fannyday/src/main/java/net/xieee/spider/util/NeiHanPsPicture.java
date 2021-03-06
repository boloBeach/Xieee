package net.xieee.spider.util;

import net.xieee.web.bean.Picture;

import org.apache.commons.lang.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/**
 * 内涵吧，恶搞ps图片
 * <class description>
 *
 * @author: royzhang
 * @version: 1.0, 2015年3月4日
 */
public class NeiHanPsPicture {
	/**
	 * 获取内涵吧里面的搞笑图片
	 * <method description>
	 *
	 * @param url 内涵吧的url地址
	 * @param referer request 头部的referer信息
	 * @param host 内涵吧的host文件
	 * @param httpHost 内涵吧的上下文
	 * @return
	 */
	public Picture getPicturesByNeiHanPs(String url, String referer, String host, String httpHost) throws Exception {
		CartoonSpider cartoonSpider = new CartoonSpider();
		Document document = Jsoup.parse(StringEscapeUtils.unescapeJava(CartoonSpider.getJsonString(url, host, referer)));
		Element elementsDiv = document.getElementsByTag("div").first();
		Element elementImg = null;
		String src = null;
		elementImg = elementsDiv.getElementsByTag("img").first();
		src = elementImg.attr("src");
		Picture picture = new Picture();
		picture.setPicture_name(src.substring(src.lastIndexOf("/")+1));
		picture.setDetail(elementsDiv.text());
		picture.setSpark_url(url);
		picture.setAuthor("admin");
		picture.setKey_word("恶搞图片");
		picture.setTitle(cartoonSpider.getTitle(document));
		picture.setInter_url(httpHost + src);
		picture.setHeight(cartoonSpider.getHeightByStyle(elementImg.attr("style")));
		picture.setWidth(cartoonSpider.getWidthByStyle(elementImg.attr("style")));
		return picture;
	}
	
	/**
	 * 获取内涵吧里面的节操笑话
	 * <method description>
	 *
	 * @param url 内涵吧的url地址
	 * @param referer request 头部的referer信息
	 * @param host 内涵吧的host文件
	 * @param httpHost 内涵吧的上下文
	 * @return
	 */
	public Picture getPicturesByNeiHanVirgin(String url, String referer, String host, String httpHost) throws Exception {
		CartoonSpider cartoonSpider = new CartoonSpider();
		Document document = Jsoup.parse(StringEscapeUtils.unescapeJava(CartoonSpider.getJsonString(url, host, referer)));
		Element elementsDiv = document.getElementsByTag("div").first();
		Element elementImg = null;
		String src = null;
		elementImg = elementsDiv.getElementsByTag("img").first();
		src = elementImg.attr("src");
		Picture picture = new Picture();
		picture.setPicture_name(src.substring(src.lastIndexOf("/")+1));
		picture.setDetail(elementsDiv.text());
		picture.setSpark_url(url);
		picture.setAuthor("admin");
		picture.setKey_word(Constants.key_word+"");
		picture.setTitle(cartoonSpider.getTitle(document));
		picture.setInter_url(httpHost + src);
		picture.setHeight(cartoonSpider.getHeightByStyle(elementImg.attr("style")));
		picture.setWidth(cartoonSpider.getWidthByStyle(elementImg.attr("style")));
		return picture;
	}
}
