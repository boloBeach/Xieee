/**
 * 
 * @author zhhaogen
 * 创建于 2015-3-14 下午7:13:50
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
	 * 使用SharedPreferences做共享数据失败
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
					maps.put(k, v);
					if (TextUtils.isEmpty(v))
					{
						System.out.println("{" + lpparam.packageName + "}读取储存内容失败: " + k
								+ " 为Null");
						break;
					}
				}
				if (maps.isEmpty())
				{
					System.out.println("{" + lpparam.packageName
							+ "}读取储存内容失败:  SharedPreferences 为Null");
				} else
				{
					HookAll(maps);
				}
			} catch (Throwable e)
			{
				System.out.println("{" + lpparam.packageName + "}读取储存内容失败:"
						+ e.getMessage());
			}
		} else
		{
			System.out.println("读取缓存内容");
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
		HookMethod(TelephonyManager.class, "getSimSerialNumber",
				map.get("simserial"));
		HookMethod(WifiInfo.class, "getMacAddress", map.get("wifimac"));
		HookMethod(BluetoothAdapter.class, "getAddress", map.get("bluemac"));
		try
		{
			XposedHelpers.findField(android.os.Build.class, "SERIAL").set(null, map.get("serial"));
			XposedHelpers.findField(android.os.Build.class, "BRAND").set(null, map.get("brand"));
			 
		} catch (Throwable e)
		{
			System.out.println("修改 Build 失败!" + e.getMessage());
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
			System.out.println("修改 androidid 失败!" + e.getMessage());
		}

	}

	private void HookMethod(final Class cl, final String method,
			final String result)
	{
		try
		{
			XposedHelpers.findAndHookMethod(cl, method,
					new Object[] { new XC_MethodHook()
					{
						protected void afterHookedMethod(MethodHookParam param)
								throws Throwable
						{
							param.setResult(result);
						}

					} });
		} catch (Throwable e)
		{
			System.out.println("修改" + method + "失败!" + e.getMessage());
		}
	}
}
