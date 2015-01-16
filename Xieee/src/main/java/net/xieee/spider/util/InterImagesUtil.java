package net.xieee.spider.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

/**
 * get internet code
 * @author royzhang
 *
 */
public class InterImagesUtil {
	
	public PictureServiceImpl pictureServiceImpl;
	public InterImagesUtil(){
		// 首先判断是否已经被下载了，如果被下载了，那么直接就返回。通过获取xml文件才做。
		String xmlPath = DownloadImage.class.getClassLoader().getResource(Constants.springXMLName).getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext(xmlPath);
		pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
	}
	
	/**
	 * get Document by Url
	 */
	public  Document getDocumentByUrl(String url,String host) throws IOException{
		if(StringUtil.isNull(url) || StringUtil.isNull(host)){
			return null;
		}
		if(pictureServiceImpl.checkURL(url)==0){
			Connection connection = Jsoup.connect(url);
			connection.header("Host", host);
			connection.header("Cache-Control", "max-age=0");
			connection.header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
			connection.header("Accept-Encoding", "gzip,deflate,sdch");
			connection.header("Referer", "www.lebazi.com");
			connection.header("Connection", "keep-alive");
			connection.header("Accept-Language", "zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4");
			connection.userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36");
			connection.timeout(Constants.timeout);
			return connection.get();
		}else {
			return null;
		}
	}
	
	/**
	 * by the document and httpStart insert to qunue
	 * @param document the html document
	 * @param httpStart the http start String,eg : http://www.baidu.com
	 * @return boolean
	 */
	public boolean insertUrlToQuen(Document document,String httpStart){
		boolean result = false;
		if(!StringUtil.isNull(document)){
			Elements httpURLElements = document.getElementsByTag("a");
			String href = null;
			String title = null;
			for (Element element : httpURLElements) {
				href = element.attr("href");
				title = element.attr("title");
				if(StringUtil.isNull(title)){
					title = element.attr("alt");
				}
				if (!StringUtil.isNull(href) && ! Constants.filter.contains(href) && href.trim().contains("html")) {
					if (href.startsWith("/") && ! href.equals("#")) {
						href = httpStart + href;
					}
					if(!StringUtil.isNull(title) && pictureServiceImpl.checkURL(href)==0){
						pictureServiceImpl.savePictureURL(href,title);
					}
				}
				
			}
			result = true;
		}
		return result;
	}
	
	/**
	 * get images by url
	 * @param url
	 * @throws IOException 
	 */
	public static List<Picture> getImageByUrl(String url,String host,String webUrl) throws IOException{
		if(StringUtil.isNull(url)){
			return null;
		}
		List<Picture> list = new ArrayList<Picture>();
		Connection connection = Jsoup.connect(url);
		connection.header("Host", host);
		connection.header("Accept", "image/webp,*/*;q=0.8");
		connection.header("Accept-Encoding", "gzip,deflate,sdch");
		connection.header("Accept-Language", "en-US,en;q=0.8");
		connection.userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		connection.timeout(Constants.timeout);
		Document document = connection.get();
		Elements meta = document.getElementsByTag("meta");
		String keyWord = null;
		for (Element element : meta) {
			if (element.attr("name").equals("keywords")) {
				keyWord = element.attr("content");
				break;
			}
		}
		Elements imgElements = document.getElementsByTag("img");
		String imgUrl = null;
		String filename = null;
		String title = null;
		String detail = null;
		for (Element elementImg : imgElements) {
			imgUrl =elementImg.attr("src");
			title = elementImg.attr("title") == null?elementImg.attr("TITLE"):elementImg.attr("title");
			detail = elementImg.attr("alt") == null?elementImg.attr("ALT"):elementImg.attr("alt");
			if (!StringUtil.isNull(imgUrl)) {
				if (imgUrl.startsWith("/")) {
					imgUrl = webUrl + imgUrl;
				}
				filename = imgUrl.substring(imgUrl.lastIndexOf("/")+1, imgUrl.length());
				if (filename.contains(".gif") || filename.contains(".jpg")) {
					Picture picture = new Picture();
					picture.setKey_word(keyWord);
					picture.setInter_url(imgUrl);
					picture.setSpark_url(url);
					if(StringUtil.isNull(title)){
						title = detail;
					}
					picture.setTitle(title);
					picture.setDetail(detail);
					picture.setPicture_name(filename);
					list.add(picture);
				}
			}
		}
		
		return list;
	}
	
	public List<PageUrl> getList(int startId,int pageSize){
		return pictureServiceImpl.getPageUrls(startId, pageSize);
	}
	
	public int update(int id){
		return pictureServiceImpl.updateIsDelete(id);
	}
}
