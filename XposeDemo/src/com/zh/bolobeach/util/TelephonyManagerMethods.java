package com.zh.bolobeach.util;

//public void disableLocationUpdates
// public void enableLocationUpdates
// public List<CellInfo> getAllCellInfo
// public CellLocation getCellLocation
// public String getDeviceId // 获取imei
// public String getGroupIdLevel1 // 获取双卡双待的手机号码
// public String getIsimDomain //
// public String getIsimImpi
// public String[] getIsimImpu
// public String getLine1AlphaTag
// public String getLine1Number // 获取电话号码
// public String getMsisdn
// public List<NeighboringCellInfo> getNeighboringCellInfo
// public String getNetworkCountryIso // 获取ISO标准的国家码，即国际长途区号
// public String getNetworkOperator // 返回MCC+MNC代码 (SIM卡运营商国家代码和运营商网络代码)(IMSI)
// public String getNetworkOperatorName // 返回移动网络运营商的名字(SPN)
// public int getNetworkType // 
// public int getPhoneType
// public String getSimCountryIso
// public String getSimOperator
// public String getSimOperatorName
// public static int getPhoneType(int networkMode)
// public String getSimSerialNumber
// public String getSubscriberId
// public String getVoiceMailAlphaTag
// public String getSimState;
// public String getVoiceMailNumber
// public void listen(PhoneStateListener listener, int events)
// frameworks/base/telephony/java/android/telephony/TelephonyManager.java
// http://developer.android.com/reference/android/telephony/TelephonyManager.html
public enum TelephonyManagerMethods {
    
    /****************************************TelephonyManager start******************************************/
    
    /**
     * imei 的方法
     * //1. 前6位数(TAC)是”型号核准号码”，一般代表机型
        //2. 接着的2位数(FAC)是”最后装配号”，一般代表产地
        //3. 之后的6位数(SNR)是”串号”，一般代表生产顺序号
        //4. 最后1位数(SP)通常是”0″，为检验码，目前暂备用
     */
    getDeviceId , 
    
    /**
     * 电话号码
     */
    getLine1Number, 
    
    /**
     *  获取ISO标准的国家码，即国际长途区号
     */
    getNetworkCountryIso,
    
    /**
     * 返回MCC+MNC代码 (SIM卡运营商国家代码和运营商网络代码)(IMSI)
     */
    getNetworkOperator,
    
    /**
     * 返回移动网络运营商的名字(SPN)
     */
    getNetworkOperatorName,
    
     /**
     * 获取网络类型
     * 
     * NETWORK_TYPE_CDMA 网络类型为CDMA
     * NETWORK_TYPE_EDGE 网络类型为EDGE
     * NETWORK_TYPE_EVDO_0 网络类型为EVDO0
     * NETWORK_TYPE_EVDO_A 网络类型为EVDOA
     * NETWORK_TYPE_GPRS 网络类型为GPRS
     * NETWORK_TYPE_HSDPA 网络类型为HSDPA
     * NETWORK_TYPE_HSPA 网络类型为HSPA
     * NETWORK_TYPE_HSUPA 网络类型为HSUPA
     * NETWORK_TYPE_UMTS 网络类型为UMTS
     * 
     * 在中国，联通的3G为UMTS或HSDPA，移动和联通的2G为GPRS或EGDE，电信的2G为CDMA，电信的3G为EVDO
     */
    getNetworkType,
    
     /**
     * 返回移动终端的类型
     * 
     * PHONE_TYPE_CDMA 手机制式为CDMA，电信
     * PHONE_TYPE_GSM 手机制式为GSM，移动和联通
     * PHONE_TYPE_NONE 手机制式未知
     */
    getPhoneType,
    
    /**
     * 返回SIM卡提供商的国家代码
     */
    getSimCountryIso,
    
    /**
     * sim卡序列号
     * 需要权限：READ_PHONE_STATE 
     */
    getSimSerialNumber,
    
    /**
     * 电话方位
     */
    getCellLocation,
    
    /**  
     * 设备的软件版本号：   
     * 例如：the IMEI/SV(software version) for GSM phones.   
     * Return null if the software version is not available.    
     */  
    getDeviceSoftwareVersion,
    
    /**   
     * 附近的电话的信息:   
     * 类型：List<NeighboringCellInfo>    
     * 需要权限：android.Manifest.permission#ACCESS_COARSE_UPDATES   
     */  
    getNeighboringCellInfo,
    
    /**   
     *   SIM的状态信息：   
     *   SIM_STATE_UNKNOWN          未知状态 0   
     *   SIM_STATE_ABSENT           没插卡 1   
     *   SIM_STATE_PIN_REQUIRED     锁定状态，需要用户的PIN码解锁 2   
     *   SIM_STATE_PUK_REQUIRED     锁定状态，需要用户的PUK码解锁 3   
     *   SIM_STATE_NETWORK_LOCKED   锁定状态，需要网络的PIN码解锁 4   
     *   SIM_STATE_READY            就绪状态 5   
     */    
    getSimState,
    
    /**
     * 唯一的用户ID：   
     * 例如：IMSI(国际移动用户识别码) for a GSM phone.   
     * 需要权限：READ_PHONE_STATE   
     */
    getSubscriberId,
    
    /****************************************TelephonyManager end******************************************/
    
    
}
