package net.xieee.spider.util;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Picture;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


/**
 * 抓取今日囧途，http://pic.scnjnews.com/
 * <class description>
 *
 * @author: royzhang
 * @version: 1.0, Mar 20, 2015
 */
public class TodayJoke {
	
	public static List<Picture> getTodayJoke(String url,String url_host,String bbs_host,String referer,String httpHost) throws IOException{
		if(StringUtil.isNull(url)){
			return null;
		}
		List<Picture> list = new ArrayList<Picture>();
		InterImagesUtil imagesUtil = new InterImagesUtil();
		Document document = imagesUtil.getDocumentByUrl(url, httpHost, referer);
		// 获取小图片
		Elements small_picture_elements = document.getElementsByClass("c");
		Element aElement = null;
		String href = null;
		Element re_height_element = null;
		Element ts_element = null;
		String imgName = null;
		// 循环出小图片以及大图片的地址
		for (Element element : small_picture_elements) {
			Picture picture = new Picture();
			aElement = element.getElementsByTag("a")!=null? element.getElementsByTag("a").first():null;
			if(!StringUtil.isNull(aElement)){
				href = aElement.attr("href");
				picture.setInter_url(href);
				// 获取小的图片
				picture.setInter_url_samll(httpHost+(aElement.getElementsByTag("img")!=null ? aElement.getElementsByTag("img").first().attr("src"):null));
				document = imagesUtil.getDocumentByUrl(href, bbs_host, referer);
				re_height_element = (Element) document.getElementById("re_height");
				imgName = re_height_element.getElementsByTag("img")!=null?re_height_element.getElementsByTag("img").attr("file"):null;
				if(!StringUtil.isNull(imgName)){
					picture.setPicture_name(imgName.substring(imgName.lastIndexOf("/")+1, imgName.length()));
				}
				picture.setInter_url(httpHost+imgName);
				ts_element = document.getElementsByClass("ts")!=null?document.getElementsByClass("ts").first():null;
				if(!StringUtil.isNull(ts_element)){
					picture.setTitle(ts_element.getElementsByTag("span")!=null ? ts_element.getElementsByTag("span").first().text():null);
				}
				picture.setKey_word(Constants.today_keyword+"");
				list.add(picture);
			}
		}
		return list;
		
	}
	
	
	
	public static void main(String[] args) throws Exception {
		InterImagesUtil imagesUtil = new InterImagesUtil();
		String url = "http://pic.scnjnews.com/forum.php?mod=forumdisplay&fid=173&filter=&orderby=lastpost&page=3&t=5450279";
		String url_host = "pic.scnjnews.com";
		String referer = "http://pic.scnjnews.com/";
		String bbs_host = "bbs.scnjnews.com";
		String httpHost = "http://bbs.scnjnews.com/";
		List<Picture> list = getTodayJoke(url, url_host, bbs_host, referer, httpHost);
		for (Picture picture : list) {
			System.out.println(picture.toString());
		}
	}
}
