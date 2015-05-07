package com.android.xposedemo;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.zh.bolobeach.util.AndroidUtils;
import com.zh.bolobeach.util.Utils;

public class MainActivity extends Activity {

	private static final String TAG = "MainActivity";
	public Button ChangeButton = null;
	public Button showButton = null;
	public Button clearButton = null;
	public EditText imeiEditText = null;
	public EditText macEditText = null;
	public TelephonyManager telephonyManager = null;

	class MyButtonClick implements View.OnClickListener {

		@Override
		public void onClick(View view) {
			switch (view.getId()) {
			case R.id.button_change:
				// 随机生成imei
				String imei = Utils.randomNum(15);
				System.out.println(imei);
				// 随机生成wifimac地址
				String wifiMac = Utils.randomWifiMac();
				try {
					PrivacyManager.setValue("imei", imei);
					PrivacyManager.setValue("mac", wifiMac);
				} catch (Exception e) {
					Log.d(TAG, "change********** ex:" + e.toString());
				}
		        Toast.makeText(getApplicationContext(), "随机并且保存"+imei, Toast.LENGTH_SHORT).show();
				break;
			default:
				break;
			}
		}

	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		getPhoneInfo();
		ChangeButton = (Button) findViewById(R.id.button_change);
		ChangeButton.setOnClickListener(new MyButtonClick());
		
	}

	public void getPhoneInfo(){
		// 获取手机的基本信息
		telephonyManager = (TelephonyManager) this.getSystemService("phone");
		WifiManager wifiMan = (WifiManager) getSystemService(Context.WIFI_SERVICE);
		
		// 设置telephone的基本信息
		imeiEditText = (EditText) findViewById(R.id.editTextIMEI); // imei
		imeiEditText.setText(telephonyManager.getDeviceId());
		
		EditText telephoneEditText = (EditText) findViewById(R.id.editTextTelephone); // 电话号码
		telephoneEditText.setText(telephonyManager.getLine1Number());
		
		EditText androidId = (EditText) findViewById(R.id.editTextandroidId); // android id
		androidId.setText( android.provider.Settings.Secure.getString(getContentResolver(), android.provider.Settings.Secure.ANDROID_ID));
		
		EditText simICCID = (EditText) findViewById(R.id.editTextSimICCID);// sim 序列号
		simICCID.setText(telephonyManager.getSimSerialNumber());
		
		EditText imsi = (EditText) findViewById(R.id.editTextImsi); // imsi
		imsi.setText(telephonyManager.getSubscriberId());
	
		/*EditText simStatus = (EditText) findViewById(R.id.editTextSimStatus);
		simStatus.setText(telephonyManager.getSimState());*/
		
		EditText simCountry = (EditText) findViewById(R.id.editTextSimCountry);
		simCountry.setText(telephonyManager.getSimCountryIso());
		
		EditText DNOName = (EditText) findViewById(R.id.editTextDNOName);
		DNOName.setText(telephonyManager.getSimOperator());
		
		EditText phoneName = (EditText) findViewById(R.id.editTextPhoneName);
		phoneName.setText(android.os.Build.MODEL); // 手机型号
		
		EditText phoneFWH = (EditText) findViewById(R.id.editTextPhoneFWH);
		phoneFWH.setText(android.os.Build.VERSION.RELEASE); // 固件信息
		
		EditText HVGA = (EditText) findViewById(R.id.editTextHVGA);
		HVGA.setText(getWindowManager().getDefaultDisplay().getWidth()+"-"+getWindowManager().getDefaultDisplay().getHeight()); // 固件信息
		
		
		
		EditText DNOId = (EditText) findViewById(R.id.editTextDNOId);
		DNOId.setText("运营商id");
		
		
		
		// 设置mac相关信息
		macEditText = (EditText) findViewById(R.id.editTextMAC);
		macEditText.setText(wifiMan.getConnectionInfo().getMacAddress());
		EditText wifiSSID = (EditText) findViewById(R.id.editTextWifiSSID);
		wifiSSID.setText(wifiMan.getConnectionInfo().getSSID());
		EditText wifiBSSID = (EditText) findViewById(R.id.editTextWifiBSSID);
		wifiBSSID.setText(wifiMan.getConnectionInfo().getBSSID());
	}
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
