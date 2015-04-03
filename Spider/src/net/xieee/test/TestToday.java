package net.xieee.test;

import java.util.List;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.Log;
import net.xieee.spider.util.TodayJoke;
import net.xieee.util.PictureServiceImpl;
import net.xieee.web.bean.Picture;

public class TestToday {
	
	public static void main(String[] args) {
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
		String url_host = "pic.scnjnews.com";
		String referer = "http://pic.scnjnews.com/";
		String bbs_host = "bbs.scnjnews.com";
		String httpHost = "http://bbs.scnjnews.com/";
		TodayJoke todayJoke = new TodayJoke();
		DownloadImage downloadImage = new DownloadImage();
		Logger logger = Log.getLogger(TestToday.class).logger;
		logger.warn("test today start");
		for (int i = 0; i < 1; i++) {
			try {
				String url = "http://pic.scnjnews.com/forum.php?mod=forumdisplay&fid=173&filter=&orderby=lastpost&page="+i+"&t=5450279";
				List<Picture> list = todayJoke.getTodayJoke(url, url_host, bbs_host, referer, httpHost);
				for (Picture picture : list) {
					downloadImage.Download(picture, bbs_host, Constants.today_img_save_path, Constants.today_img_http_path);
				}
				Thread.sleep(5000);
				} catch (Exception e) {
					logger.error(e.toString());
				}
			}
	}
}
