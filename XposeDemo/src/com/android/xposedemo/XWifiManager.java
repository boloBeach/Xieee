package com.android.xposedemo;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import android.net.DhcpInfo;
import android.net.wifi.ScanResult;
import android.net.wifi.SupplicantState;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.os.Binder;
import android.util.Log;

public class XWifiManager extends XHook {
	private static final String TAG="XWifiManager";
	private Methods mMethod;
	private String mClassName;

	private XWifiManager(Methods method, String restrictionName, String className) {
		super(restrictionName, method.name(), null);
		mMethod = method;
		mClassName = className;
	}

	public String getClassName() {
		return mClassName;
	}

	// public List<WifiConfiguration> getConfiguredNetworks()
	// public WifiInfo getConnectionInfo()
	// public DhcpInfo getDhcpInfo()
	// public List<ScanResult> getScanResults()
	// public WifiConfiguration getWifiApConfiguration()
	// frameworks/base/wifi/java/android/net/wifi/WifiManager.java
	// frameworks/base/wifi/java/android/net/wifi/WifiInfo.java
	// frameworks/base/core/java/android/net/DhcpInfo.java
	// http://developer.android.com/reference/android/net/wifi/WifiManager.html

	private enum Methods {
		getConnectionInfo
	};

	public static List<XHook> getInstances(Object instance) {
		String className = instance.getClass().getName();
		List<XHook> listHook = new ArrayList<XHook>();
		for (Methods wifi : Methods.values())
			listHook.add(new XWifiManager(wifi,"1", className));
		listHook.add(new XWifiManager(Methods.getConnectionInfo,"1", className));
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {
		// Do nothing
	}

	@Override
	protected void after(XParam param) throws Throwable {
		 if (mMethod == Methods.getConnectionInfo) {
			if (param.getResult() != null) {
				WifiInfo wInfo = (WifiInfo) param.getResult();
					// MAC address
					try {
						Field fieldMAC = WifiInfo.class.getDeclaredField("mMacAddress");
						fieldMAC.setAccessible(true);
						//����mac��ַ
						//String macString=InfoManager.getInfoFile("mac");
						String macString=PrivacyManager.getValue("mac");
						if(macString!=null)
						{
						fieldMAC.set(wInfo,macString+"");
						}
						Log.d(TAG, "change mac:"+macString);
					} catch (Throwable ex) {
						Log.d(TAG, "XWifiManager exception:"+ex.toString());
					}	
			}
		} 
	}
}
