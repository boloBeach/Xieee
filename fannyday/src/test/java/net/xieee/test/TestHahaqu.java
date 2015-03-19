package net.xieee.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.HahaquGodReply;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Picture;
import net.xieee.web.service.impl.PictureServiceImpl;

public class TestHahaqu {
	
	public static PictureServiceImpl pictureServiceImpl;
	public TestHahaqu(){
		// 首先判断是否已经被下载了，如果被下载了，那么直接就返回。通过获取xml文件才做。
		String xmlPath = DownloadImage.class.getClassLoader().getResource(Constants.springXMLName).getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext("/"+xmlPath);
		pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
	}
	public void test(){
		HahaquGodReply hahaquGodReply = new HahaquGodReply();
		DownloadImage downloadImage = new DownloadImage();
		String url = "";
		String host = "www.hahaqu.com";
			for(int i=1;i<=6770;i++){
			url = "http://www.hahaqu.com/tag_7_"+40+".html";
			try {
				List<Picture> pictures = hahaquGodReply.getPicturesByHahaqu(url, host, host,"http://www.hahaqu.com/");
				for (Picture picture : pictures) {
					System.out.println(picture.toString());
					if(StringUtil.isNull(picture.getPicture_name())){
						System.err.println(pictureServiceImpl.saveGadReply(picture));
					}else{
						downloadImage.Download(picture, host,Constants.god_reply_img_save_path,Constants.god_img_http_path);
					}
				}
				break;
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		TestHahaqu testHahaqu = new TestHahaqu();
		testHahaqu.test();
	}
}
