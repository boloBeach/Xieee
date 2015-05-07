package com.zh.bolobeach.bean;


/**
 * 对历史记录进行分类处理 <class description>
 *
 * @author: royzhang
 * @version: 1.0, May 6, 2015
 */
public class Category {
	private String	mCatagoryId;
	private String	mCatagoryName;
	private String	mCreateDate;



	public String getCatagoryId() {
		return mCatagoryId;
	}



	public void setCatagoryId(String pCatagoryId) {
		mCatagoryId = pCatagoryId;
	}



	public String getCatagoryName() {
		return mCatagoryName;
	}



	public void setCatagoryName(String pCatagoryName) {
		mCatagoryName = pCatagoryName;
	}



	public String getCreateDate() {
		return mCreateDate;
	}



	public void setCreateDate(String pCreateDate) {
		mCreateDate = pCreateDate;
	}
}
