package net.xieee.web.background;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.BackIndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/background")
public class BGMenuController {
	@Autowired
	private BackIndexServiceInter backIndexServiceImpl;
	@RequestMapping("menuIndex.action")
	public ModelAndView menuManager(HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView = new ModelAndView("/menu/index");
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalog", list);
		return modelAndView;
	}
	
	@RequestMapping(value="menuEditShow.action")
	public ModelAndView menuEditShow(HttpServletRequest request,HttpServletResponse response){
		String catalogId = request.getParameter("id");
		Catalog catalog = backIndexServiceImpl.getCatalogById(catalogId);
		ModelAndView modelAndView = new ModelAndView("/menu/edit");
		modelAndView.addObject("catalog", catalog);
		return modelAndView;
	}
	
	// 这个方法只需要接受post请求
	@RequestMapping(value="updateMenu.action",method=RequestMethod.POST)
	public ModelAndView updateMenu(HttpServletRequest request,HttpServletResponse response,Catalog catalog){
		ModelMap map = new ModelMap();
		backIndexServiceImpl.updateCatalog(catalog);
		map.addAttribute("id", catalog.getId());
		ModelAndView modelAndView = new ModelAndView("redirect:menuEditShow.action",map);
		return modelAndView;
	}
	
	@RequestMapping(value="addshow.action")
	public ModelAndView addMenuShow(HttpServletRequest request,HttpServletResponse response){
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("/menu/add");
		modelAndView.addObject("catalog", list);
		return modelAndView;
	}
	
	@RequestMapping(value="addMenu.action",method=RequestMethod.POST)
	public ModelAndView addMenu(HttpServletRequest request,HttpServletResponse response,Catalog catalog){
		backIndexServiceImpl.saveCatalog(catalog);
		ModelAndView modelAndView = new ModelAndView("redirect:addshow.action");
		return modelAndView;
	}
	
}
