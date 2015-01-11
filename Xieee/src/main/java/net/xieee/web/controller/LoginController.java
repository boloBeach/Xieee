package net.xieee.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping(value="login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Users users) {
		String username = users.getName();
		ModelAndView modelAndView = new ModelAndView("/index/index","loginInfo","LOGIN SUCCESS, " + username);
		return modelAndView;
	}
}
