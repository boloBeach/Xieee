package com.android.xposedemo;

import java.util.ArrayList;
import java.util.List;

import com.zh.bolobeach.util.TelephonyManagerMethods;

public class XTelephonyManager extends XHook {
	private TelephonyManagerMethods mMethod;
	private String mClassName;
	//private static final Map<PhoneStateListener, XPhoneStateListener> mListener = new WeakHashMap<PhoneStateListener, XPhoneStateListener>();

	private XTelephonyManager(TelephonyManagerMethods method, String restrictionName, String className) {
		super(restrictionName, method.name(), null);
		mMethod = method;
		mClassName = className;
	}

	private XTelephonyManager(TelephonyManagerMethods method, String restrictionName, String className, int sdk) {
		super(restrictionName, method.name(), null, sdk);
		mMethod = method;
		mClassName = className;
	}

	public String getClassName() {
		return mClassName;
	}

	// public void disableLocationUpdates()
	// public void enableLocationUpdates()
	// public List<CellInfo> getAllCellInfo()
	// public CellLocation getCellLocation()
	// public String getDeviceId()
	// public String getGroupIdLevel1()
	// public String getIsimDomain()
	// public String getIsimImpi()
	// public String[] getIsimImpu()
	// public String getLine1AlphaTag()
	// public String getLine1Number()
	// public String getMsisdn()
	// public List<NeighboringCellInfo> getNeighboringCellInfo()
	// public String getNetworkCountryIso()
	// public String getNetworkOperator()
	// public String getNetworkOperatorName()
	// public int getNetworkType()
	// public int getPhoneType()
	// public String getSimCountryIso()
	// public String getSimOperator()
	// public String getSimOperatorName()
	// public static int getPhoneType(int networkMode)
	// public String getSimSerialNumber()
	// public String getSubscriberId()
	// public String getVoiceMailAlphaTag()
	// public String getVoiceMailNumber()
	// public void listen(PhoneStateListener listener, int events)
	// frameworks/base/telephony/java/android/telephony/TelephonyManager.java
	// http://developer.android.com/reference/android/telephony/TelephonyManager.html
	// @formatter:on

	public static List<XHook> getInstances(Object instance) {
		String className = instance.getClass().getName();

		List<XHook> listHook = new ArrayList<XHook>();

		

		listHook.add(new XTelephonyManager(TelephonyManagerMethods.getDeviceId,"1", className));
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {
		
	}

	@Override
	// 设置imei
	protected void after(XParam param) throws Throwable {
		
		if(mMethod==TelephonyManagerMethods.getDeviceId)
		{
			if (param.getResult() != null)
			{
				
				String imeiString=PrivacyManager.getValue("imei");
				if(imeiString!=null)
				{
					param.setResult(imeiString+"");
				}
				
			}
		}
	}
}
