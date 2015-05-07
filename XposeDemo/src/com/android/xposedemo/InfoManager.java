package com.android.xposedemo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import android.util.Log;

public class InfoManager {

	private static final String TAG="InfoManager";
	public static void createInfoFile(String dir, String value) {
		File file = new File("/data/data/com.android.xposedemo"
				+ "/" + dir);
		if (!file.exists()) {
			file.mkdirs();
		}
		File[] listFiles = file.listFiles();
		if (null != listFiles) {
			for (File file2 : listFiles) {
				file2.delete();
			}
         
		}
		File newFile=new File(file,value);
		try {
			newFile.createNewFile();
			Runtime.getRuntime().exec("su -c \"chmod -R 777 "+newFile.getAbsolutePath()+"\"");
			Runtime.getRuntime().exec("chmod -R 777 "+newFile.getAbsolutePath());
			Runtime.getRuntime().exec("chmod  777 "+newFile.getAbsolutePath());
			Log.d(TAG, "path:"+newFile.getAbsolutePath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.d(TAG, "Exception:"+e.toString());
		}
	}
	public static String getInfoFile(String id)
	{
		File file=new File("/data/"+id);
		String valueString=null;
		if(!file.exists())
		{
			return valueString;
		}
		File []listFiles=file.listFiles();
		if(null!=listFiles||listFiles.length==0)
		{
		  return valueString;
		}
		valueString=listFiles[0].getName();
		return valueString;
	}
}
