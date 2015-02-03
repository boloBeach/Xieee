package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import net.xieee.util.MD5;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Users;
import net.xieee.web.service.BackIndexServiceInter;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class BackIndexServiceImpl<T> extends BaseServiceImpl<T> implements BackIndexServiceInter{
	private final static Logger LOGGER = Logger.getLogger(BackIndexServiceImpl.class);
	public boolean checkAdmin(Users users) {
		if(StringUtil.isNull(users)){
			return false;
		}
		String sql = "select from users where is_delete=? and role=? and email=?";
		Object[] params = {1,2,users.getEmail()};
		List<Map<String, Object>> list = getList(sql, params);
		if(StringUtil.isNull(list)){
			return false;
		}
		
		Object password = list.get(0).get("user_password");
		if(StringUtil.isNull(password)){
			return false;
		}
		
		if(password.equals(MD5.GetMD5Code(users.getUser_password()))){
			LOGGER.warn("email:"+users.getEmail()+"的用户登录后台");
			return true;
		}
		
		return false;
	}

}
