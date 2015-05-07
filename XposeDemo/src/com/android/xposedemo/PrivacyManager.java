package com.android.xposedemo;

import java.lang.reflect.Field;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.location.Location;
import android.os.Build;
import android.os.Process;
import android.os.RemoteException;
import android.util.Log;
import android.util.SparseArray;

public class PrivacyManager {
	public static String getValue(String id) throws RemoteException
	{
	  return  PrivacyService.getSetting(id);
	}
	public static void  setValue(String id,String value) throws RemoteException
	{
		PrivacyService.setValue(id,value);
	}
	public static long getCount() throws RemoteException
	{
	  return PrivacyService.getCount();
	}
}
