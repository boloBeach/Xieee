package net.xieee.spider.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import net.xieee.util.PictureServiceImpl;
import net.xieee.web.bean.Cartoon;
import net.xieee.web.bean.Picture;

public class DownloadImage {
	public void DownloadCartoonImg(List<Cartoon> cartoons,String fileSavePath,String httpPath) throws Exception{
		if(cartoons.isEmpty()){
			return;
		}
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
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
				File sf = new File(fileSavePath);
				if (!sf.exists()) {
					sf.mkdirs();
				}
				OutputStream os = new FileOutputStream(sf.getPath() + "/" + cartoon.getCartoon_image_name());
				while ((len = is.read(bs)) != -1) {
					os.write(bs, 0, len);
				}
				cartoon.setCartoon_local_url(httpPath+cartoon.getCartoon_image_name());
				
				pictureServiceImpl.saveCartoon(cartoon);
				os.close();
				is.close();
			}
		}
		
	}
	
	/**
	 * @param picture 每一张图片
	 * @param host host
	 * @param fileSavePath 保存的文件名字
	 * @param httpPath http路径path
	 */
	public void Download(Picture picture,String host,String fileSavePath,String httpPath) throws IOException{
		PictureServiceImpl pictureServiceImpl = new PictureServiceImpl();
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
		File sf = new File(fileSavePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "/" + picture.getPicture_name());
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		picture.setLocal_url(httpPath+picture.getPicture_name());
		
		if(picture.getInter_url_samll()!=null){
			url = new URL(picture.getInter_url_samll());
			String inter_url_small_name = picture.getInter_url_samll().substring(picture.getInter_url_samll().lastIndexOf("/")+1, picture.getInter_url_samll().length());
			connection = (HttpURLConnection) url.openConnection();
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
			is = connection.getInputStream();
			/*BufferedImage bufferedImage = ImageIO.read(is);
			picture.setWidth(bufferedImage.getWidth());
			picture.setHeight(bufferedImage.getHeight());*/
			bs = new byte[1024];
			sf = new File(fileSavePath);
			if (!sf.exists()) {
				sf.mkdirs();
			}
			os = new FileOutputStream(sf.getPath() + "/" + inter_url_small_name);
			while ((len = is.read(bs)) != -1) {
				os.write(bs, 0, len);
			}
			picture.setLocal_url_small(httpPath+inter_url_small_name);
		}
		
		pictureServiceImpl.savePicture(picture);
		os.close();
		is.close();
	}
}
