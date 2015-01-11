package net.xieee.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestSpring {
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext(
				"C:\\Users\\zhangbing\\git\\Xieee\\Xieee\\src\\main\\webapp\\WEB-INF\\applicationContext.xml");
		JdbcTemplate jdbcTemplate = (JdbcTemplate) context
				.getBean("jdbcTemplate");
		System.out.println(jdbcTemplate);
	}
}
