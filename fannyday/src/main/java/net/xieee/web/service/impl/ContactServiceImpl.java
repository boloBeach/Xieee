package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import net.xieee.web.bean.Contact;
import net.xieee.web.service.ContactServiceInter;

import org.springframework.stereotype.Repository;

@Repository
public class ContactServiceImpl<T> extends BaseServiceImpl<T> implements
		ContactServiceInter {

	public Contact getContact() {
		String sql = "select constact_name,email,telphone,address  from contanct   where is_delete=? limit 1";
		Object[] params = { 1 };
		List<Map<String, Object>> mapList = getList(sql, params);
		if (mapList.size() == 0) {
			return null;
		}
		Contact contact = new Contact();
		String key = null;
		Map<String, Object> map = mapList.get(0);
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			key = entry.getKey();
			if (key.equals("constact_name")) {
				contact.setConstact_name((String) map.get(key));
			}

			if (key.equals("email")) {
				contact.setEmail((String) map.get(key));
			}

			if (key.equals("telphone")) {
				contact.setTelphone((String) map.get(key));
			}

			if (key.equals("address")) {
				contact.setAddress((String) map.get(key));
			}
		}
		return contact;
	}

}
