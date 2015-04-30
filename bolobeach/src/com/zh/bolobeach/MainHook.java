/**
 * 
 * @author zhhaogen
 * ������ 2015-3-14 ����7:13:50
 */
package com.zh.bolobeach;

import java.util.HashMap;
import android.bluetooth.BluetoothAdapter;
import android.content.ContentResolver;
import android.net.wifi.WifiInfo; 
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XSharedPreferences;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

/**
 * 
 *
 */
public class MainHook implements IXposedHookLoadPackage
{
	private static boolean init = false;
	


	/**
	 * 获取imei,imsi,phoneNumber,sim serrial,wifi mac,blue mac,android id,serial,brand等等信息
	 * 
	 * @param lpparam
	 */
	private void readData(LoadPackageParam lpparam)
	{
		if (!init)
		{
			try
			{
				XSharedPreferences pre = new XSharedPreferences(this.getClass()
						.getPackage().getName(), "prefs");
				String ks[] = { "imei", "imsi", "number", "simserial",
						"wifimac", "bluemac", "androidid", "serial", "brand" };
				HashMap<String, String> maps = new HashMap<String, String>();
				for (String k : ks)
				{
					String v = pre.getString(k, null);
					System.out.println("key==="+k+ " values="+v);
					maps.put(k, v);
					if (TextUtils.isEmpty(v))
					{
						System.out.println("{" + lpparam.packageName + "}获取: " + k+ "null");
						break;
					}
				}
				if (maps.isEmpty())
				{
					System.out.println("{" + lpparam.packageName
							+ "}是:  SharedPreferences INull");
				} else
				{
					HookAll(maps);
				}
			} catch (Throwable e)
			{
				System.err.println("{" + lpparam.packageName + "}出错了。:" + e.getMessage());
			}
		} else
		{
			System.out.println("init 已经 为true");
		}
	}

	public void handleLoadPackage(LoadPackageParam lpparam) throws Throwable
	{
		if ("".equals(lpparam.packageName))// System
		{
			return;
		}
		readData(lpparam);

	}

	private void HookAll(final HashMap<String, String> map)
	{
		HookMethod(TelephonyManager.class, "getDeviceId", map.get("imei"));
		HookMethod(TelephonyManager.class, "getSubscriberId", map.get("imsi"));
		HookMethod(TelephonyManager.class, "getLine1Number", map.get("number"));
		//HookMethod(TelephonyManager.class, "getSimSerialNumber", map.get("simserial"));
		HookMethod(WifiInfo.class, "getMacAddress", map.get("wifimac"));
		//HookMethod(BluetoothAdapter.class, "getAddress", map.get("bluemac"));
		try
		{
			XposedHelpers.findField(android.os.Build.class, "SERIAL").set(null, map.get("serial"));
			XposedHelpers.findField(android.os.Build.class, "BRAND").set(null, map.get("brand"));
			 
		} catch (Throwable e)
		{
			System.err.println("serial and brand error" + e.getMessage());
		}
		try
		{
			XposedHelpers.findAndHookMethod(
					android.provider.Settings.Secure.class, "getString",
					new Object[] { ContentResolver.class, String.class,
							new XC_MethodHook()
							{
								protected void afterHookedMethod(
										MethodHookParam param) throws Throwable
								{
									if (param.args[1] == "android_id")
									{
										param.setResult(map.get("androidid"));
									}

								}

							} });
		} catch (Throwable e)
		{
			System.err.println("HookAll error" + e.getMessage());
		}

	}

	private void HookMethod(final Class cl, final String method,
			final String result)
	{
		try
		{
			XposedHelpers.findAndHookMethod(cl, method, new Object[] { new XC_MethodHook()
					{
						protected void afterHookedMethod(MethodHookParam param)
								throws Throwable
						{
							param.setResult(result);
						}

					} });
		} catch (Throwable e)
		{
			System.err.println("调用" + method + "出错" + e.getMessage());
		}
	}
}
