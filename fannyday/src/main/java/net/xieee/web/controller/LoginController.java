package net.xieee.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@Controller
public class LoginController {
	@Autowired
	private UsersServiceInter usersServiceImpl;
	private final static Logger logger = Logger.getLogger(LoginController.class);
	@RequestMapping(value = "loginuser.html")
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
				return new ModelAndView("redirect:index.html");
			} 
		}
		return new ModelAndView("redirect:login.html");
	}

	@RequestMapping(value="regist.html")
	public ModelAndView regist(HttpServletRequest request,
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
				return new ModelAndView("redirect:index.html");
			}
		}
		return new ModelAndView("redirect:register.html");
	}
	
	@RequestMapping(value="checkEmail")
	public void checkEmail(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String email = request.getParameter("email");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e.toString());
		}
		boolean isTure = usersServiceImpl.checkEmail(email);
		if (isTure) {
			out.write("1");
		}else {
			out.write("0");
		}
		out.close();
	}
}
