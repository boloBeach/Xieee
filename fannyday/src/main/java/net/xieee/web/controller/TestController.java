package net.xieee.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.xieee.web.bean.Catalog;
import net.xieee.web.service.CartoonServiceInter;
import net.xieee.web.service.IndexServiceInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@Autowired
	private IndexServiceInter indexServiceImpl;
	@Autowired
	private CartoonServiceInter cartoonServiceImpl;
	@RequestMapping(value="cartoon/{urlId}/{cartoonId}.html")
	public ModelAndView Test(@PathVariable String urlId,@PathVariable String cartoonId,HttpServletResponse response,HttpServletRequest request) throws Exception{
		System.out.println(urlId+":"+cartoonId);
		List<Catalog> list = indexServiceImpl.getCatalogByParentId(null);
		request.setAttribute("catalogList", list);
		String fileName = urlId+"-"+cartoonId+".html";
		request.setAttribute("tag",indexServiceImpl.getTag());
		request.setAttribute("randPicture", indexServiceImpl.randPicture(urlId,null));
		request.setAttribute("randCartoon",indexServiceImpl.randCartoon());
		HashMap<String, Object> root = new HashMap<String, Object>();
		ModelAndView modelAndView = new ModelAndView("cartoon/"+urlId+"-"+cartoonId);
		/*if(FreemarkertUtil.checkCartoonExist(fileName, request.getServletContext())){
			System.out.println("存在");
		}else {
			System.err.println("不存在，则创建一个html");
			root.put("tag",indexServiceImpl.getTag());
			root.put("catalogList", list);
			root.put("cartoon",cartoonServiceImpl.getCartoon(cartoonId,cartoonServiceImpl.getMaxId()));
			root.put("randCartoon",indexServiceImpl.randCartoon());
			root.put("id","1");
			//ProcessClient.processCartoon(fileName, root,request.getServletContext());
		}*/
		return modelAndView;
	}
}
