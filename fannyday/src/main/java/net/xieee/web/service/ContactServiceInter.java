package net.xieee.web.service;

import net.xieee.web.bean.Contact;
import sun.security.action.GetBooleanAction;

public interface ContactServiceInter extends BaseServiceInter {
	/**
	 * 获取用户联系人信息。
	 * @return
	 */
	public Contact getContact();
}
