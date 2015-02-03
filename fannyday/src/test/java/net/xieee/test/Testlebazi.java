package net.xieee.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Testlebazi {
	private static HashMap<String, Boolean> hashMap = new HashMap<String, Boolean>();
	private static HashMap<String, Boolean> fileNameMap = new HashMap<String, Boolean>();
	private static int tmp = 0;

	public static void main(String[] args) {
		getHttpURL("http://www.lebazi.com");
	}

	public static void getHttpURL(String indexURL) {
		Connection connection = Jsoup.connect(indexURL);
		connection.header("Host", "img.51ads.com");
		connection.header("Accept", "image/webp,*/*;q=0.8");
		connection.header("Accept-Encoding", "gzip,deflate,sdch");
		connection.header("Accept-Language", "en-US,en;q=0.8");
		connection.userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		connection.timeout(60000);
		Document document;
		String href = null;
		try {
			document = connection.get();
			Elements httpURLElements = document.getElementsByTag("a");
			for (Element element : httpURLElements) {
				href = element.attr("href");
				if (!isNull(href)) {
					if (href.startsWith("/") && !href.equals("#")) {
						href = "http://www.lebazi.com" + href;
						if (!hashMap.containsKey(href)) {
							hashMap.put(href, true);
							getHttpURL(href);
						}
					}
					
				}
			}
		} catch (Exception e) {
		}
	}

	public static void getImgByHash(){
		System.out.println("this is null"+hashMap.size());
		while (!hashMap.isEmpty()) {
			Iterator iter = hashMap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				String key = (String)entry.getKey();
				Boolean value = (Boolean) entry.getValue();
				if(value==true){
					getImg(key);
				}
			}
		}
	}

	/**
	 * get img src with httpUrl
	 */
	public static void getImg(String httpUrl) {
		Connection connection = Jsoup.connect(httpUrl);
		hashMap.put(httpUrl, false);
		connection.header("Host", "img.51ads.com");
		connection.header("Accept", "image/webp,*/*;q=0.8");
		connection.header("Accept-Encoding", "gzip,deflate,sdch");
		connection.header("Accept-Language", "en-US,en;q=0.8");
		connection
				.userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		connection.timeout(60000);
		Document document = null;
		try {
			document = connection.get();
			Elements imgElements = document.getElementsByTag("img");
			// System.err.println(elements);
			String filename = "";
			String savePath = "D:\\images\\gif";
			for (Element element : imgElements) {
				// get src with img
				String name = element.attr("name");
				if (!isNull(name)) {
					if (name.startsWith("/")) {
						name = "http://www.lebazi.com" + name;
					}
					filename = name.substring(name.lastIndexOf("/"),
							name.length());
					if (filename.contains(".gif") && !hashMap.containsKey(filename)) {
						download(name, filename, savePath);
					}

				}
				String src = element.attr("src");
				if (!isNull(src)) {
					if (src.startsWith("/")) {
						src = "http://www.lebazi.com" + src;
					}
					filename = src
							.substring(src.lastIndexOf("/"), src.length());
					if (filename.contains(".gif") && !hashMap.containsKey(filename)) {
						download(src, filename, savePath);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void download(String fileUrl, String filename, String savePath)
			throws Exception {
		System.out.println(fileUrl);
		fileNameMap.put(fileUrl, true);
		URL url = new URL(fileUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Host", "img.51ads.com");
		connection.setRequestProperty("Accept", "image/webp,*/*;q=0.8");
		connection.setRequestProperty("Accept-Encoding", "gzip,deflate,sdch");
		connection.setRequestProperty("Accept-Language", "en-US,en;q=0.8");
		connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36");
		InputStream is = connection.getInputStream();

		// 1K����ݻ���
		byte[] bs = new byte[1024];
		// ��ȡ������ݳ���
		int len;
		// ������ļ���
		File sf = new File(savePath);
		if (!sf.exists()) {
			sf.mkdirs();
		}
		OutputStream os = new FileOutputStream(sf.getPath() + "\\" + filename);
		// ��ʼ��ȡ
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		// ��ϣ��ر���������
		os.close();
		is.close();
	}

	public static boolean isNull(String string) {
		if (null == string || string.equals("")) {
			return true;
		}
		return false;
	}

}
