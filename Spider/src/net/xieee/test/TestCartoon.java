package net.xieee.test;

import java.util.List;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;

import net.xieee.spider.util.CartoonSpider;
import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.Log;
import net.xieee.web.bean.Cartoon;

public class TestCartoon {

	public static void main(String[] args) {
		Logger logger = Log.getLogger(TestCartoon.class).logger;
		CartoonSpider cartoonSpider = new CartoonSpider();
		int num = 1;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		DownloadImage downloadImage = new DownloadImage();
		for (int start = 3; start >=0 ; start--) {
			url = "http://www.neihan8.com/s/data.php?start="+start+"&num="+num+"&type=3&markid=undefined&typeid=63446&hotdate=14&tagtid=2";
			try {
				List<Cartoon> cartoons = cartoonSpider.getCartoonsByUrl(url, host, referer, httpHost);
				for (Cartoon cartoon : cartoons) {
					System.out.println(cartoon.toString());
				}
				downloadImage.DownloadCartoonImg(cartoons,Constants.cartoon_savePath,Constants.cartoon_img_http_path);
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		}
		
	
	}
}
