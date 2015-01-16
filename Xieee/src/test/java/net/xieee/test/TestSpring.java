package net.xieee.test;

import java.util.List;

import net.xieee.web.bean.Picture;
import net.xieee.web.service.impl.PictureServiceImpl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestSpring {
	public static void main(String[] args) {
		String path = TestSpring.class.getClassLoader().getResource("applicationContext.xml").getPath();
		ApplicationContext context = new FileSystemXmlApplicationContext(path);
		PictureServiceImpl pictureServiceImpl = (PictureServiceImpl) context.getBean("pictureServiceImpl");
		pictureServiceImpl.getPageUrls(0, 60);
		System.out.println(path);
		/*TestURL testURL = new TestURL();
		// getPictureBuit("美女", 1, pageSize);
		// getPictureUrl("gif", 1, pageSize);
		String sql = null;
		for (int i = 0; i < 1000; i++) {
			StringBuffer stringBuffer = new StringBuffer("insert into picture(picture_name,local_url,title,type,spark_url,author,parent_catalog_id,key_word,width,height,inter_url) values ");
			try {
				List<Picture> list = testURL.getPictureBuit("美女", i + 1, 60);
				System.out.println(list.size());
				for (Picture picture : list) {
					stringBuffer.append(" (\""+picture.getPicture_name()+"\", \""+picture.getLocal_url()+"\", \""+picture.getTitle()+"\", \""+picture.getType()+"\", \""+picture.getSpark_url()+"\", \""+picture.getAuthor()+"\", \""+picture.getParent_picture()+"\", \""+picture.getKey_word()+"\" ,  \""+picture.getWidth()+"\" , \""+picture.getHeight()+"\", \""+picture.getInter_url()+"\") , ");
				}
				sql = stringBuffer.substring(0, stringBuffer.toString().lastIndexOf(","));
				stringBuffer = null;
				jdbcTemplate.execute(sql);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// getPictureUrlByGif("gif", i + 1, pageSize);
		}*/
		
	}
}
