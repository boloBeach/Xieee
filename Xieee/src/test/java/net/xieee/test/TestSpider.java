package net.xieee.test;

import java.io.IOException;
import java.util.List;

import net.xieee.spider.util.Constants;
import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.InterImagesUtil;
import net.xieee.spider.util.LinkQueue;
import net.xieee.spider.util.Queue;
import net.xieee.web.bean.Picture;

import org.jsoup.nodes.Document;

public class TestSpider {
	public static void main(String[] args) {
		Document document = null;
		String host = "www.baidu.com";
		while (LinkQueue.getUnVisitedUrl().getSize() < Constants.max_url
				&& LinkQueue.getVisitedUrl().size() < Constants.max_url) {
			try {
				// 先抓取一次
				document = InterImagesUtil.getDocumentByUrl("http://www.lebazi.com/gaoxiaogif/", host);
				InterImagesUtil.insertUrlToQuen(document,"http://www.lebazi.com");
				System.err.println(LinkQueue.getUnVisitedUrl().getSize());
				String url = LinkQueue.getUnVisitedUrl().deQueue().toString();
				System.out.println(url);
				document = InterImagesUtil.getDocumentByUrl(url, host);
				InterImagesUtil.insertUrlToQuen(document,"http://www.lebazi.com");

				while (!LinkQueue.isUnvisitedUrlsEmpty()) { // 如果访问的不是空，那么我们就读取队列的东西出来
					System.out.println("size="+LinkQueue.getUnVisitedUrl().getSize());
					String urlString = LinkQueue.getUnVisitedUrl().deQueue().toString();
					System.out.println("即将抓取的url地址"+urlString);
					List<Picture> list = InterImagesUtil.getImageByUrl(
							urlString, host, "http://www.lebazi.com");
					System.out.println(list.size());
					if (list.size() != 0) {
						for (Picture picture : list) {
							System.out.println(picture.toString());
							DownloadImage.Download(picture, host);
						}
					}
				}
			} catch (IOException e) {
				// e.printStackTrace();
				System.out.println(e.toString());
			}
		}
	}
}
