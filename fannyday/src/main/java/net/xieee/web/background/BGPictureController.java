package net.xieee.web.background;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.util.Pager;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.ParentPicture;
import net.xieee.web.service.BackIndexServiceInter;
import net.xieee.web.service.BackPictureManagerServiceInter;
import net.xieee.web.service.impl.BackPictureManagerServiceImpl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sun.swing.internal.plaf.metal.resources.metal;

@Controller
@RequestMapping(value="/background")
public class BGPictureController {
	
	private final static Logger LOGGER = Logger.getLogger(BGPictureController.class);
	
	@Autowired
	private BackIndexServiceInter backIndexServiceImpl;
	
	@Autowired
	private BackPictureManagerServiceInter backPictureManagerServiceImpl;
	
	@RequestMapping(value="showPicture.action")
	public ModelAndView showPicture(HttpServletRequest request,HttpServletResponse response){
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("menu/picturemenuindex");
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
	
	@RequestMapping(value="getCatalogInfo.action",method=RequestMethod.POST)
	public void getCatalogInfo(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String parentId = request.getParameter("parentId");
		String currentPage = request.getParameter("currentPage");
		Pager pager = backPictureManagerServiceImpl.getPagerByParentId(currentPage, parentId);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(e.toString());
		}
		Gson gson = new Gson();
		out.write(gson.toJson(pager));
		out.close();
	}
	
	@RequestMapping(value="editPicture.action")
	public ModelAndView editPicture(HttpServletRequest request,HttpServletResponse response){	
		String id = request.getParameter("id");
		ParentPicture parentPicture = backPictureManagerServiceImpl.getParentPictureById(id);
		ModelAndView modelAndView = new ModelAndView("menu/pictureEdit");
		modelAndView.addObject("parentPicture",parentPicture);
		return modelAndView;
	}
	
	@RequestMapping(value="updatePicture.action")
	public ModelAndView updatePicture(HttpServletRequest request,HttpServletResponse response,ParentPicture parentPicture){
		ModelAndView modelAndView = null;
		backPictureManagerServiceImpl.updateParentPicture(parentPicture);
		ModelMap map = new ModelMap("id", parentPicture.getId());
		modelAndView =  new ModelAndView("redirect:editPicture.action",map);
		return modelAndView;
	}
	
	@RequestMapping(value="showPictureIndex.action")
	public ModelAndView showPictureIndex(HttpServletResponse response,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("picture/index");
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
}
