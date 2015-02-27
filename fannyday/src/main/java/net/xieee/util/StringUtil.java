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
	 * check string is null ,if the params is null or "" thus return true,else
	 * return false;
	 * 
	 * @param params
	 * @return boolean
	 */
	public static boolean isNull(Object params) {
		if (params == null || params == "") {
			return true;
		}
		return false;
	}



	/**
	 * 判断一个值是否为null，如果为null，则返回空串,如果不为空，则返回string
	 * 
	 * @param param
	 * @return
	 */
	public static String getString(Object param) {
		if (isNull(param)) {
			return "";
		}
		return param.toString();
	}



	/**
	 * 把一个string的转为int类型
	 * <method description>
	 *
	 * @param params
	 * @return
	 */
	public static int stringToInt(String params) {
		if (isNull(params)) {
			return 0;
		}
		try {
			return Integer.valueOf(params);
		} catch (NumberFormatException  e) {
			return 0;
		}
		
	}
}
