package net.xieee.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Contact;
import net.xieee.web.service.ContactServiceInter;
import net.xieee.web.service.impl.ContactServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {
	@Autowired
	private ContactServiceInter contactServiceImpl;
	
	@RequestMapping(value="contact")
	public ModelAndView contact(HttpServletRequest request,HttpServletResponse response){
		Contact contact = contactServiceImpl.getContact();
		ModelAndView modelAndView = new ModelAndView("contact");
		if(!StringUtil.isNull(contact)){
			modelAndView.addObject("contact", contact);
		}
		return modelAndView;
	}
}
