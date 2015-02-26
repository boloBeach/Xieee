package net.xieee.test;

import java.io.IOException;

import net.xieee.spider.util.DownloadImage;
import net.xieee.web.bean.Picture;

public class TestSpring {
	public static void main(String[] args) {
		DownloadImage downloadImage = new DownloadImage();
		Picture picture = new Picture();
		picture.setInter_url("http://ww2.sinaimg.cn/large/e556fbd4jw1elslc7r39qj20qo140781.jpg");
		picture.setTitle("e556fbd4jw1elslc7r39qj20qo140781.jpg");
		picture.setPicture_name("e556fbd4jw1elslc7r39qj20qo140781.jpg");
		picture.setSpark_url("http://www.baidu.com");
		picture.setKey_word("11");
		String host = "www.lebazi.com";
		try {
			downloadImage.Download(picture, host);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
