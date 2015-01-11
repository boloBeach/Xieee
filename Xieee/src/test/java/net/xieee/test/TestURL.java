package net.xieee.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class TestURL {
	public static void main(String[] args) throws Exception {
		
		int pageSize = 60;
		//getPictureBuit("美女", 1, pageSize);
		// getPictureUrl("美女", 1, pageSize);
		for (int i = 0; i < 1000; i++) {
			getPictureBuit("美女", i+1, pageSize);
			//getPictureUrlByGif("gif", i + 1, pageSize);
		}
	}

	public static void getPictureUrlByGif(String keywords, int pageIndex,
			int pageSize) throws Exception {
		String url = "http://image.baidu.com/i?tn=resultjson_com&ipn=rj&ct=201326592&cl=2&lm=-1&st=-1&fm=result&fr=ala_avaloc0&sf=1&fmq=1420273981891_R&pv=&ic=0&nc=1&z=&se=1&showtab=0&fb=0&width=&height=&face=0&istype=2&ie=gbk&word="
				+ keywords
				+ "&oe=utf-8&rn="
				+ pageSize
				+ "&pn="
				+ pageIndex
				* pageSize + "&102960952029.0935&124461522341.89539";
		// String url =
		// "http://image.baidu.com/i?tn=resultjsonavatarnew&ie=utf-8&word="+keywords+"&cg=girl&pn="+pageIndex*pageSize+"&rn="+pageSize+"&z=9&itg=1&width=0&height=0&lm=-1&ic=0&s=0";
		// String urlString =
		// "http://image.baidu.com/i?tn=resultjsonavatarnew&ie=utf-8&word="+keywords+"&cg=girl&pn="+pageIndex*pageSize+"&rn="+pageSize+"&z=9&itg=1&width=0&height=0&lm=-1&ic=0&s=0";
		// String url =
		// "http://image.baidu.com/i?tn=resultjsonavatarnew&ie=utf-8&word=美女&cg=girl&pn=120&rn=60&z=9&itg=1&width=0&height=0&lm=-1&ic=0&s=0";
		System.err.println(url);
		Connection connection = Jsoup.connect(url);
		connection.referrer("http://image.baidu.com/");
		connection.userAgent("Mozilla").timeout(600000);
		Document document = connection.get();// get html document
		String htmlCode = document.text();
		System.out.println(htmlCode);
		JSONObject jsonObject = JSONObject.fromObject(htmlCode);
		JSONArray jsonArray = jsonObject.getJSONArray("data");
		System.out.println(jsonArray);
		for (int i = 0; i < jsonArray.size(); i++) {
			Object object = jsonArray.get(i);
			JSONObject jsonObj = JSONObject.fromObject(object);
			if (jsonObj.get("largeTnImageUrl") != null)
				download(jsonObj.get("largeTnImageUrl").toString(),
						new Date().getTime() + ".gif", "D:\\images\\gif");
		}
	}

	public static void getPictureBuit(String keywords, int pageIndex,
			int pageSize) throws Exception {
		//String url = "http://image.baidu.com/i?tn=resultjsonavatarnew&ie=utf-8&word=%E7%BE%8E%E5%A5%B3&cg=girl&pn=60&rn=60&z=3&itg=1&fr=&width=0&height=0&lm=-1&ic=0&s=0";
		String url = "http://image.baidu.com/i?tn=resultjsonavatarnew&ie=utf-8&word=%E7%BE%8E%E5%A5%B3&cg=girl&pn="+pageIndex*pageSize+"&rn=60&z=3&itg=1&fr=&width=0&height=0&lm=-1&ic=0&s=0";
		System.out.println(url);
		Connection connection = Jsoup.connect(url);
		connection.referrer("http://image.baidu.com/");
		connection.userAgent("Mozilla").timeout(600000);
		Document document = connection.get();// get html document
		JSONObject jsonObject = JSONObject.fromObject(document.text());
		JSONArray jsonArray = jsonObject.getJSONArray("imgs");
		System.out.println(jsonArray);
		for (int i = 0; i < jsonArray.size(); i++) {
			Object object = jsonArray.get(i);
			JSONObject jsonObj = JSONObject.fromObject(object);
			if (jsonObj.get("objURL") != null)
				download(jsonObj.get("objURL").toString(),
						new Date().getTime() + ".jpg", "D:\\images\\but");
		}
	}

	public static void download(String urlString, String filename,
			String savePath) throws Exception {
		/*
		 * String urlString1 =
		 * "http://img4.imgtn.bdimg.com/it/u=3709788938,3567504276&fm=21&gp=0.jpg"
		 * ; String fileName = "1.gif"; String savePath1 = "D:\\images";
		 */
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Accept", "image/webp,*/*;q=0.8");
		conn.setRequestProperty("Accept-Encoding", "gzip, deflate, sdch");
		conn.setRequestProperty("Accept-Language",
				"zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4");
		conn.setRequestProperty("Cache-Control", "max-age=0");
		conn.setRequestProperty("Connection", "keep-alive");
		conn.setRequestProperty("Host", "img0.bdstatic.com");
		/*
		 * conn.setRequestProperty("If-Modified-Since",
		 * "Wed, 12 Nov 2014 03:06:08 GMT");
		 * conn.setRequestProperty("If-None-Match", "1627972333");
		 */
		conn.setRequestProperty("Referer", "http://image.baidu.com");
		conn.setRequestProperty(" User-Agent","Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2194.2 Safari/537.36");
		// System.out.println(conn.getRequestProperty("connection"));
		// 输入流
		InputStream is = conn.getInputStream();

		// 1K的数据缓冲
		byte[] bs = new byte[1024];
		// 读取到的数据长度
		int len;
		// 输出的文件流
		File sf = new File(savePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "\\" + filename);
		// 开始读取
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		// 完毕，关闭所有链接
		os.close();
		is.close();
	}
}
