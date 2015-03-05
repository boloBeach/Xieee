package net.xieee.test;

import java.net.URL;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.NeiHanJokePicture;
import net.xieee.web.bean.Picture;

public class TestNeiHanBaJokePicture {
	public static void main(String[] args) {
		NeiHanJokePicture neiHanJokePicture = new NeiHanJokePicture();
		DownloadImage downloadImage = new DownloadImage();
		String url = null;
		String host = "www.neihan8.com";
		String referer = "http://www.neihan8.com/s/";
		String httpHost = "http://www.neihan8.com";
		for (int i = 0; i < 600; i++) {
			url = "http://www.neihan8.com/s/data.php?start="+i+"&num=1&type=3&markid=undefined&typeid=63449&hotdate=14&tagtid=2";
			try {
				Picture picture = neiHanJokePicture.getPicturesByNeiHan(url, referer, host, httpHost);
				downloadImage.Download(picture, host,Constants.joke_picture_save_path,Constants.imgHTTPPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//neiHanJokePicture.getPicturesByNeiHan(url, referer, host, httpHost);
	}
}
