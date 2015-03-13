package net.xieee.test;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.NeiHanPsPicture;
import net.xieee.web.bean.Picture;

public class TestVirgin {
	
	public static void main(String[] args) {
		NeiHanPsPicture neiHanPsPicture = new NeiHanPsPicture();
		DownloadImage downloadImage = new DownloadImage();
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		for (int i =1700; i >=0; i--) {
			url = "http://www.neihan8.com/s/data.php?start="+i+"&num=1&type=3&markid=undefined&typeid=63434&hotdate=14&tagtid=2";
			try {
				Picture picture = neiHanPsPicture.getPicturesByNeiHanVirgin(url, referer, host, httpHost);
				downloadImage.Download(picture, host,Constants.virgin_img_save_path,Constants.virgin_img_http_path);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
