package net.xieee.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.spider.util.Constants;
import net.xieee.util.StringUtil;
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
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		return modelAndView;
	}



	/**
	 * 这个是每一个gif页面暂时部分 <method description>
	 *
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "detail/{urlId}/{parentId}/picture_{currentPage}.html")
	public ModelAndView detailPicture(@PathVariable String parentId,@PathVariable String urlId,@PathVariable String currentPage,HttpServletRequest request, HttpServletResponse response) {
		// 获取一级菜单
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("detailpicture");
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		return modelAndView;
	}

	@RequestMapping(value="cartoon/{urlId}-{cartoonId}.html")
	public ModelAndView cartoon(@PathVariable String urlId,@PathVariable String cartoonId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("cartoon");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		String currentPage = request.getParameter("currentPage");
		int maxId = cartoonServiceImpl.getMaxId();
		if(StringUtil.stringToInt(cartoonId)==0){
			cartoonId = maxId+"";
		}
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("cartoon",cartoonServiceImpl.getCartoon(cartoonId,maxId));
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		int commontRows = commonServiceImpl.getCommontRowsById(urlId, cartoonId);
		modelAndView.addObject("commontRows",commontRows);
		modelAndView.addObject("commonList",commonServiceImpl.getCartoonCommonByResourceId(cartoonId,commontRows, urlId, currentPage));
		modelAndView.addObject("id", urlId);
		return modelAndView;
	}
	
	@RequestMapping(value="virgin/{urlId}-{virginId}.html")
	public ModelAndView virgin(@PathVariable String urlId,@PathVariable String virginId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("virgin");
		String currentPage = request.getParameter("currentPage");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		int maxId = cartoonServiceImpl.getVirginMaxId();
		if(StringUtil.stringToInt(virginId)==0){
			virginId = maxId+"";
		}
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		modelAndView.addObject("virgin",cartoonServiceImpl.getVirgin(virginId,maxId,Constants.key_word ));
		int commontRows = commonServiceImpl.getCommontRowsById(urlId, virginId);
		modelAndView.addObject("commontRows",commontRows);
		modelAndView.addObject("commonList",commonServiceImpl.getCartoonCommonByResourceId(virginId, commontRows,urlId, currentPage));
		modelAndView.addObject("id", urlId);
		return modelAndView;
	}
	
	@RequestMapping(value="ps/{urlId}-{psId}.html")
	public ModelAndView ps(@PathVariable String urlId,@PathVariable String psId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("ps");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		String currentPage = request.getParameter("currentPage");
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		int maxId = cartoonServiceImpl.getPsMaxId();
		modelAndView.addObject("newcommontList", indexServiceImpl.getNewCommontList());
		if(StringUtil.stringToInt(psId)==0){
			psId = maxId+"";
		}
		modelAndView.addObject("virgin",cartoonServiceImpl.getVirgin(psId,maxId,Constants.ps_key_word));
		int commontRows = commonServiceImpl.getCommontRowsById(urlId, psId);
		modelAndView.addObject("commontRows",commontRows);
		modelAndView.addObject("commonList",commonServiceImpl.getCartoonCommonByResourceId(psId,commontRows, urlId, currentPage));
		modelAndView.addObject("id", urlId);
		return modelAndView;
	}
	
	@RequestMapping(value="gadreplay/{urlId}_{currentPage}.html")
	public ModelAndView gadReplay(@PathVariable String urlId,@PathVariable String currentPage,HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("gadReplay");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		return modelAndView;
	}
}
