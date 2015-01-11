package net.xieee.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

/**
 * this is string utils ,it is contain more method with string
 * 
 * @author zhangbing
 *
 */
public class StringUtil {
	/**
	 * check string is null ,if the params is null or "" thus return true,else return false;
	 * @param params
	 * @return boolean
	 */
	public static boolean isNull(String params) {
		if (params == null || params == "") {
			return true;
		}
		return false;
	}
}
