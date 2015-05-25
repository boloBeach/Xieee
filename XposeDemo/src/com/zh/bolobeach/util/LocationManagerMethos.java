package com.zh.bolobeach.util;

/**
 * 位置模拟的方法类，添加权限<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
 * <class description>
 *
 * @author: royzhang
 * @version: 1.0, May 25, 2015
 */
public enum LocationManagerMethos {
    
    /**
     * 可以用来设置经纬度的，我们就需要设置经纬度
     * 
     */
    getLastKnownLocation,
    
    /**
     * provider是否可用
     */
    isProviderEnabled,
    
    /**
     * 中断注册
     */
    removeUpdates,
    
    /**
     * 变化的通知
     */
    requestLocationUpdates
}
