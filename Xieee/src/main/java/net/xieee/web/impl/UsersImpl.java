package net.xieee.web.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import net.xieee.test.MD5;
import net.xieee.util.StringUtil;
import net.xieee.web.inter.UsersInter;

@Service
public class UsersImpl implements UsersInter {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean checkUsers(String name, String password) {
		if(StringUtil.isNull(name) || StringUtil.isNull(password)){
			return false;
		}
		String sql = "select user_password from users where user_name = ?";
		Object[] args = { name };
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, args);
		if (list.size() == 1) {
			String user_password = (String) list.get(0).get("user_password");
			if(user_password.equals(MD5.GetMD5Code(password))){
				return true;
			}
		}
		return false;
	}

}
