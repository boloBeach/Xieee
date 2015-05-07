package com.android.xposedemo;

import java.util.ArrayList;
import java.util.List;

import android.util.Log;

public class XContextImpl extends XHook {
	private Methods mMethod;

	private XContextImpl(Methods method, String restrictionName, int sdk) {
		super(restrictionName, method.name(), null, sdk);
		mMethod = method;
	}

	public String getClassName() {
		return "android.app.ContextImpl";
	}

	// public PackageManager getPackageManager()
	// public Object getSystemService(String name)
	// frameworks/base/core/java/android/app/ContextImpl.java

	private enum Methods {
		getSystemService
	};

	public static List<XHook> getInstances() {
		List<XHook> listHook = new ArrayList<XHook>();
		//listHook.add(new XContextImpl(Methods.getPackageManager, null, 1));
		listHook.add(new XContextImpl(Methods.getSystemService, null, 1));
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {
		// Do nothing
	}

	@Override
	protected void after(XParam param) throws Throwable {
		// Do nothing
		if (mMethod == Methods.getSystemService) {
			if (param.args.length > 0 && param.args[0] != null) {
				String name = (String) param.args[0];
				Object instance = param.getResult();
				if (name != null && instance != null)
					XposeDemo.handleGetSystemService(this, name, instance);
			}

		} 
	}
}
