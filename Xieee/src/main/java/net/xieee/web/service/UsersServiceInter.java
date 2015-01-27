package net.xieee.web.service;

import net.xieee.web.bean.Users;

public interface UsersServiceInter extends BaseServiceInter {
	/**
	 * 验证用户登陆
	 * @param name 用户名字，这个是唯一的
	 * @param password 用户的密码
	 * @return 返回一个string类型
	 */
	public String checkUsers(String name,String password);
	
	/**
	 * 注册用户，如果是成功了，那么就返回true thus return false
	 * @param users 用户的对象
	 * @return boolean
	 */
	public boolean register(Users users);
	
	/**
	 * 检车用户的邮箱是否注册了
	 * @param email  邮件
	 * @return true or false,then email has not regist return ture,thus turn false
	 */
	public boolean checkEmail(String email);
}
