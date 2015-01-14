package net.xieee.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.xieee.util.Contants;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Users;
import net.xieee.web.service.UsersServiceInter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

@Controller
public class LoginController {
	@Autowired
	private UsersServiceInter usersServiceImpl;
	private final static Logger logger = Logger.getLogger(LoginController.class);
	@RequestMapping(value = "login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, Users users) {
		String email = users.getEmail();
		String password = users.getUser_password();
		String checkCode = request.getParameter("checkCode");
		HttpSession session = request.getSession();
		Object randCode = session.getAttribute(Contants.RANDOMCODEKEY);
		if(!StringUtil.isNull(checkCode) && !StringUtil.isNull(randCode) && checkCode.toLowerCase().equals(randCode.toString().toLowerCase())){
			String user_name = usersServiceImpl.checkUsers(email, password);
			if (!StringUtil.isNull(user_name)) {
				session.setAttribute("user_name", user_name);
				return  new ModelAndView("/index", "loginInfo",
						"LOGIN SUCCESS, " + email);
			} 
		}
		return new ModelAndView("/error", "loginInfo",
				"LOGIN ERROR, " + email);
	}

	@RequestMapping(value="regist")
	public String regist(HttpServletRequest request,
			HttpServletResponse response, Users users) {
		boolean result = false;
		HttpSession session = request.getSession();
		String checkCode = request.getParameter("checkCode");// get check code
		if (checkCode.equals(session.getAttribute(Contants.RANDOMCODEKEY))) {
			if (users != null) {
				result = usersServiceImpl.register(users);
			}

			if (result) {
				session.setAttribute("user_name", users.getUser_name());
				return "index";
			}
		}
		return "register";
	}
}
