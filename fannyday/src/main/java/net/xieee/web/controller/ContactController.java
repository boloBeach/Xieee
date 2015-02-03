package net.xieee.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.Contact;
import net.xieee.web.service.ContactServiceInter;
import net.xieee.web.service.IndexServiceInter;
import net.xieee.web.service.impl.ContactServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

@Controller
public class ContactController {
	@Autowired
	private ContactServiceInter contactServiceImpl;
	@Autowired
	private IndexServiceInter indexServiceImpl;
	
	@RequestMapping(value="contact.html")
	public ModelAndView contact(HttpServletRequest request,HttpServletResponse response){
		Contact contact = contactServiceImpl.getContact();
		ModelAndView modelAndView = new ModelAndView("contact");
		if(!StringUtil.isNull(contact)){
			modelAndView.addObject("contact", contact);
			String urlId = request.getParameter("urlId");
			// 获取一级菜单
			List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
			modelAndView.addObject("catalogList", list);
		}
		return modelAndView;
	}
}
