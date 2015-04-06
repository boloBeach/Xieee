package net.xieee.test;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Log;
import net.xieee.util.PictureServiceImpl;
import net.xieee.web.bean.Params;

public class TestParentPicture {
	
	public static void main(String[] args) {
		Logger logger = Log.getLogger(TestParentPicture.class).logger;
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
		for(int i = 1;i<=5;i++){
			try {
				Thread.sleep(1000);
				Params params = pictureServiceImpl.getParamsById(i);
				System.out.println(params.toString());
			} catch (InterruptedException e) {
				logger.error("线程出现错误:"+e.toString());
				e.printStackTrace();
			}
		}
	}
}
