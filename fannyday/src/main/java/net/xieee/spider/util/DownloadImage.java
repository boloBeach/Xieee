package net.xieee.spider.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import net.xieee.web.bean.Cartoon;
import net.xieee.web.bean.Picture;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class DownloadImage {
	public PictureServiceImpl pictureServiceImpl;
	public DownloadImage(){
		// 首先判断是否已经被下载了，如果被下载了，那么直接就返回。通过获取xml文件才做。
		String xmlPath = DownloadImage.class.getClassLoader().getResource(Constants.springXMLName).getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext("/"+xmlPath);
		pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
	}
	
	public void DownloadCartoonImg(List<Cartoon> cartoons) throws Exception{
		if(cartoons.isEmpty()){
			return;
		}
		for (Cartoon cartoon : cartoons) {
			boolean isTure = pictureServiceImpl.checkCartoonImg(cartoon.getCartoon_inter_url());
			if(!isTure){
				URL url = new URL(cartoon.getCartoon_inter_url());
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
				InputStream is = connection.getInputStream();
				/*BufferedImage bufferedImage = ImageIO.read(is);
				picture.setWidth(bufferedImage.getWidth());
				picture.setHeight(bufferedImage.getHeight());*/
				byte[] bs = new byte[1024];
				int len;
				File sf = new File(Constants.cartoon_savePath);
				if (!sf.exists()) {
					sf.mkdirs();
				}
				OutputStream os = new FileOutputStream(sf.getPath() + "/" + cartoon.getCartoon_image_name());
				while ((len = is.read(bs)) != -1) {
					os.write(bs, 0, len);
				}
				cartoon.setCartoon_local_url(Constants.cartoon_img_http_path+cartoon.getCartoon_image_name());
				pictureServiceImpl.saveCartoon(cartoon);
				os.close();
				is.close();
			}
		}
		
	}
	
	public void Download(Picture picture,String host) throws IOException{
		boolean isTrue = pictureServiceImpl.checkHasPicture(picture.getPicture_name());
		if (isTrue) {
			return;
		}
		URL url = new URL(picture.getInter_url());
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Accept", "image/webp,*/*;q=0.8");
		connection.setRequestProperty("Accept-Encoding", "gzip, deflate, sdch");
		connection.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4");
		connection.setRequestProperty("Cache-Control", "max-age=0");
		connection.setRequestProperty("Connection", "keep-alive");
		connection.setRequestProperty("Host", host);
		connection.setRequestProperty("Referer", "http://image.baidu.com");
		
		//connection.setRequestProperty("Host", host);
		//connection.setRequestProperty("Accept", "image/webp,*/*;q=0.8");
		//connection.setRequestProperty("Accept-Encoding", "gzip,deflate,sdch");
		//connection.setRequestProperty("Accept-Language", "en-US,en;q=0.8");
		connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		InputStream is = connection.getInputStream();
		/*BufferedImage bufferedImage = ImageIO.read(is);
		picture.setWidth(bufferedImage.getWidth());
		picture.setHeight(bufferedImage.getHeight());*/
		byte[] bs = new byte[1024];
		int len;
		File sf = new File(Constants.ps_picture_save_path);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "/" + picture.getPicture_name());
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		picture.setLocal_url(Constants.imgHTTPPath+picture.getPicture_name());
		pictureServiceImpl.savePicture(picture);
		os.close();
		is.close();
	}
}
