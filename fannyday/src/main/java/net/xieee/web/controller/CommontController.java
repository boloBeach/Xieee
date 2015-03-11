package net.xieee.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.soap.Addressing;

import net.xieee.util.Contants;
import net.xieee.util.StringUtil;
import net.xieee.web.service.CommonServerInter;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

/**
 * 评论内容控制器
 * <class description>
 *
 * @author: royzhang
 * @version: 1.0, 2015年3月11日
 */
@Controller
public class CommontController {
	@Autowired
	private CommonServerInter commonServerImpl;
	
	private final static Logger logger = Logger.getLogger(CommontController.class);
	@RequestMapping(value="saveCommont.html")
	public void saveCommont(HttpServletRequest request,HttpServletResponse response){
		String checkCode = request.getParameter("checkCode");
		String content = request.getParameter("content");
		String ip = request.getParameter("ip");
		String ipaddress = request.getParameter("ipaddress");
		String catalogId = request.getParameter("catalogId");
		String cartoonId = request.getParameter("cartoonId");
		String userName = request.getParameter("userName");
		response.setContentType("text/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		HttpSession session = request.getSession();
		Object randCode = session.getAttribute(Contants.RANDOMCODEKEY);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(e.toString());
		}
		// 应该检查checkCode
		if(!StringUtil.isNull(checkCode) && !StringUtil.isNull(randCode) && checkCode.toLowerCase().equals(randCode.toString().toLowerCase())){
			System.out.println(commonServerImpl.saveCommont(userName, catalogId, cartoonId, ip, ipaddress, content));
			out.write("1");
		}else {
			// -2 表示验证码错误
			out.write("-2");
		}
		out.close();
	}
}
