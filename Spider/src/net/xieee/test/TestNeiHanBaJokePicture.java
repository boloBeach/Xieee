package net.xieee.test;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.Log;
import net.xieee.spider.util.NeiHanJokePicture;
import net.xieee.web.bean.Picture;

import org.apache.log4j.Logger;

public class TestNeiHanBaJokePicture {
	public static void main(String[] args) {
		NeiHanJokePicture neiHanJokePicture = new NeiHanJokePicture();
		DownloadImage downloadImage = new DownloadImage();
		Logger logger = Log.getLogger(TestNeiHanBaJokePicture.class).logger;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		for (int i = 0; i < 2; i++) {
			url = "http://www.neihan8.com/s/data.php?start="+i+"&num=1&type=0&markid=undefined&typeid=0&hotdate=14&tagtid=2";
			try {
				Picture picture = neiHanJokePicture.getPicturesByNeiHan(url, referer, host, httpHost);
				logger.warn(picture.toString());
				downloadImage.Download(picture, host,Constants.joke_picture_save_path,Constants.imgHTTPPath);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.toString());
			}
		}
	}
}
