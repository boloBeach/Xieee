package com.android.xposedemo;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import android.location.Location;
import android.os.Binder;
import android.os.Bundle;
import android.util.Log;
import android.location.GpsSatellite;
import android.location.LocationListener;
import android.location.GpsStatus;
import android.location.LocationManager;

public class XLocationManager extends XHook {
	private Methods mMethod;
	//private String mClassName;
	private static final Map<LocationListener, XLocationListener> mListener = new WeakHashMap<LocationListener, XLocationListener>();

	private XLocationManager(Methods method, String restrictionName) {
		super(restrictionName, method.name(), null);
		mMethod = method;
		//LocationManager llLocationManager;
		//llLocationManager.is
		
	}
	public String getClassName() {
		return "android.location.LocationManager";
	}

	// @formatter:off

	// public void addGeofence(LocationRequest request, Geofence fence, PendingIntent intent)
	// public boolean addNmeaListener(GpsStatus.NmeaListener listener)
	// public void addProximityAlert(double latitude, double longitude, float radius, long expiration, PendingIntent intent)
	// public GpsStatus getGpsStatus(GpsStatus status)
	// public Location getLastKnownLocation(String provider)
	// public List<String> getProviders(boolean enabledOnly)
	// public List<String> getProviders(Criteria criteria, boolean enabledOnly)
	// public boolean isProviderEnabled(String provider)
	// public void removeUpdates(LocationListener listener)
	// public void removeUpdates(PendingIntent intent)
	// public void requestLocationUpdates(String provider, long minTime, float minDistance, LocationListener listener)
	// public void requestLocationUpdates(String provider, long minTime, float minDistance, LocationListener listener, Looper looper)
	// public void requestLocationUpdates(long minTime, float minDistance, Criteria criteria, LocationListener listener, Looper looper)
	// public void requestLocationUpdates(String provider, long minTime, float minDistance, PendingIntent intent)
	// public void requestLocationUpdates(long minTime, float minDistance, Criteria criteria, PendingIntent intent)
	// public void requestSingleUpdate(String provider, LocationListener listener, Looper looper)
	// public void requestSingleUpdate(Criteria criteria, LocationListener listener, Looper looper)
	// public void requestSingleUpdate(String provider, PendingIntent intent)
	// public void requestSingleUpdate(Criteria criteria, PendingIntent intent)
	// public boolean sendExtraCommand(String provider, String command, Bundle extras)
	// frameworks/base/location/java/android/location/LocationManager.java
	// http://developer.android.com/reference/android/location/LocationManager.html

	// @formatter:on

	// @formatter:off
	private enum Methods {
		getLastKnownLocation, isProviderEnabled,
		removeUpdates,
		requestLocationUpdates
	};
	// @formatter:on

	public static List<XHook> getInstances() {
		String className ="android.location.LocationManager";
		List<XHook> listHook = new ArrayList<XHook>();
		for (Methods loc : Methods.values())
		{
				listHook.add(new XLocationManager(loc,"1"));
		}
		return listHook;
	}

	@Override
	protected void before(XParam param) throws Throwable {
		 if (mMethod == Methods.removeUpdates) {
		   removeLocationListener(param);

		} else if (mMethod == Methods.requestLocationUpdates) {
		   replaceLocationListener(param, 3);

		} 
	}

	@Override
	protected void after(XParam param) throws Throwable {
		if (mMethod != Methods.removeUpdates
				&& mMethod != Methods.requestLocationUpdates)
			if (mMethod == Methods.isProviderEnabled) {
				//if (isRestricted(param))
				param.setResult(true);
				//LocationManager llLocationManager;
				

			}else if (mMethod == Methods.getLastKnownLocation) {
				
				Location location = (Location) param.getResult();
				Location location2=new Location(LocationManager.GPS_PROVIDER);
				location2.setLatitude(123.34);
				//location2.setAltitude(23.32);
				location2.setLongitude(111.11);
				if (location != null)
				{
					
					param.setResult(location2);
				}else {
					param.setResult(location2);
				}

			} 
	}

	private void replaceLocationListener(XParam param, int arg) throws Throwable {
		if (param.args.length > arg && param.args[arg] != null
				&& LocationListener.class.isAssignableFrom(param.args[arg].getClass())) {
			if (!(param.args[arg] instanceof XLocationListener)) {
				LocationListener listener = (LocationListener) param.args[arg];
				if (listener != null) {
					XLocationListener xListener;
					synchronized (mListener) {
						xListener = mListener.get(listener);
						if (xListener == null) {
							xListener = new XLocationListener(listener);
							mListener.put(listener, xListener);
							//Util.log(this, Log.WARN,		"Added count=" + mListener.size() + " uid=" + Binder.getCallingUid());
						}
					}
					param.args[arg] = xListener;
				}
			}
		} 
	}

	private void removeLocationListener(XParam param) {
		if (param.args.length > 0 && param.args[0] != null
				&& LocationListener.class.isAssignableFrom(param.args[0].getClass())) {
			LocationListener listener = (LocationListener) param.args[0];
			synchronized (mListener) {
				XLocationListener xlistener = mListener.get(listener);
				if (xlistener != null) {
					param.args[0] = xlistener;
					//Util.log(this, Log.WARN, "Removed count=" + mListener.size() + " uid=" + Binder.getCallingUid());
				}
			}
		}
	}

	private class XLocationListener implements LocationListener {
		private LocationListener mLocationListener;

		public XLocationListener(LocationListener locationListener) {
			mLocationListener = locationListener;
		}

		@Override
		public void onLocationChanged(Location location) {
			if(location==null)
			{
			  location=new Location(LocationManager.GPS_PROVIDER);
			}
			location.setLatitude(1111.11);
			location.setAltitude(222.22);
			mLocationListener.onLocationChanged(location);
		}

		@Override
		public void onProviderDisabled(String provider) {
			mLocationListener.onProviderDisabled(provider);
		}

		@Override
		public void onProviderEnabled(String provider) {
			mLocationListener.onProviderEnabled(provider);
		}

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
			mLocationListener.onStatusChanged(provider, status, extras);
		}
	}
}
