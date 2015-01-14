package net.xieee.web.service;

import net.xieee.web.bean.Users;

public interface UsersServiceInter extends BaseServiceInter {
	public String checkUsers(String name,String password);
	public boolean register(Users users);
}
