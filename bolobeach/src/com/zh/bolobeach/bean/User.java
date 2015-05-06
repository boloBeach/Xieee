package com.zh.bolobeach.bean;

public class User {
	// 用户的id值，用来区分哪一个用户
	private String mUserId;
	// 用户的名字
	private String mUserName;
	
	// 是不是vip用户
	private String mIsVip;
	
	// 此用户程序是否可用
	private String mIsAvailable;

	public String getUserId() {
		return mUserId;
	}

	public void setUserId(String pUserId) {
		mUserId = pUserId;
	}

	public String getUserName() {
		return mUserName;
	}

	public void setUserName(String pUserName) {
		mUserName = pUserName;
	}

	public String getIsVip() {
		return mIsVip;
	}

	public void setIsVip(String pIsVip) {
		mIsVip = pIsVip;
	}

	public String getIsAvailable() {
		return mIsAvailable;
	}

	public void setIsAvailable(String pIsAvailable) {
		mIsAvailable = pIsAvailable;
	}
	
	
}
