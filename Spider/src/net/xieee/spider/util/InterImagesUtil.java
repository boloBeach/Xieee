package net.xieee.spider.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.xieee.util.PictureServiceImpl;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * get internet code
 * @author royzhang
 *
 */
public class InterImagesUtil {
	
	public PictureServiceImpl pictureServiceImpl;
	public InterImagesUtil(){
		pictureServiceImpl = new PictureServiceImpl();
	}
	
	/**
	 * get Document by Url
	 * @param referer "http://www.lebazi.com/"
	 */
	public  Document getDocumentByUrl(String url,String host,String referer) throws IOException{
		if(StringUtil.isNull(url) || StringUtil.isNull(host)){
			return null;
		}
		if(pictureServiceImpl.checkURL(url)==0){
			Connection connection = Jsoup.connect(url);
			connection.header("Host", host);
			//connection.data("query","Java");
			connection.cookie("auth","token");
			connection.header("Cache-Control", "max-age=0");
			connection.header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
			connection.header("Accept-Encoding", "gzip,deflate,sdch");
			connection.header("Referer", referer);
			connection.header("Connection", "keep-alive");
			connection.header("Accept-Language", "zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4");
			connection.userAgent("Mozilla");
			connection.timeout(Constants.timeout);
			pictureServiceImpl.savePictureURL(url, "");
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
					
					if (!href.contains("http")) {
						href = httpStart+href;
					}
					
					
					if(!StringUtil.isNull(title) && pictureServiceImpl.checkSpiderUrl(href)==0){
						pictureServiceImpl.savePictureURL(href,title);
					}
				}
				
			}
			result = true;
		}
		return result;
	}
	
	/**
	 * 通过document来获取图片并且下载
	 * @param document
	 * @param parentUrl
	 * @param host
	 * @param webUrl
	 * @return
	 * @throws IOException
	 */
	public List<Picture> getImagesByDocument(Document document,String parentUrl,String host,String webUrl) throws IOException{
		if(StringUtil.isNull(document)){
			return null;
		}
		List<Picture> list = new ArrayList<Picture>();
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
				if (filename.contains(".gif")) {
					if(!pictureServiceImpl.checkHasPicture(filename)){
						Picture picture = new Picture();
						picture.setKey_word(keyWord);
						picture.setInter_url(imgUrl);
						picture.setSpark_url(parentUrl);
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
		}
		
		return list;
	}
	
	/**
	 * get images by url
	 * @param url
	 * @throws IOException 
	 */
	public  List<Picture> getImageByUrl(String url,String host,String webUrl) throws IOException{
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
				if (filename.contains(".gif")) {
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
	
	/**
	 * 通过id获取url地址
	 * @param startId 开始的ID
	 * @param pageSize 每页的大小
	 * @return list<pageUrl>
	 */
	public List<PageUrl> getList(int startId,int pageSize){
		List<PageUrl> list = new ArrayList<PageUrl>();
		/*List<Map<String, Object>> map = (List<Map<String, Object>>) pictureServiceImpl.getPageUrls(startId, pageSize);
		for (Map<String, Object> temp : map) {
			PageUrl pageUrl = new PageUrl();
			 for (String k : temp.keySet())  
		      {  
		       if(k.equals("id")){
		    	   pageUrl.setId((Integer)temp.get(k));
		       } 
		       if(k.equals("url")){
		    	   pageUrl.setUrl((String)temp.get(k));
		       } 
		      } 
			 list.add(pageUrl);
		}*/
		return list;
	}
	
	/**
	 * 通过一个url的id来更新是否抓取过了。
	 * @param id
	 * @return
	 */
	public int update(int id){
		return pictureServiceImpl.updateIsDelete(id);
	}
}
