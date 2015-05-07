package com.android.xposedemo;

interface IPrivacyService {
	String  getValue(String id);
	void    setValue(String id,String value);
	long    getCount();
}
