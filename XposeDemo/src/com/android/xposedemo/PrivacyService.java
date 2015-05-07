package com.android.xposedemo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDoneException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import android.os.Binder;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Process;
import android.os.RemoteException;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy;
import android.text.TextUtils;
import android.util.Log;
import android.util.Patterns;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

public class PrivacyService {
	private static final String TAG = "PrivacyService";

	private static final String INFO_DIR = "/data/system/xposedemo";
	private static boolean mRegistered = false;

	private static IPrivacyService mClient = null;
	private static final String cServiceName = "xposedemo";

	// TODO: define column names
	// sqlite3 /data/system/xprivacy/xprivacy.db

	public static void register() {
		// Store secret and errors
		try {
			// Register privacy service
			// @formatter:off
			// public static void addService(String name, IBinder service)
			// public static void addService(String name, IBinder service,
			// boolean allowIsolated)
			// @formatter:on
			File file = new File(INFO_DIR);
			if (!file.exists()) {
				file.mkdirs();
			}
			Class<?> cServiceManager = Class
					.forName("android.os.ServiceManager");
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
				Method mAddService = cServiceManager.getDeclaredMethod(
						"addService", String.class, IBinder.class,
						boolean.class);
				mAddService.invoke(null, cServiceName, mPrivacyService, true);
			} else {
				Method mAddService = cServiceManager.getDeclaredMethod(
						"addService", String.class, IBinder.class);
				mAddService.invoke(null, cServiceName, mPrivacyService);
			}

			long time = System.currentTimeMillis();
			createInfoFileForTime("mytime", time + "");
			// This will and should open the database
			mRegistered = true;
		} catch (Throwable ex) {

		}
	}

	public static boolean isRegistered() {
		return mRegistered;
	}

	public static IPrivacyService getClient() {
		// Runs client side
		if (mClient == null)
			try {
				// public static IBinder getService(String name)
				Class<?> cServiceManager = Class
						.forName("android.os.ServiceManager");
				Method mGetService = cServiceManager.getDeclaredMethod(
						"getService", String.class);
				mClient = IPrivacyService.Stub
						.asInterface((IBinder) mGetService.invoke(null,
								cServiceName));
			} catch (Throwable ex) {
				// Util.bug(null, ex);
			}

		// Disable disk/network strict mode
		// TODO: hook setThreadPolicy
		try {
			ThreadPolicy oldPolicy = StrictMode.getThreadPolicy();
			ThreadPolicy newpolicy = new ThreadPolicy.Builder(oldPolicy)
					.permitDiskReads().permitDiskWrites().permitNetwork()
					.build();
			StrictMode.setThreadPolicy(newpolicy);
		} catch (Throwable ex) {
			// Util.bug(null, ex);
		}

		return mClient;
	}

	public static String getSetting(String id) throws RemoteException {
		if (isRegistered())
			return mPrivacyService.getValue(id);
		else {
			IPrivacyService client = getClient();
			if (client == null) {

				return id;
			} else
				return client.getValue(id);
		}
	}

	public static void createInfoFileForTime(String dir, String value) {
		File file = new File(INFO_DIR + File.separator + dir);
		if (!file.exists()) {
			file.mkdirs();
		}
		File[] listFiles = file.listFiles();
		if (null != listFiles && listFiles.length > 0) {
			return;
			// for (File file2 : listFiles) {
			// file2.delete();
			// }

		}
		File newFile = new File(file, value);
		try {
			newFile.createNewFile();
			Log.d(TAG, "path:" + newFile.getAbsolutePath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.d(TAG, "Exception:" + e.toString());
		}
	}

	public static void createInfoFile(String dir, String value) {
		File file = new File(INFO_DIR + File.separator + dir);
		if (!file.exists()) {
			file.mkdirs();
		}
		File[] listFiles = file.listFiles();
		if (null != listFiles) {
			for (File file2 : listFiles) {
				file2.delete();
			}

		}
		File newFile = new File(file, value);
		try {
			newFile.createNewFile();
			Log.d(TAG, "path:" + newFile.getAbsolutePath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.d(TAG, "Exception:" + e.toString());
		}
	}

	public static String getInfoFile(String id) {
		File file = new File(INFO_DIR + File.separator + id);
		String valueString = null;
		if (!file.exists()) {
			return valueString;
		}
		File[] listFiles = file.listFiles();
		if (null == listFiles || listFiles.length == 0) {
			return valueString;
		}
		valueString = listFiles[0].getName();
		return valueString;
	}

	private static final IPrivacyService.Stub mPrivacyService = new IPrivacyService.Stub() {

		@Override
		public String getValue(String id) throws RemoteException {
			// TODO Auto-generated method stub
			//long count = getCount();
			//Log.d(TAG, "usetime:" + count);
			String macString = getInfoFile(id);
			return macString;
		}

		@Override
		public void setValue(String id, String value) throws RemoteException {
			//long count = getCount();
			//Log.d(TAG, "usetime:" + count);
				createInfoFile(id, value);
			// createInfoFile(id, value);
		}

		@Override
		public long getCount() throws RemoteException {
			// TODO Auto-generated method stub
			long curTime = System.currentTimeMillis();
			long startTime = curTime;
			try {
				createInfoFileForTime("mytime", curTime + "");
				startTime = Long.parseLong(getInfoFile("mytime"));
			} catch (Exception e) {
				// TODO: handle exception
				startTime = curTime;
			}
			Log.d(TAG, "useTime:" + (curTime - startTime) / 1000 + " s");
			return (curTime - startTime) / 1000;
		}

	};

	public static void setValue(String id, String value) throws RemoteException {
		// TODO Auto-generated method stub
		if (isRegistered())
			mPrivacyService.setValue(id, value);
		else {
			IPrivacyService client = getClient();
			if (client == null) {

				Log.d(TAG, "client is NULL");
			} else
				client.setValue(id, value);
		}
	}

	public static long getCount() throws RemoteException {

		// TODO Auto-generated method stub
		if (isRegistered())
			return mPrivacyService.getCount();
		else {
			IPrivacyService client = getClient();
			if (client == null) {

				Log.d(TAG, "client is NULL");
				return -1;
			} else {
				return client.getCount();
			}
		}

	}
}
