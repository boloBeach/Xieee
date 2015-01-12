package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import net.xieee.test.MD5;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Users;
import net.xieee.web.service.UsersServiceInter;

import org.springframework.stereotype.Repository;

@Repository
public class UsersServiceImpl extends BaseServiceImpl implements
		UsersServiceInter {

	public boolean checkUsers(String name, String password) {
		if (StringUtil.isNull(name) || StringUtil.isNull(password)) {
			return false;
		}
		String sql = "select user_password from users where user_name=?";
		Object[] params = { name };
		List<Map<String, Object>> list = getList(sql, params);
		if (list.size() > 0) {
			Object user_password = list.get(0).get("user_password");
			if (user_password.equals(MD5.GetMD5Code(password))) {
				return true;
			}
		}
		return false;
	}

}
