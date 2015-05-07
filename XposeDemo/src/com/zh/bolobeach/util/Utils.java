package com.zh.bolobeach.util;

import java.util.Random;

/**
 * 帮助类,生成各种随机的id值
 * imei是15位randomNum(15) <br/>
 * imsi是15位 randomNum(15) <br/>
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
	 * 生成Android id值
	 * <method description>
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
}
