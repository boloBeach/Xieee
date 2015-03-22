package net.xieee.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.IndexServiceInter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

/**
 * 这个是用来做首页登录的controller
 * 
 * @author royzhang
 *
 */
@Controller
public class IndexController {
	private final static Logger logger = Logger.getLogger(IndexController.class);
	@Autowired
	private IndexServiceInter indexServiceImpl;
	@RequestMapping(value="{urlId}/index.html")
	public ModelAndView showIndex(@PathVariable String urlId,HttpServletRequest request,
			HttpServletResponse response) {
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("/index");
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("randPicture", indexServiceImpl.randPicture(urlId,null));
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		modelAndView.addObject("id",urlId);
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
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		return modelAndView;
	}
	
	@RequestMapping(value="showResource.html")
	public void showResource(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String urlId = request.getParameter("urlId");
		String type = request.getParameter("type");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e.toString());
		}
		Gson gson = new Gson();
		out.write(gson.toJson(indexServiceImpl.randPicture(urlId,type)));
		out.close();
	}
}
