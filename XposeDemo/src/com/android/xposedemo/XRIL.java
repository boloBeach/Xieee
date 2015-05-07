package com.android.xposedemo;

import java.util.ArrayList;
import java.util.List;

import android.telephony.SmsMessage;
import android.util.Log;

public class XRIL extends XHook {
	
	private static final String TAG="XRIL";
	private Methods mMethod;

	private XRIL(Methods method, String restrictionName) {
		super(restrictionName, method.name(), null);
		mMethod = method;
	}

	public String getClassName() {
		return "com.android.internal.telephony.RIL";
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
		responseString
	};

	public static List<XHook> getInstances() {
		List<XHook> listHook = new ArrayList<XHook>();
		listHook.add(new XRIL(Methods.responseString, "1"));
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {

	}

	@Override
	protected void after(XParam param) throws Throwable {
		if (mMethod == Methods.responseString) {
			if (param.getResult() != null)
			{
				String oldImeiString=(String)param.getResult();
				String imeiString=PrivacyManager.getValue("imei");
				if(imeiString!=null&&oldImeiString.length()==15&&!oldImeiString.startsWith("460"))
				{
				param.setResult(imeiString+"");
				}
				Log.d(TAG, "OLDiMEIString:"+oldImeiString);
				Log.d(TAG, "mod IMEI:"+imeiString);
			}else {
				Log.d(TAG, "X null");
			}
		}
	}
}
