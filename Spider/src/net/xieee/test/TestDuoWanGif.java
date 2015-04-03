package net.xieee.test;

import java.util.List;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.DuoWanSpider;
import net.xieee.spider.util.Log;
import net.xieee.web.bean.Picture;

public class TestDuoWanGif {
	public static void main(String[] args) {
		Logger logger = Log.getLogger(TestDuoWanGif.class).logger;
		DuoWanSpider duoWanSpider = new DuoWanSpider();
		String url="http://tu.duowan.com/m/bxgif?offset=0&order=created&math=0.9889702007640153";
		String host="tu.duowan.com";
		String referer="http://tu.duowan.com/m/bxgif";
		String httpHost = null;
		DownloadImage downloadImage = new DownloadImage();
		try {
			logger.warn("spilder start and url is "+url);
			List<Picture> list = duoWanSpider.getSpiderDuoWanGif(url, host, referer, httpHost);
			for (Picture picture : list) {
				downloadImage.Download(picture, host, Constants.gif_savePath, Constants.gif_img_http_path);
			}
		} catch (Exception e) {
			logger.error(e.toString());
		}
	}
}
