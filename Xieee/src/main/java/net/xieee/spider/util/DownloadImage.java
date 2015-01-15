package net.xieee.spider.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import net.xieee.web.bean.Picture;

public class DownloadImage {
	public static void Download(Picture picture,String host) throws IOException{
		URL url = new URL(picture.getInter_url());
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Host", host);
		connection.setRequestProperty("Accept", "image/webp,*/*;q=0.8");
		connection.setRequestProperty("Accept-Encoding", "gzip,deflate,sdch");
		connection.setRequestProperty("Accept-Language", "en-US,en;q=0.8");
		connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		InputStream is = connection.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		File sf = new File(Constants.savePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "\\" + picture.getPicture_name());
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
	}
}
