package net.xieee.web.background;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.BackIndexServiceInter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/background")
public class BGPictureController {
	
	private final static Logger LOGGER = Logger.getLogger(BGPictureController.class);
	
	@Autowired
	private BackIndexServiceInter backIndexServiceImpl;
	
	@RequestMapping(value="showPicture.action")
	public ModelAndView showPicture(HttpServletRequest request,HttpServletResponse response){
		List<Catalog> list = backIndexServiceImpl.getCatalogByParentId(null);
		ModelAndView modelAndView = new ModelAndView("menu/picturemenuindex");
		modelAndView.addObject("catalogList", list);
		return modelAndView;
	}
	
	public void getCatalogInfo(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String parentId = request.getParameter("parentId");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(e.toString());
		}
		out.write("");
		out.close();
	}
}
