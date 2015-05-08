package com.zh.bolobeach.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zh.bolobeach.bean.Category;
import com.zh.bolobeach.bean.History;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.webkit.WebChromeClient.CustomViewCallback;

/**
 * @author royzhang just for myself learn android SQLite.
 */
public class DbAdapter {
	public static final String	TAG				= DbAdapter.class.getSimpleName();
	private Context				mContext;
	public static final String	DBASE_NAME		= "bolobeach";
	public static final String	DBASE_TABLE		= "history";
	public static final String	CATEGORY_TABLE	= "category";
	public static final int		DBASE_VERSION	= 1;

	public static final String	DBASE_CREATE	= "create table history "
														+ "(id INTEGER PRIMARY KEY AUTOINCREMENT,imei text,androidId text,wifiMac text,WifiSSID text,"
														+ "wifiBSSID text,telephone text,simICCID text,simIMSI text, "
														+ "simStatus text,DNOId text,simCountry text,DNOName text, "
														+ "phoneName text,phoneFWH text,HVGA text,categoryId text,createTime text);";

	public static final String	CATEGORY_CREATE	= "create table category(categoryId INTEGER PRIMARY KEY AUTOINCREMENT,categoryName text,createDate text)";
	private DataBaseHelper		mBaseHelper;
	private SQLiteDatabase		mDb;



	public DbAdapter(Context context) {
		this.mContext = context;
		mBaseHelper = new DataBaseHelper(mContext, DBASE_NAME, null, DBASE_VERSION);
	}



	public DbAdapter getWritableDatabase() {
		mDb = mBaseHelper.getWritableDatabase();
		return this;
	}



	/**
	 * 
	 * <method description>
	 *
	 * @return
	 */
	public DbAdapter getReadableDatabase() {
		mDb = mBaseHelper.getReadableDatabase();
		return this;
	}



	public void closeDbase() {
		mBaseHelper.close();
	}



	// -----------------------------------------------------------------
	/**
	 * 插入一个category数据 <method description>
	 *
	 * @param category
	 * @return
	 */
	public boolean insertCatagory(Category category) {
		if (category.getCatagoryId() != null) {
			getWritableDatabase();
			String sql = "insert into category(categoryName,categoryDate) values(?,?)";
			Object[] param = {category.getCatagoryName(), category.getCreateDate() };
			mDb.execSQL(sql, param);
			return true;
		}
		return false;
	}



