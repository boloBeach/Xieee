package net.xieee.test;

import org.apache.log4j.Logger;

import net.xieee.spider.util.Log;
import net.xieee.util.PictureServiceImpl;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Params;

public class TestParentPicture {
	
	public static void main(String[] args) {
		Logger logger = Log.getLogger(TestParentPicture.class).logger;
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
		int[] arrayId = {2,3,4};
		for(int i = 0;i< arrayId.length;i++){
			try {
				Thread.sleep(1000);
				Params params = pictureServiceImpl.getParamsById(arrayId[i]);
				pictureServiceImpl.groupGif(params.getId(), params.getDescript()+""+params.getParamValue()+"期");
				pictureServiceImpl.saveParams(StringUtil.stringToInt(params.getParamValue())+1, params.getId());
				System.out.println(params.toString());
			} catch (InterruptedException e) {
				logger.error("The Thead Error="+e.toString());
				e.printStackTrace();
			}
		}
	}
}
