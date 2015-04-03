package net.xieee.test;

import java.util.List;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.HahaquGodReply;
import net.xieee.spider.util.Log;
import net.xieee.util.PictureServiceImpl;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Picture;

public class TestHahaqu2{
	public void test(){
		HahaquGodReply hahaquGodReply = new HahaquGodReply();
		DownloadImage downloadImage = new DownloadImage();
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
		Logger logger = Log.getLogger(TestHahaqu2.class).logger;
		String url = "";
		String host = "www.hahaqu.com";
			for(int i=1;i<=2;i++){
			url = "http://www.hahaqu.com/tag_7_"+i+".html";
			try {
				logger.warn("spilder start and url is "+url);
				List<Picture> pictures = hahaquGodReply.getPicturesByHahaqu(url, host, host,"http://www.hahaqu.com/");
				for (Picture picture : pictures) {
					if(StringUtil.isNull(picture.getPicture_name())){
						pictureServiceImpl.saveGadReply(picture);
					}else{
						downloadImage.Download(picture, host,Constants.god_reply_img_save_path,Constants.god_img_http_path);
					}
				}
			
			} catch (Exception e) {
				logger.error(e.toString());
			}
		}
	}
	public static void main(String[] args) {
		TestHahaqu2 testHahaqu = new TestHahaqu2();
		testHahaqu.test();
	}
}
