package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
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
		for (int i = 0; i < 500; i++) {
			try {
				String url = "http://pic.scnjnews.com/forum.php?mod=forumdisplay&fid=173&filter=&orderby=lastpost&page="+i+"&t=5450279";
				List<Picture> list = todayJoke.getTodayJoke(url, url_host, bbs_host, referer, httpHost);
				for (Picture picture : list) {
					System.out.println(picture.toString());
					downloadImage.Download(picture, bbs_host, Constants.today_img_save_path, Constants.today_img_http_path);
				}
				System.err.println(url);
				Thread.sleep(5000);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}
}
