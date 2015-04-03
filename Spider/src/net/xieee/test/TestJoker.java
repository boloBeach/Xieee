package net.xieee.test;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.Log;
import net.xieee.spider.util.NeiHanJoker;
import net.xieee.web.bean.Picture;

public class TestJoker {
	public static void main(String[] args) {
		NeiHanJoker neiHanJoker = new NeiHanJoker();
		DownloadImage downloadImage = new DownloadImage();
		Logger logger = Log.getLogger(TestJoker.class).logger;
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		Picture picture = null;
		for (int i = 8; i >=0 ; i--) {
			url = "http://www.neihan8.com/s/data.php?start="+i+"&num=1&type=3&markid=undefined&typeid=63434&hotdate=14&tagtid=2";
			try {
				picture = neiHanJoker.getJokesByNeiHan(url, referer, host, httpHost);
				downloadImage.Download(picture, host, Constants.joker_img_save_path, Constants.joker_img_http_path);
			} catch (Exception e) {
				logger.error(e.toString());
			}
		}
	}
}
