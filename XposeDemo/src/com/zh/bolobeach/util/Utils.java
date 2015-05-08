package com.zh.bolobeach.util;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import android.Manifest.permission;
import android.widget.Switch;

/**
 * 帮助类,生成各种随机的id值 <br/>
 * imei是15位randomNum(15) <br/>
 * imsi是15位 getRandomImsi <br/>
 * simserial是20位randomNum(20)<br/>
 * wifimac是17位 randomWifiMac<br/>
 * bluemac是17位 randomBlueMac<br/>
 * androidid是16位 randomAndroidId(16)<br/>
 * serial是19位+a randomNum(19)+a<br/>
 *
 * @author: royzhang
 * @version: 1.0, Apr 30, 2015
 */
public class Utils {

	/**
	 * 判断是否为空 <method description>
	 *
	 * @param params
	 * @return
	 */
	public static boolean isNull(Object params) {
		if (params == null) {
			return true;
		}
		return false;
	}



	/**
	 * 生成imsi，imsi有三部分组成，是15位数字,MCC+MNC+MSIN MCC 移动国家码 中国是460 一共三位 MNC
	 * 是移动网络号码，目前中国一共有两位
	 * ,中国移动系统使用00、02、07，中国联通GSM系统使用01、06，中国电信CDMA系统使用03、05、电信4G使用11，中国铁通系统使用20
	 * <method description>
	 *
	 * @param index 如果是1表示是移动，如果是2表示联通，如果是3表示电信
	 * @return
	 */
	public static String getRandomImsi(int index) {
		StringBuilder stringBuilder = new StringBuilder("460");
		String[] unicomMnc = { "01", "06"};
		String[] mobileMnc = { "00", "02","07"};
		String[] dyMnc = {"03","05","11"};
		
		Random random = new Random();
		int indexMnc = random.nextInt(2);
		int indexMobileMnc = random.nextInt(1);
		if(index==1){
			stringBuilder.append(mobileMnc[indexMnc]);
		}
		if(index==2){
			stringBuilder.append(unicomMnc[indexMobileMnc]);
		}
		if(index==3){
			stringBuilder.append(dyMnc[indexMnc]);
		}
		stringBuilder.append(randomNum(10));
		return stringBuilder.toString();

	}



	/**
	 * 判断是否空白 ,如果有值返回false <method description>
	 *
	 * @param params
	 * @return
	 */
	public static boolean isBlank(String params) {
		if (!isNull(params)) {
			return params.length() == 0 ? true : false;
		}
		return true;
	}



	/**
	 * 传入一个参数，生成对应的随机字数 <method description>
	 *
	 * @param numSize
	 * @return
	 */
	public static String randomNum(int numSize) {
		StringBuilder stringBuilder = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < numSize; i++) {
			stringBuilder.append(random.nextInt(10));
		}
		return stringBuilder.toString();
	}



	/**
	 * 生成电话号码 <method description>
	 *
	 * @return
	 */
	public static String randomPhone() {
		String[] phoneHead = { "+8613", "+8615", "+8617", "+8618", "+8616" };
		Random random = new Random();
		StringBuffer stringBuffer = new StringBuffer(phoneHead[random.nextInt(phoneHead.length)]);
		for (int i = 0; i < 9; i++) {
			stringBuffer.append(random.nextInt(10));
		}
		return stringBuffer.toString();
	}



	/**
	 * 生成小写字母的mac地址 <method description>
	 *
	 * @return
	 */
	public static String randomWifiMac() {
		String chars = "abcdef0123456789";
		StringBuffer stringBuffer = new StringBuffer();
		Random random = new Random();
		int leng = chars.length();
		for (int i = 0; i < 17; i++) {
			if (i % 3 == 2) {
				stringBuffer.append(":");
			} else {
				stringBuffer.append(chars.charAt(random.nextInt(leng)));
			}

		}
		return stringBuffer.toString();
	}



	/**
	 * 生成大写字母的mac地址 <method description>
	 *
	 * @return
	 */
	public static String randomBlueMac() {
		String chars = "ABCDEF0123456789";
		StringBuffer stringBuffer = new StringBuffer();
		Random random = new Random();
		int leng = chars.length();
		for (int i = 0; i < 17; i++) {
			if (i % 3 == 2) {
				stringBuffer.append(":");
			} else {
				stringBuffer.append(chars.charAt(random.nextInt(leng)));
			}

		}
		return stringBuffer.toString();
	}



	/**
	 * 生成Android id值 <method description>
	 *
	 * @param numSize
	 * @return
	 */
	public static String randomAndroidId(int numSize) {
		String chars = "abcde0123456789";
		String res = "";
		Random rnd = new Random();
		int leng = chars.length();
		for (int i = 0; i < numSize; i++) {
			res = res + chars.charAt(rnd.nextInt(leng));

		}
		return res;
	}
	
	public static int checkPhone(String telephone){
		int result = 0;
		String[] unicomMnc = {"130","131","132","155","156","145","185","186","176","185"};
		String[] mobileMnc = {"1340","1341","1342","1343","1344","1345","1346","1347","1348","135","136","137","138","139","150","151","152","158","159","182","183","184","157","187","188","147","178" };
		String[] dyMnc = {"133","153","180","181","189","177"};
		List unicomList = Arrays.asList(unicomMnc);
		List mobileList = Arrays.asList(mobileMnc);
		List dyList = Arrays.asList(dyMnc);
		
		if(telephone!=null){
			String temp = telephone.substring(3, 6);
			if(unicomList.contains(temp)){
				return 2;
			}
			if(mobileList.contains(temp)){
				return 1;
			}
			
			if(dyList.contains(temp)){
				return 3;
			}
		}
		return result;
	}
	
	public static String checkDNOName(String telephone){
		if(telephone != null){
			int temp = checkPhone(telephone);
			switch (temp) {
			case 1:
				return "中国移动";
			case 2:
				return "中国联通";
			default:
				return "中国电信";
			}
		}
		return null;
	}
}
