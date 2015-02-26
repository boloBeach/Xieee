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

import com.sun.xml.internal.messaging.saaj.packaging.mime.Header;

/**
 * 这个是用来做首页登录的controller
 * 
 * @author royzhang
 *
 */
@Controller
public class IndexController {
	@Autowired
	private IndexServiceInter indexServiceImpl;
	@RequestMapping(value="index.html")
	public ModelAndView showIndex(HttpServletRequest request,
			HttpServletResponse response) {
		String urlId = request.getParameter("urlId");
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("/index");
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("randPicture", indexServiceImpl.randPicture());
		modelAndView.addObject("randGifPicture", indexServiceImpl.randGifPicture());
		return modelAndView;
	}
	
	@RequestMapping("header")
	public ModelAndView Header(HttpServletRequest request,HttpServletResponse response){
		String parentCatalogId = request.getParameter("parentCatalogId");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(parentCatalogId);
		ModelAndView modelAndView = new ModelAndView("/index");
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
	
	@RequestMapping(value="about.html")
	public ModelAndView aboutAs(HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("aboutus");
		String urlId = request.getParameter("urlId");
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
}
