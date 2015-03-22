package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.TodayJoke;
import net.xieee.web.bean.Picture;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class TestToday {
	public static PictureServiceImpl pictureServiceImpl;
	public TestToday(){
		// 首先判断是否已经被下载了，如果被下载了，那么直接就返回。通过获取xml文件才做。
		String xmlPath = DownloadImage.class.getClassLoader().getResource(Constants.springXMLName).getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext("/"+xmlPath);
		pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
	}
	
	public static void main(String[] args) {
		String url_host = "pic.scnjnews.com";
		String referer = "http://pic.scnjnews.com/";
		String bbs_host = "bbs.scnjnews.com";
		String httpHost = "http://bbs.scnjnews.com/";
		TodayJoke todayJoke = new TodayJoke();
		DownloadImage downloadImage = new DownloadImage();
		for (int i = 1; i < 500; i++) {
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
