package net.xieee.test;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.Log;
import net.xieee.spider.util.NeiHanPsPicture;
import net.xieee.web.bean.Picture;

public class TestNeiHanPsPicture {
	public static void main(String[] args) {
		NeiHanPsPicture neiHanPsPicture = new NeiHanPsPicture();
		DownloadImage downloadImage = new DownloadImage();
		Logger logger = Log.getLogger(TestNeiHanPsPicture.class).logger;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		logger.warn("spilker TestNeiHanPsPicture start");
		for (int i = 0; i < 20; i++) {
			url = "http://www.neihan8.com/s/data.php?start="+i+"&num=1&type=3&markid=undefined&typeid=1&hotdate=14&tagtid=2";
			try {
				Picture picture = neiHanPsPicture.getPicturesByNeiHanPs(url, referer, host, httpHost);
				downloadImage.Download(picture, host,Constants.ps_picture_save_path,Constants.ps_img_http_path);
			} catch (Exception e) {
				logger.error(e.toString());
			}
		}
	}
}
