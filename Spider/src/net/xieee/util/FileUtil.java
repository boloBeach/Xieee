package net.xieee.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class FileUtil {
	/**
	 * 
	 * @author:张兵
	 * @Date:2014年6月27日:上午11:34:01
	 * @Description: 获取一天的时间
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception
	 *             ：异常
	 */
	public static String loadFileName() {
		Calendar cal = Calendar.getInstance();
		cal = getBeforeDay(cal);
		Date date = cal.getTime();
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		return df.format(date);
	}

	/**
	 * 
	 * @author:张兵
	 * @Date:2014年6月27日:下午2:56:08
	 * @Description: 时间转换函数
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception
	 *             ：异常
	 */
	public static String getTableNameTime(String startTime)
			throws ParseException {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = fmt.parse(startTime);
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		return df.format(date);
	}
	
	/**
	 * 
	 * @author:张兵
	 * @Date:2014年6月30日:上午9:17:48
	 * @Description: 【把字符串转为date类型】
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception
	 *             ：异常
	 */
	public static Date getDate(String startTime) throws ParseException {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return fmt.parse(startTime);
	}

	/**
	 * 
	 * @author:张兵
	 * @Date:2014年6月30日:上午9:18:04
	 * @Description: 通过时间，得到时间的字符串
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception
	 *             ：异常
	 */
	public static String getStringByDate(Date date) throws ParseException {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return fmt.format(date); // 获得符合格式的字符串，当前日期时间
	}

	/**
	 * 
	 * @author:张兵
	 * @Date:2014年6月27日:上午11:34:15
	 * @Description: 获取前一天
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception
	 *             ：异常
	 */
	public static Calendar getBeforeDay(Calendar cl) {
		int day = cl.get(Calendar.DATE);
		cl.set(Calendar.DATE, day + 1);
		return cl;
	}
}