package net.xieee.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.CartoonServiceInter;
import net.xieee.web.service.CommonServerInter;
import net.xieee.web.service.IndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 负责所有的跳转工作
 * 
 * @author royzhang
 *
 */
@Controller
public class RedictController {
	@Autowired
	private IndexServiceInter	indexServiceImpl;
	
	@Autowired
	private CartoonServiceInter cartoonServiceImpl;
	
	@Autowired
	private CommonServerInter commonServiceImpl;



	@RequestMapping(value = "login.html")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}



	@RequestMapping(value = "register.html")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("register");
	}



	@RequestMapping(value = "detail.html")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("detail");
		String urlId = request.getParameter("urlId");
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		return modelAndView;
	}



	/**
	 * 这个是每一个gif页面暂时部分 <method description>
	 *
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "detailpicture.html")
	public ModelAndView detailPicture(HttpServletRequest request, HttpServletResponse response) {
		String parentId = request.getParameter("parentId");
		String urlId = request.getParameter("urlId");
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("detailpicture");
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		return modelAndView;
	}

	@RequestMapping(value="cartoon/{urlId}-{cartoonId}.html")
	public ModelAndView cartoon(@PathVariable String urlId,@PathVariable String cartoonId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("cartoon");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("cartoon",cartoonServiceImpl.getCartoon(cartoonId,cartoonServiceImpl.getMaxId()));
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		modelAndView.addObject("commonList",commonServiceImpl.getCartoonCommonByResourceId(cartoonId, urlId, null));
		modelAndView.addObject("id", urlId);
		return modelAndView;
	}
	
	@RequestMapping(value="virgin/{urlId}-{virginId}.html")
	public ModelAndView virgin(@PathVariable String urlId,@PathVariable String virginId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("virgin");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("virgin",cartoonServiceImpl.getVirgin(virginId, cartoonServiceImpl.getVirginMaxId()));
		modelAndView.addObject("commonList",commonServiceImpl.getCartoonCommonByResourceId(virginId, urlId, null));
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		modelAndView.addObject("id", urlId);
		return modelAndView;
	}
}
