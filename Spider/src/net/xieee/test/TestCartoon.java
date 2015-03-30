package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.CartoonSpider;
import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.web.bean.Cartoon;

public class TestCartoon {

	public static void main(String[] args) {
		CartoonSpider cartoonSpider = new CartoonSpider();
		int num = 1;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		DownloadImage downloadImage = new DownloadImage();
		for (int start = 1400; start >=0 ; start--) {
			url = "http://www.neihan8.com/s/data.php?start="+start+"&num="+num+"&type=3&markid=undefined&typeid=63446&hotdate=365&tagtid=2";
			try {
				List<Cartoon> cartoons = cartoonSpider.getCartoonsByUrl(url, host, referer, httpHost);
				for (Cartoon cartoon : cartoons) {
					System.out.println(cartoon.toString());
				}
				downloadImage.DownloadCartoonImg(cartoons,Constants.cartoon_savePath,Constants.cartoon_img_http_path);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
	}
}
