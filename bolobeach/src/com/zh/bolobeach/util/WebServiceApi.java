package com.zh.bolobeach.util;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpPost;

/**
 * 调用web service api <class description>
 *
 * @author: royzhang
 * @version: 1.0, May 6, 2015
 */
public class WebServiceApi {

	/**
	 * 调用webservice，用来判断是否有权限使用此软件 <method description>
	 *
	 * @param url
	 *            访问url地址
	 * @param params
	 *            name,软件的name值
	 * @return
	 */
	public static String invokePost(String url, String params) {
		if (url != null) {
			try {
				URL httpUrl = new URL(url);
				HttpURLConnection conn = (HttpURLConnection)httpUrl.openConnection();
				conn.setRequestMethod("POST");  
		        conn.setConnectTimeout(5 * 1000);  
		        conn.setDoOutput(true);  
		        conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");  
		        conn.setRequestProperty("Content-Length", String.valueOf(params.getBytes().length));  
		        OutputStream outStream = conn.getOutputStream();  
		        outStream.write(params.getBytes());  
		        outStream.flush();  
		        outStream.close();
		        if (conn.getResponseCode() == 200)  
		        {  
		            // 解析返回信息  
		            return parseResponseXML(conn.getInputStream());  
		        }  
		        return "Error";  
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}
}
