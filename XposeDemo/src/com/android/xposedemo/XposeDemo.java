package com.android.xposedemo;

import static de.robv.android.xposed.XposedHelpers.findClass;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import android.R.integer;
import android.content.Context;
import android.os.Binder;
import android.os.Build;
import android.os.Process;
import android.util.Log;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.IXposedHookZygoteInit;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.XC_MethodHook.MethodHookParam;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

public class XposeDemo implements IXposedHookZygoteInit, IXposedHookLoadPackage {

	private static String	TAG						= "XposeDemo";
	private static boolean	mTelephonyManagerHooked	= false;
	private static boolean	mWiFiManagerHooked		= false;
	private static boolean  mLocationManagerHooked  = false;



	@Override
	public void handleLoadPackage(LoadPackageParam lpparam) throws Throwable {
		// TODO Auto-generated method stub
		String packageName = lpparam.packageName;
		Log.d(TAG, "handleLoadPackage:" + packageName);
		System.err.println(packageName);
		try {
			ChangeFinal.setFinalStatic(Build.class.getDeclaredField("MODEL"), "test");
			Log.d(TAG, "MODEL:" + Build.MODEL);
		} catch (Exception e) {
			Log.d(TAG, "ChangeFinal ex:" + e.toString());
		}
	}



	/**
	 * 初始化Zygote,在程序运行之前调用PrivacyService.register()
	 * @see de.robv.android.xposed.IXposedHookZygoteInit#initZygote(de.robv.android.xposed.IXposedHookZygoteInit.StartupParam)
	 */
	public void initZygote(StartupParam startupParam) throws Throwable {
		// Context wrapper
		try {
			// frameworks/base/services/java/com/android/server/SystemServer.java
			Class<?> cSystemServer = Class.forName("com.android.server.SystemServer");
			Method mMain = cSystemServer.getDeclaredMethod("main", String[].class);
			XposedBridge.hookMethod(mMain, new XC_MethodHook() {
				@Override
				protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
					PrivacyService.register();
				}
			});
		} catch (Throwable ex) {

		}
		hookAll(XContextImpl.getInstances(), "1");
		hookAll(XPhoneProxy.getInstances(), "1");
	}



	public static void handleGetSystemService(XHook hook, String name, Object instance) {

		if ("android.telephony.MSimTelephonyManager".equals(instance.getClass().getName())) {
			// Util.log(hook, Log.WARN, "Telephone service=" +
			// Context.TELEPHONY_SERVICE);
			Class<?> clazz = instance.getClass();
			while (clazz != null) {
				for (Method method : clazz.getDeclaredMethods())
					clazz = clazz.getSuperclass();
			}

		}
		
		// telephone manager
		if (name.equals(Context.TELEPHONY_SERVICE)) {
			// Telephony manager
			if (!mTelephonyManagerHooked) {
				hookAll(XTelephonyManager.getInstances(instance), "1");
				mTelephonyManagerHooked = true;
			}
		}else if (name.equals(Context.WIFI_SERVICE)) { // wifi信息的
			// WiFi manager
			if (!mWiFiManagerHooked) {
				hookAll(XWifiManager.getInstances(instance), "1");
				mWiFiManagerHooked = true;
			}
		}else if(name.equals(Context.LOCATION_SERVICE)){
		    // localtion manager
		    if(!mLocationManagerHooked){
		        hookAll(XLocationManager.getInstances(), "1");
		    }
		}
	}



	public static void hookAll(List<XHook> listHook, String secret) {
		for (XHook hook : listHook)
			hook(hook, secret);
	}



	public static void hookAll(List<XHook> listHook, ClassLoader classLoader, String secret) {
		for (XHook hook : listHook)
			hook(hook, classLoader, secret);
	}



	private static void hook(XHook hook, String secret) {
		hook(hook, null, secret);
	}



	private static void hook(final XHook hook, ClassLoader classLoader, String secret) {
		// Check SDK version
		Hook md = null;
		try {
			// Create hook method
			XC_MethodHook methodHook = new XC_MethodHook() {
				@Override
				protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
					try {
						if (Process.myUid() <= 0)
							return;
						XParam xparam = XParam.fromXposed(param);
						hook.before(xparam);
						if (xparam.hasResult())
							param.setResult(xparam.getResult());
						if (xparam.hasThrowable())
							param.setThrowable(xparam.getThrowable());
						param.setObjectExtra("xextra", xparam.getExtras());
					} catch (Throwable ex) {
						ex.printStackTrace();
					}
				}



				@Override
				protected void afterHookedMethod(MethodHookParam param) throws Throwable {
					if (!param.hasThrowable())
						try {
							if (Process.myUid() <= 0)
								return;
							XParam xparam = XParam.fromXposed(param);
							xparam.setExtras(param.getObjectExtra("xextra"));
							hook.after(xparam);
							if (xparam.hasResult())
								param.setResult(xparam.getResult());
							if (xparam.hasThrowable())
								param.setThrowable(xparam.getThrowable());
						} catch (Throwable ex) {
							// Util.bug(null, ex);
						}
				}
			};

			// Find class
			Class<?> hookClass = null;
			try {
				// hookClass = Class.forName(hook.getClassName());
				hookClass = findClass(hook.getClassName(), classLoader);
			} catch (Throwable ex) {
				// message = String.format("Class not found for %s", hook);
				// mListHookError.add(message);
				// Util.log(hook, hook.isOptional() ? Log.WARN : Log.ERROR,
				// message);
			}

			// Get members
			List<Member> listMember = new ArrayList<Member>();
			Class<?> clazz = hookClass;
			while (clazz != null) {
				if (hook.getMethodName() == null) {
					for (Constructor<?> constructor : clazz.getDeclaredConstructors())
						if (Modifier.isPublic(constructor.getModifiers()) ? hook.isVisible() : !hook.isVisible())
							listMember.add(constructor);
					break;
				} else {
					for (Method method : clazz.getDeclaredMethods())
						if (method.getName().equals(hook.getMethodName())
								&& !Modifier.isAbstract(method.getModifiers())
						/*
						 * && (Modifier.isPublic(method.getModifiers()) ? hook
						 * .isVisible() : !hook.isVisible())
						 */)
							listMember.add(method);
				}
				clazz = clazz.getSuperclass();
			}

			// Hook members
			for (Member member : listMember)
				try {
					if (Modifier.isAbstract(member.getModifiers()))
						;
					// Util.log(hook, Log.ERROR, String.format("Abstract: %s",
					// member));
					else
						XposedBridge.hookMethod(member, methodHook);
				} catch (NoSuchFieldError ex) {
					// Util.log(hook, Log.WARN, ex.toString());
				} catch (Throwable ex) {
					// mListHookError.add(ex.toString());
					// Util.bug(hook, ex);
				}

			// Check if members found
			if (listMember.isEmpty() && !hook.getClassName().startsWith("com.google.android.gms")) {
				// message = String.format("Method not found for %s", hook);
				if (!hook.isOptional())
					;
				// mListHookError.add(message);
				// Util.log(hook, hook.isOptional() ? Log.WARN : Log.ERROR,
				// message);
			}
		} catch (Throwable ex) {
			// mListHookError.add(ex.toString());
			// Util.bug(hook, ex);
		}
	}

}
