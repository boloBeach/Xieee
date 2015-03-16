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
 * 哈哈趣的神回复抓取
 * @author bolobeach
 * @see http://www.hahaqu.com/tag_7_1127.html
 * <pre>
 * 		分析网站,http://www.hahaqu.com/tag_7_1127.html tag_7 表示菜单是7,1127表示是1127页
 * </pre>
 */
public class HahaquGodReply {
	
	/**
	 * 抓取哈哈趣的神回复代码，它这个有些是图片，有一些是文字，在显示的时候，首先判断有没有图片，如果有图片则显示图片，如果没有图片则显示detail
	 * @param url 哈哈趣的url地址
	 * @param host host地址，www.hahaqu.com
	 * @param referer referer->www.hahaqu.com
	 * @return Java.util.List<{@link Picture}>
	 * @throws IOException
	 */
	public static List<Picture> getPicturesByHahaqu(String url,String host,String referer,String httpHost) throws IOException{
		List<Picture> pictureList = new ArrayList<Picture>();
		InterImagesUtil imagesUtil = new InterImagesUtil();
		Document document = imagesUtil.getDocumentByUrl(url, host, referer);
		Elements elements = document.getElementsByClass("mixed");
		Elements pictures = null;
		Elements hrefs = null;
		Elements pic_text = null;
		String imgUrl = "";
		for (Element element : elements) {
			Picture picture = new Picture();
			hrefs = element.getElementsByTag("a");
			picture.setKey_word(Constants.god_reply);
			if(hrefs.size()>=1){
				picture.setTitle(hrefs.get(1).text());
			}
			pic_text = element.getElementsByClass("pic_text");
			if(pic_text!=null){
				if(pic_text.first()!=null){
					pictures = pic_text.first().getElementsByTag("img");
					if(pictures!=null){
						if(pictures.size()==1){
							Element pictureElement = pictures.first();
							picture.setWidth(StringUtil.stringToInt(pictureElement.attr("w").replaceAll("px", "")));
							picture.setHeight(StringUtil.stringToInt(pictureElement.attr("h").replaceAll("px", "")));
							picture.setSpark_url(url);
							imgUrl = pictureElement.attr("src");
							picture.setPicture_name(imgUrl.substring(imgUrl.lastIndexOf("/")+1, imgUrl.length()));
							picture.setInter_url(httpHost+imgUrl);
							pictureList.add(picture);
						}
					}else {
						picture.setDetail(pic_text.first().getElementsByTag("p").text());
						pictureList.add(picture);
					}
				}
			}
			
		}
		return pictureList;
	}
	public static void main(String[] args) throws Exception{
		String host = "www.hahaqu.com";
		String url = "http://www.hahaqu.com/tag_7_1128.html";
		List<Picture> pictures = getPicturesByHahaqu(url, host, host,"http://www.hahaqu.com/");
		for (Picture picture : pictures) {
			System.out.println(picture.toString());
		}
	}
}
