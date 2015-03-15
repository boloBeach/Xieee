package net.xieee.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.service.CartoonServiceInter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

@Controller
public class CartoonController {
	@Autowired
	private CartoonServiceInter cartoonServiceImpl;
	private static final Logger LOGGER = Logger.getLogger(CartoonController.class);
	@RequestMapping(value="likeResource.html",method=RequestMethod.POST)
	public void likeResource(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String urlId = request.getParameter("urlId");
		String type = request.getParameter("type");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(e.toString());
		}
		out.write(cartoonServiceImpl.likeResource(urlId, type)+"");
		Gson gson = new Gson();
		out.close();
	}
	
	@RequestMapping(value="likePicture.html")
	public void likePicture(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String urlId = request.getParameter("urlId");
		String type = request.getParameter("type");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(e.toString());
		}
		out.write(cartoonServiceImpl.likePicture(urlId, type)+"");
		Gson gson = new Gson();
		out.close();
	}
	
	@RequestMapping(value="commonTop.html")
	public void commonTop(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		String commonId = request.getParameter("commonId");
		String type = request.getParameter("type");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(e.toString());
		}
		out.write(cartoonServiceImpl.commonTop(commonId, type)+"");
		Gson gson = new Gson();
		out.close();
	}
}
