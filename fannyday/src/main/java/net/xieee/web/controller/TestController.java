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

@Controller
public class TestController {
	@Autowired
	private IndexServiceInter indexServiceImpl;
	
	@RequestMapping(value="test.html")
	public ModelAndView Test(HttpServletResponse response,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("Test");
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		modelAndView.addObject("tag",indexServiceImpl.getTag());
		System.out.println(indexServiceImpl.randPicture(null,null).size());
		modelAndView.addObject("randPicture", indexServiceImpl.randPicture(null,null));
		modelAndView.addObject("randCartoon",indexServiceImpl.randCartoon());
		modelAndView.addObject("name","roy");
		return modelAndView ;
	}
}
