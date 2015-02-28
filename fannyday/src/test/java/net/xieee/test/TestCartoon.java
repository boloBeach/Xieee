package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.CartoonSpider;
import net.xieee.spider.util.DownloadImage;
import net.xieee.web.bean.Cartoon;

public class TestCartoon {

	public static void main(String[] args) {
		CartoonSpider cartoonSpider = new CartoonSpider();
		int num = 10;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		for (int start = 0; start <= 1130; start+=num) {
			url = "http://www.neihan8.com/s/data.php?start="+start+"&num="+num+"&type=3&markid=undefined&typeid=63446&hotdate=365&tagtid=2";
			try {
				List<Cartoon> cartoons = cartoonSpider.getCartoonsByUrl(url, host, referer, httpHost);
				DownloadImage downloadImage = new DownloadImage();
				downloadImage.DownloadCartoonImg(cartoons);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
	}
}
