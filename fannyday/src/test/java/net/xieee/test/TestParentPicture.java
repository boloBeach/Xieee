package net.xieee.test;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class TestParentPicture {
	public static PictureServiceImpl pictureServiceImpl;
	public TestParentPicture(){
		// 首先判断是否已经被下载了，如果被下载了，那么直接就返回。通过获取xml文件才做。
		String xmlPath = DownloadImage.class.getClassLoader().getResource(Constants.springXMLName).getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext("/"+xmlPath);
		pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
	}
	
	public static void main(String[] args) {
		TestParentPicture testParentPicture = new TestParentPicture();
		for (int i = 1; i < 100; i++) {
			//System.out.println(pictureServiceImpl.groupGif(2, "搞笑gif第"+i+"期"));
			//System.out.println(pictureServiceImpl.groupGif(3, "今日囧途第"+i+"期"));
			System.out.println(pictureServiceImpl.groupGif(4, "漂亮MM第"+i+"期"));
		}
	}
}
