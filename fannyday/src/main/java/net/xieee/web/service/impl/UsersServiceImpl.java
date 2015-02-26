package net.xieee.web.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.xieee.util.MD5;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Users;
import net.xieee.web.service.UsersServiceInter;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class UsersServiceImpl extends BaseServiceImpl implements
		UsersServiceInter {
	private final static Logger LOGGER = Logger.getLogger(UsersServiceImpl.class);
	
	public String checkUsers(String email, String password) {
		if (StringUtil.isNull(email) || StringUtil.isNull(password)) {
			return null;
		}
		String sql = "select user_password,user_name from users where email=? and is_delete=?";
		Object[] params = { email,1 };
		List<Map<String, Object>> list = getList(sql, params);
		if (list.size() > 0) {
			Object user_password = list.get(0).get("user_password");
			if (user_password.equals(MD5.GetMD5Code(password))) {
				// if login success then update the login_count and last_login_date
				String updateSql = "update users set login_count=login_count+1,last_login_date=? where email=? and user_password=?";
				Object[] updateParams = {new Date(),email,user_password};
				save(updateSql, updateParams);
				LOGGER.warn("用户名为:"+email+"--在"+new Date()+"登录网站");
				return list.get(0).get("user_name").toString();
			}
		}
		return null;
	}

	public boolean register(Users users) {
		if (StringUtil.isNull(users.getEmail())
				|| StringUtil.isNull(users.getUser_name())
				|| StringUtil.isNull(users.getUser_password())) {
			LOGGER.error("对不起，您输入的用户名或者emial或者密码为空");
			return false;
		}
		
		// check email 
		String checkEmailSql = "select count(1) from users where email=?";
		Object[] checkParams = {users.getEmail()};
		List list = getList(checkEmailSql, checkParams);
		if(list == null || list.size()>1){
			LOGGER.warn("对不起，您输入的"+users.getEmail()+"邮箱已经被注册了。");
			return false;
		}
		String sql = "insert into users (user_name,email,user_password) values(?,?,?) ";
		Object[] params = { users.getUser_name(), users.getEmail(),
				MD5.GetMD5Code(users.getUser_password()) };
		int result = save(sql, params);
		if (result == 1) {
			LOGGER.warn("用户名为:"+users.getUser_name()+"   email:"+users.getEmail()+"的注册成功");
			return true;
		}
		return false;
	}

	public boolean checkEmail(String email) {
		if(!StringUtil.isNull(email)){
			String sql = "select count(1) from users where email=?";
			Object[] params = {email};
			int count = getCount(sql,params);
			if(count != 1){
				return false;
			}else {
				return true;
			}
		}
		return false;
	}

}
