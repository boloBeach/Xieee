package net.xieee.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Users;
import net.xieee.web.service.UsersServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Autowired
	private UsersServiceInter usersServiceImpl;
	
	@RequestMapping(value = "login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Users users) {
		String username = users.getName();
		String password = users.getPassword();
		boolean isLogin = usersServiceImpl.checkUsers(username, password);
		ModelAndView modelAndView = null;
		if (isLogin) {
			modelAndView = new ModelAndView("/success", "loginInfo",
					"LOGIN SUCCESS, " + username);
		} else {
			modelAndView = new ModelAndView("/error", "loginInfo",
					"LOGIN ERROR, " + username);
		}
		return modelAndView;
	}
}
