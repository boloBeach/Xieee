package net.xieee.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Users;
import net.xieee.web.impl.UsersImpl;
import net.xieee.web.inter.UsersInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping(value = "login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Users users) {
		String username = users.getName();
		String password = users.getPassword();
		UsersInter usersInter = new UsersImpl();
		boolean isLogin = usersInter.checkUsers(username, password);
		ModelAndView modelAndView = null;
		if (isLogin) {
			modelAndView = new ModelAndView("/testjsp/success", "loginInfo",
					"LOGIN SUCCESS, " + username);
		} else {
			modelAndView = new ModelAndView("/testjsp/error", "loginInfo",
					"LOGIN SUCCESS, " + username);
		}
		return modelAndView;
	}
}
