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
 * 这个是用来做首页登录的controller
 * 
 * @author royzhang
 *
 */
@Controller
public class IndexController {
	@Autowired
	private IndexServiceInter indexServiceImpl;
	@RequestMapping(value="showIndex")
	public ModelAndView showIndex(HttpServletRequest request,
			HttpServletResponse response) {
		String parentCatalogId = request.getParameter("parentCatalogId");
		String urlId = request.getParameter("urlId");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(parentCatalogId);
		ModelAndView modelAndView = new ModelAndView("/index");
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
}
