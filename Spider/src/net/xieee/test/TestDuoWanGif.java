package net.xieee.test;

import java.util.List;

import net.xieee.spider.util.DuoWanSpider;
import net.xieee.web.bean.Picture;

public class TestDuoWanGif {
	public static void main(String[] args) {
		DuoWanSpider duoWanSpider = new DuoWanSpider();
		String url="http://tu.duowan.com/m/bxgif?offset=1&order=created&math=0.9889702007640153";
		String host="tu.duowan.com";
		String referer="http://tu.duowan.com/m/bxgif";
		String httpHost = null;
		try {
			List<Picture> list = duoWanSpider.getDuoWanGif(url, host, referer, httpHost);
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
