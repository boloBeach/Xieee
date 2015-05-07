package com.android.xposedemo;

public class Hook implements Comparable<Hook> {
	private String mRestrictionName;
	private String mMethodName;
	private boolean mDangerous;
	private boolean mRestart;
	private boolean mNoUsageData;
	private boolean mNoOnDemand;
	private String mWhitelist;
	private boolean mNotify;
	private String[] mPermissions;
	private int mSdk;
	
	private String mReplaces;
	private String mAnnotation = null;

	public Hook(String restrictionName, String methodName) {
		mRestrictionName = restrictionName;
		mMethodName = methodName;
	}

	public Hook(String restrictionName, String methodName, String permissions, int sdk, String from, String replaces) {
		mRestrictionName = restrictionName;
		mMethodName = methodName;
		mDangerous = false;
		mRestart = false;
		mNoUsageData = false;
		mNoOnDemand = false;
		mWhitelist = null;
		mNotify = false;
		mPermissions = (permissions == null ? null : permissions.split(","));
		mSdk = sdk;
		
		mReplaces = replaces;
	}

	public Hook dangerous() {
		mDangerous = true;
		return this;
	}

	// Setters

	public Hook restart() {
		mRestart = true;
		return this;
	}

	public Hook noUsageData() {
		mNoUsageData = true;
		return this;
	}

	public Hook noOnDemand() {
		mNoOnDemand = true;
		return this;
	}

	public Hook whitelist(String whitelist) {
		mWhitelist = whitelist;
		return this;
	}

	public Hook doNotify() {
		mNotify = true;
		return this;
	}

	public String getRestrictionName() {
		return mRestrictionName;
	}

	public String getName() {
		return mMethodName;
	}

	

	public boolean isDangerousDefined() {
		return mDangerous;
	}

	public void annotate(String text) {
		mAnnotation = text;
	}

	// Getters

	public boolean isRestartRequired() {
		return mRestart;
	}

	public boolean hasUsageData() {
		return !mNoUsageData;
	}

	public boolean canOnDemand() {
		return !mNoOnDemand;
	}

	public String whitelist() {
		return mWhitelist;
	}

	public boolean shouldNotify() {
		return mNotify;
	}

	public String[] getPermissions() {
		return mPermissions;
	}

	public int getSdk() {
		return mSdk;
	}

	

	public String getReplaces() {
		return mReplaces;
	}

	public String getAnnotation() {
		return mAnnotation;
	}

	@Override
	public int hashCode() {
		return (mRestrictionName.hashCode() ^ mMethodName.hashCode());
	}

	@Override
	public boolean equals(Object obj) {
		Hook other = (Hook) obj;
		return (mRestrictionName.equals(other.mRestrictionName) && mMethodName.equals(other.mMethodName));
	}

	@Override
	public int compareTo(Hook another) {
		int x = mRestrictionName.compareTo(another.mRestrictionName);
		return (x == 0 ? mMethodName.compareTo(another.mMethodName) : x);
	}

	@Override
	public String toString() {
		return String.format("%s/%s", mRestrictionName, mMethodName);
	}
}
