package net.xieee.web.background;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.xieee.util.Contants;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Users;
import net.xieee.web.service.BackIndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BGIndexController {
	@Autowired
	private BackIndexServiceInter backIndexServiceImpl;
	
	@RequestMapping(value="backIndex.action")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
	@RequestMapping(value="backLogin.action")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,Users users){
		
		String checkCode = request.getParameter("checkCode");
		HttpSession session = request.getSession();
		Object randCode = session.getAttribute(Contants.RANDOMCODEKEY);
		ModelMap map = new ModelMap();
		if(!StringUtil.isNull(checkCode) && !StringUtil.isNull(randCode) && !checkCode.toLowerCase().equals(session.getAttribute(Contants.RANDOMCODEKEY).toString().toLowerCase())){
			map.addAttribute("errorIndex", "-4");
			return new ModelAndView("redirect:backIndex.action",map);
		}
		int result =  backIndexServiceImpl.checkAdmin(users);
		if(result!=1){
			map.addAttribute("errorIndex", result);
			return  new ModelAndView("redirect:backIndex.action",map);
		}else {
			// 存入session
			session.setAttribute("backUsers", users.getEmail());
			return new ModelAndView("index");
		}
	}
}
