package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.HahaquGodReply;
import net.xieee.web.bean.Picture;

public class TestHahaqu {
	public static void main(String[] args) throws Exception{
		HahaquGodReply hahaquGodReply = new HahaquGodReply();
		DownloadImage downloadImage = new DownloadImage();
		String url = "";
		String host = "www.hahaqu.com";
		for (int i = 1; i < 1129; i++) {
			url = "http://www.hahaqu.com/tag_7_"+i+".html";
			List<Picture> pictures = hahaquGodReply.getPicturesByHahaqu(url, host, host,"http://www.hahaqu.com/");
			for (Picture picture : pictures) {
				System.out.println(picture.toString());
				downloadImage.Download(picture, host,Constants.god_reply_img_save_path,Constants.god_img_http_path);
			}
		}
	}
}
