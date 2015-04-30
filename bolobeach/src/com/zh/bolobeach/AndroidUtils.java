package com.zh.bolobeach;

import android.app.Activity;
import android.widget.EditText;

public class AndroidUtils extends Activity  {

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
