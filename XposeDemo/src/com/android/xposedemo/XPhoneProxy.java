package com.android.xposedemo;

import java.util.ArrayList;
import java.util.List;

import android.telephony.SmsMessage;
import android.util.Log;

public class XPhoneProxy extends XHook {
	
	private static final String TAG="XPhoneProxy";
	private Methods mMethod;

	private XPhoneProxy(Methods method, String restrictionName) {
		super(restrictionName, method.name(), null);
		mMethod = method;
	}

	public String getClassName() {
		return "com.android.internal.telephony.PhoneProxy";
	}

	// @formatter:off

	// public static ArrayList<SmsMessage> getAllMessagesFromIcc()
	// public void sendDataMessage(String destinationAddress, String scAddress,
	// short destinationPort, byte[] data, PendingIntent sentIntent,
	// PendingIntent deliveryIntent)
	// public void sendMultipartTextMessage(String destinationAddress, String
	// scAddress, ArrayList<String> parts, ArrayList<PendingIntent> sentIntents,
	// ArrayList<PendingIntent> deliveryIntents)
	// public void sendTextMessage(String destinationAddress, String scAddress,
	// String text, PendingIntent sentIntent, PendingIntent deliveryIntent)
	// frameworks/base/telephony/java/android/telephony/SmsManager.java
	// http://developer.android.com/reference/android/telephony/SmsManager.html

	// @formatter:on

	private enum Methods {
		getDeviceId
	};

	public static List<XHook> getInstances() {
		List<XHook> listHook = new ArrayList<XHook>();
		listHook.add(new XPhoneProxy(Methods.getDeviceId, "1"));
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {

	}

	@Override
	protected void after(XParam param) throws Throwable {
		if (mMethod == Methods.getDeviceId) {
			if (param.getResult() != null)
			{
				String imeiString=PrivacyManager.getValue("imei");
				if(imeiString!=null)
				{
				param.setResult(imeiString+"");
				}
				Log.d(TAG, "IMEI:"+imeiString);
			}else {
				Log.d(TAG, "XPhoneProxy null");
			}
		}
	}
}
