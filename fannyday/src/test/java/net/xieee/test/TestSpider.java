package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.DownloadImage;
import net.xieee.spider.util.InterImagesUtil;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.PageUrl;
import net.xieee.web.bean.Picture;

import org.jsoup.nodes.Document;

public class TestSpider {
	public static void main(String[] args) {
		
		Document document = null;
		String host = "www.lebazi.com";
		//DownloadImage downloadImage = new DownloadImage();
		InterImagesUtil imagesUtil = new InterImagesUtil();
		int i = 0;
		int startId = 1117;
		int pageSize = 10;
		while (true) {
			try {
				if(i==0){
				// 先抓取一次
					System.out.println("来了。");
					document = imagesUtil.getDocumentByUrl("http://www.lebazi.com/", host);
					if(document!=null){
						System.err.println("document is not null");
						imagesUtil.insertUrlToQuen(document,"http://www.lebazi.com");
						++i;
					}
				}
				
				List<PageUrl> list = imagesUtil.getList(startId, pageSize);
				DownloadImage downloadImage = new DownloadImage();
				for (PageUrl pageUrl : list) {
					imagesUtil.update(pageUrl.getId());
					startId = pageUrl.getId();
					document = imagesUtil.getDocumentByUrl(pageUrl.getUrl(), host);
					if(document!=null){
						System.err.println("document is not null");
						imagesUtil.insertUrlToQuen(document,"http://www.lebazi.com");
						List<Picture> pictures = imagesUtil.getImagesByDocument(document,pageUrl.getUrl(), host, "http://www.lebazi.com");
						if(!StringUtil.isNull(pictures)){
							for (Picture picture : pictures) {
								System.out.println(picture.toString());
								downloadImage.Download(picture, host);
							}
						}
					}
				}
				Thread.sleep(300);
				
				/*while (!LinkQueue.isUnvisitedUrlsEmpty() && LinkQueue.getVisitedUrl().size()<Constants.max_url) { // 如果访问的不是空，那么我们就读取队列的东西出来
					String urlString = LinkQueue.getUnVisitedUrl().deQueue().toString();
					
					if(!urlString.contains("http")){
						urlString="http://www.lebazi.com/"+urlString;
					}
					System.out.println("即将抓取的url地址"+urlString);
					document = InterImagesUtil.getDocumentByUrl(urlString, host);
					InterImagesUtil.insertUrlToQuen(document,"http://www.lebazi.com");
					List<Picture> list = InterImagesUtil.getImageByUrl(urlString, host, "http://www.lebazi.com");
					if (list.size() != 0) {
						for (Picture picture : list) {
							downloadImage.Download(picture, host);
						}
					}
				}*/
			} catch (Exception e) {
				 e.printStackTrace();
				//System.out.println(e.toString());
			}
		}
	}
}
