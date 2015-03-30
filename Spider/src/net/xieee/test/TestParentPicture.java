package net.xieee.test;

import net.xieee.util.PictureServiceImpl;

public class TestParentPicture {
	
	public static void main(String[] args) {
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
		TestParentPicture testParentPicture = new TestParentPicture();
		for (int i = 38; i < 100; i++) {
			//System.out.println(pictureServiceImpl.groupGif(2, "搞笑gif第"+i+"期"));
			//System.out.println(pictureServiceImpl.groupGif(3, "今日囧途第"+i+"期"));
		}
	}
}
