package net.xieee.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.IndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 负责所有的跳转工作
 * @author royzhang
 *
 */
@Controller
public class RedictController {
	@Autowired
	private IndexServiceInter indexServiceImpl;
	
	@RequestMapping(value="login.html")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response){
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="register.html")
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response){
		return new ModelAndView("register");
	}
	
	@RequestMapping(value="detail.html")
	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("detail");
		String urlId = request.getParameter("urlId");
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
}
