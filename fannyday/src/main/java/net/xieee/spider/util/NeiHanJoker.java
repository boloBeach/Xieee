package net.xieee.spider.util;

import net.xieee.web.bean.Picture;

import org.apache.commons.lang.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class NeiHanJoker {
	/**
	 * 获取内涵吧里面的笑话
	 * <method description>
	 *
	 * @param url 内涵吧的url地址
	 * @param referer request 头部的referer信息
	 * @param host 内涵吧的host文件
	 * @param httpHost 内涵吧的上下文
	 * @return
	 */
	public Picture getJokesByNeiHan(String url, String referer, String host, String httpHost) throws Exception {
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
		picture.setKey_word("节操笑话");
		picture.setTitle(cartoonSpider.getTitle(document));
		picture.setInter_url(httpHost + src);
		picture.setHeight(cartoonSpider.getHeightByStyle(elementImg.attr("style")));
		picture.setWidth(cartoonSpider.getWidthByStyle(elementImg.attr("style")));
		return picture;
	}
}
