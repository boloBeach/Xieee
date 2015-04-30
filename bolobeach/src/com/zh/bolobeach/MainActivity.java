package com.zh.bolobeach;

import android.app.Activity;
import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.zh.bolobeach.R.id;

public class MainActivity extends Activity {

	private AndroidUtils		androidUtils = null;
	private TelephonyManager	phone;
	private WifiManager			wifi;



	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		phone = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
		wifi = (WifiManager) getSystemService(Context.WIFI_SERVICE);
		androidUtils = new AndroidUtils();
		init();
		// 保存按钮
		Button saveButton = (Button) findViewById(id.save);
		saveButton.setOnClickListener(new OnClickListener() {
			public void onClick(View view) {
				Toast toast = Toast.makeText(MainActivity.this, "save", Toast.LENGTH_SHORT);
				toast.show();
			}
		});

		// 随机并且保存
		Button randomButton = (Button) findViewById(id.random_save);
		randomButton.setOnClickListener(new OnClickListener() {
			public void onClick(View view) {
				setEditText(id.imei_text, Utils.randomNum(15));
				setEditText(id.android_id_text, Utils.randomAndroidId(16));
				setEditText(id.wifi_mac_text, Utils.randomWifiMac());
				setEditText(id.imsi_text,Utils.randomNum(15) );
				Toast toast = Toast.makeText(MainActivity.this, "随机并且保存成功", Toast.LENGTH_SHORT);
				toast.show();
			}
		});
	}



	public void init() {
		setEditText(id.imei_text, phone.getDeviceId());
		setEditText(id.android_id_text, Secure.getString(getContentResolver(), Secure.ANDROID_ID));
		setEditText(id.wifi_mac_text,  wifi.getConnectionInfo().getMacAddress());
		setEditText(id.imsi_text,  phone.getSubscriberId());
	}
	
	/**
	 * 对某一个id，设置值 <method description>
	 *
	 * @param androidId
	 * @param text
	 */
	public void setEditText(int editTextId, String text) {
		EditText editText = (EditText) findViewById(editTextId);
		if (!Utils.isNull(editText)) {
			editText.setText(text);
		}
	}



	/**
	 * 通过id值获取一个值 <method description>
	 *
	 * @param editTextId
	 * @return
	 */
	public String getEditText(int editTextId) {
		return ((EditText) this.findViewById(editTextId)).getText().toString();
	}
}
