package net.xieee.web.background;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.BackIndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/background")
public class BGPictureController {
	
	@Autowired
	private BackIndexServiceInter backIndexServiceImpl;
	@RequestMapping(value="showPicture.action")
	public ModelAndView showPicture(HttpServletRequest request,HttpServletResponse response){
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("menu/picturemenuindex");
		System.out.println(list.get(0).toString());
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
}