	/**
	 * 插入一条history <method description>
	 *
	 * @param history
	 * @return
	 */
	public boolean insertHistory(History history) {
		
		if(history.getCategoryId()==null || history.getCategoryId()==""){
			Category category = new Category();
			category.setCatagoryName(new Date().getTime()+"");
			category.setCreateDate(new Date()+"");
			insertCatagory(category);
			history.setCategoryId("1");
		}
		
		if (history.getAndroidId() != null) {
			getWritableDatabase();
			String sql = "insert into history(imei,androidId,wifiMac,WifiSSID,wifiBSSID,telephone,simICCID,simIMSI,simStatus,DNOId,simCountry,DNOName,phoneName,phoneFWH,HVGA,categoryId,createTime) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] param = { history.getImei(), history.getAndroidId(), history.getWifiMac(), history.getWifiSSID(),
					history.getWifiBSSID(), history.getTelephone(), history.getSimICCID(), history.getSimIMSI(),
					history.getSimStatus(), history.getDNOId(), history.getSimCountry(), history.getDNOName(),
					history.getPhoneName(), history.getPhoneFWH(), history.getHVGA(), history.getCategoryId(),
					history.getCreateTime() };
			mDb.execSQL(sql, param);
			return true;
		}
		return false;
	}



	/**
	 * 获取所有的catagroy <method description>
	 *
	 * @return
	 */
	public List<Category> getAllCategories() {
		getReadableDatabase();
		List<Category> list = new ArrayList<Category>();
		Cursor cursor = mDb.query(CATEGORY_TABLE, null, null, null, null, null, null);
		if (cursor != null && cursor.moveToFirst()) {
			while (cursor.moveToNext()) {
				Category category = new Category();
				category.setCatagoryId(cursor.getString(cursor.getColumnIndex("categoryId")));
				category.setCatagoryName(cursor.getString(cursor.getColumnIndex("categoryName")));
				category.setCreateDate(cursor.getString(cursor.getColumnIndex("createDate")));
				list.add(category);
			}
		}
		return list;
	}



	/**
	 * 根据catelogId来获取所有的history，更具创建的时间来进行排序 <method description>
	 *
	 * @param catelogId
	 *            目录的id值
	 * @return List<History>
	 */
	public List<History> getHistoryByCatalogId(String catelogId) {
		getReadableDatabase();
		List<History> list = new ArrayList<History>();
		Cursor cursor = mDb.query(DBASE_TABLE, null, "categoryId=?", new String[] { catelogId }, null, null,
				"createTime desc");
		if (cursor != null && cursor.moveToFirst()) {
			while (cursor.moveToNext()) {
				History history = new History();
				history.setId(cursor.getInt(cursor.getColumnIndex("id")));
				history.setAndroidId(cursor.getString(cursor.getColumnIndex("androidId")));
				history.setCategoryId(cursor.getString(cursor.getColumnIndex("categoryId")));
				history.setCreateTime(cursor.getString(cursor.getColumnIndex("createTime")));
				history.setDNOId(cursor.getString(cursor.getColumnIndex("DNOId")));
				history.setDNOName(cursor.getString(cursor.getColumnIndex("DNOName")));
				history.setHVGA(cursor.getString(cursor.getColumnIndex("HVGA")));
				history.setImei(cursor.getString(cursor.getColumnIndex("imei")));
				history.setPhoneFWH(cursor.getString(cursor.getColumnIndex("phoneFWH")));
				history.setPhoneName(cursor.getString(cursor.getColumnIndex("phoneName")));
				history.setSimCountry(cursor.getString(cursor.getColumnIndex("simCountry")));
				history.setSimICCID(cursor.getString(cursor.getColumnIndex("simICCID")));
				history.setSimIMSI(cursor.getString(cursor.getColumnIndex("simIMSI")));
				history.setSimStatus(cursor.getString(cursor.getColumnIndex("simStatus")));
				history.setTelephone(cursor.getString(cursor.getColumnIndex("telephone")));
				history.setWifiBSSID(cursor.getString(cursor.getColumnIndex("wifiBSSID")));
				history.setWifiMac(cursor.getString(cursor.getColumnIndex("wifiMac")));
				history.setWifiSSID(cursor.getString(cursor.getColumnIndex("WifiSSID")));
				list.add(history);
			}
		}
		return list;
	}



	/**
	 * 获取每一个history
	 * <method description>
	 *
	 * @param historyId
	 * @return
	 */
	public History getHistoryById(String historyId) {
		getReadableDatabase();
		Cursor cursor = mDb.query(DBASE_TABLE, null, "id=?", new String[] { historyId }, null, null, null);
		if (cursor != null && cursor.moveToFirst()) {
			while (cursor.moveToNext()) {
				History history = new History();
				history.setId(cursor.getInt(cursor.getColumnIndex("id")));
				history.setAndroidId(cursor.getString(cursor.getColumnIndex("androidId")));
				history.setCategoryId(cursor.getString(cursor.getColumnIndex("categoryId")));
				history.setCreateTime(cursor.getString(cursor.getColumnIndex("createTime")));
				history.setDNOId(cursor.getString(cursor.getColumnIndex("DNOId")));
				history.setDNOName(cursor.getString(cursor.getColumnIndex("DNOName")));
				history.setHVGA(cursor.getString(cursor.getColumnIndex("HVGA")));
				history.setImei(cursor.getString(cursor.getColumnIndex("imei")));
				history.setPhoneFWH(cursor.getString(cursor.getColumnIndex("phoneFWH")));
				history.setPhoneName(cursor.getString(cursor.getColumnIndex("phoneName")));
				history.setSimCountry(cursor.getString(cursor.getColumnIndex("simCountry")));
				history.setSimICCID(cursor.getString(cursor.getColumnIndex("simICCID")));
				history.setSimIMSI(cursor.getString(cursor.getColumnIndex("simIMSI")));
				history.setSimStatus(cursor.getString(cursor.getColumnIndex("simStatus")));
				history.setTelephone(cursor.getString(cursor.getColumnIndex("telephone")));
				history.setWifiBSSID(cursor.getString(cursor.getColumnIndex("wifiBSSID")));
				history.setWifiMac(cursor.getString(cursor.getColumnIndex("wifiMac")));
				history.setWifiSSID(cursor.getString(cursor.getColumnIndex("WifiSSID")));
				return history;
			}
		}
		return null;
	}

	private class DataBaseHelper extends SQLiteOpenHelper {

		public DataBaseHelper(Context context, String name, CursorFactory factory, int version) {
			super(context, name, factory, version);
		}



		@Override
		public void onCreate(SQLiteDatabase db) {
			// TODO Auto-generated method stub
			db.execSQL(DBASE_CREATE);
			db.execSQL(CATEGORY_CREATE);
		}



		@Override
		public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
			Log.w(TAG, "Upgrading database from version " + oldVersion + " to " + newVersion
					+ ", which will destroy all old data");

			db.execSQL("DROP TABLE IF EXISTS titles");
			onCreate(db);
		}
	}
}
