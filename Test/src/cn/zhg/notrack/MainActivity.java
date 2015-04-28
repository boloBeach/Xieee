package cn.zhg.notrack;

import java.util.Random;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;

public class MainActivity extends Activity implements OnClickListener
{
	private TelephonyManager phone;
	private WifiManager wifi;

	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		phone = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
		wifi = (WifiManager) getSystemService(Context.WIFI_SERVICE);
		addClick(R.id.rimei, R.id.rimsi, R.id.rnumber, R.id.rsimserial,
				R.id.rwifimac, R.id.rbluemac, R.id.randroidid,R.id.rserial,R.id.rbrand);
		// readData();
		init();
	}

	public boolean onCreateOptionsMenu(Menu menu)
	{
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	private void init()
	{
		setEditText(R.id.imei, phone.getDeviceId());
		setEditText(R.id.imsi, phone.getSubscriberId());
		setEditText(R.id.number, phone.getLine1Number());
		setEditText(R.id.simserial, phone.getSimSerialNumber());
		setEditText(R.id.wifimac, wifi.getConnectionInfo().getMacAddress());
		setEditText(R.id.bluemac, BluetoothAdapter.getDefaultAdapter()
				.getAddress());
		setEditText(R.id.androidid,
				Secure.getString(getContentResolver(), Secure.ANDROID_ID));
		setEditText(R.id.serial, android.os.Build.SERIAL);
		setEditText(R.id.brand, android.os.Build.BRAND);
	}

	private void addClick(int... ids)
	{
		if (ids != null)
		{
			for (int id : ids)
			{
				this.findViewById(id).setOnClickListener(this);
			}
		}
	}

	private void setEditText(int id, String s)
	{
		((EditText) this.findViewById(id)).setText(s);
	}

	private String getEditText(int id)
	{
		return ((EditText) this.findViewById(id)).getText().toString();
	}

	/**
	 * 随机生成n位数字
	 * 
	 * @param n
	 * @return
	 */
	private String randomNum(int n)
	{
		String res = "";
		Random rnd = new Random();
		for (int i = 0; i < n; i++)
		{
			res = res + rnd.nextInt(10);
		}
		return res;
	}

	/**
	 * 
	 * @return
	 */
	private String randomPhone()
	{
		/** 前三为 */
		String head[] = { "+8613", "+8615", "+8617", "+8618", "+8616" };
		Random rnd = new Random();
		String res = head[rnd.nextInt(head.length)];
		for (int i = 0; i < 9; i++)
		{
			res = res + rnd.nextInt(10);
		}
		return res;
	}

	private String randomMac()
	{
		String chars = "abcde0123456789";
		String res = "";
		Random rnd = new Random();
		int leng = chars.length();
		for (int i = 0; i < 17; i++)
		{
			if (i % 3 == 2)
			{
				res = res + ":";
			} else
			{
				res = res + chars.charAt(rnd.nextInt(leng));
			}

		}
		return res;
	}

	private String randomMac1()
	{
		String chars = "ABCDE0123456789";
		String res = "";
		Random rnd = new Random();
		int leng = chars.length();
		for (int i = 0; i < 17; i++)
		{
			if (i % 3 == 2)
			{
				res = res + ":";
			} else
			{
				res = res + chars.charAt(rnd.nextInt(leng));
			}

		}
		return res;
	}

	private String randomABC(int n)
	{
		String chars = "abcde0123456789";
		String res = "";
		Random rnd = new Random();
		int leng = chars.length();
		for (int i = 0; i < n; i++)
		{
			res = res + chars.charAt(rnd.nextInt(leng));

		}
		return res;
	}

	public boolean onOptionsItemSelected(MenuItem item)
	{
		int id = item.getItemId();
		if (id == R.id.action_save)
		{
			saveData();
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	/**
	 * 使用SharedPreferences
	 */
	private void saveData()
	{
		try
		{
			SharedPreferences sh = this.getSharedPreferences("prefs",
					Context.MODE_WORLD_READABLE);
			Editor pre = sh.edit();
			pre.putString("imei", this.getEditText(R.id.imei));
			pre.putString("imsi", this.getEditText(R.id.imsi));
			pre.putString("number", this.getEditText(R.id.number));
			pre.putString("simserial", this.getEditText(R.id.simserial));
			pre.putString("wifimac", this.getEditText(R.id.wifimac));
			pre.putString("bluemac", this.getEditText(R.id.bluemac));
			pre.putString("androidid", this.getEditText(R.id.androidid));
			pre.putString("serial", this.getEditText(R.id.serial));
			pre.putString("brand", this.getEditText(R.id.brand));
			pre.apply();
		} catch (Throwable e)
		{
			e.printStackTrace();
		}
	}

	public void onClick(View v)
	{
		switch (v.getId())
		{
		case R.id.rimei:
			setEditText(R.id.imei, this.randomNum(15));
			break;
		case R.id.rimsi:
			setEditText(R.id.imsi, this.randomNum(15));
			break;
		case R.id.rnumber:
			setEditText(R.id.number, this.randomPhone());
			break;
		case R.id.rsimserial:
			setEditText(R.id.simserial, this.randomNum(20));
			break;
		case R.id.rwifimac:
			setEditText(R.id.wifimac, this.randomMac());
			break;
		case R.id.rbluemac:
			setEditText(R.id.bluemac, this.randomMac1());
			break;
		case R.id.randroidid:
			setEditText(R.id.androidid, this.randomABC(16));
			break;
		case R.id.rserial:
			setEditText(R.id.serial, this.randomNum(19)+"a");
			break;
		case R.id.rbrand:
			 
			break;
		}
	}
}
