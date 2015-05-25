package com.zh.bolobeach.util;

/**
 * 
 * <class description>
 *  这个是用来判断wifi信息的方法类，记得添加权限<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/> 
 * @author: royzhang
 * @version: 1.0, May 25, 2015
 */ 
public enum WifiManagerMethods {
    
    /**
     * 返回是winfiInfo类，此类里面包含了一下信息<br/>
     * 1.getBSSID() 获取BSSID 属性<br/>
     * 2.getDetailedStateOf() 获取客户端的连通性<br/>
     * 3.getHiddenSSID() 获取SSID是否被隐藏<br/>
     * 4.getIpAddress() 获取IP地址<br/>
     * 5.getLinkSpeed() 获取连接的速度<br/>
     * 6.getMacAddress() 获取mac地址<br/>
     * 7.getRssi() 获取802.11n 网络信号<br/>
     * 8.getSSID() 获取SSID<br/>
     * 9.getSupplicanState()  获取具体客户端状态的信息
     */
    getConnectionInfo,
    
    /**
     * 返回是DhcpInfo类。<br/>
     * 1.getIpAddress这个属性是获取ip地址,<br/>
     * 2.getNetMask 获取子网掩码地址
     * 3.getGateway 获取网关
     * 4.getServerAddress 获取server的ip地址
     * 5.getDns1() 获取首选dns
     * 6.getDns2() 获取其他的dns
     */
    getDhcpInfo,
    
    /**
     * 获取wifi的状态，这个不用修改的
     * WIFI_STATE_DISABLED WIFI网卡不可用 
     * WIFI_STATE_DISABLING WIFI网卡正在关闭 
     * WIFI_STATE_ENABLED WIFI网卡可用 
     * WIFI_STATE_ENABLING WIFI网卡正在打开 
     * WIFI_STATE_UNKNOWN WIFI网卡状态不可知
     */
    getWifiState,
    
    /**
     * 通过WifiManager.getConfiguredNetworks()方法会返回WifiConfiguration对象的列表，然后再调用WifiManager.enableNetwork();方法就可以连接上指定的热点。
     * 获取网络连接状态
     */
    getConfiguredNetworks,
}
