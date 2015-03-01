package net.xieee.web.service.impl;

import java.util.List;

import net.xieee.util.StringUtil;
import net.xieee.web.service.CartoonServiceInter;

import org.springframework.stereotype.Repository;

@Repository
public class CartoonServiceImpl extends BaseServiceImpl implements CartoonServiceInter  {

	public List getCartoon(String currentPage) {
		String sql = "select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url from cartoon where id>=? and  is_delete=?  order by id desc limit 3";
		Object[] params = {StringUtil.stringToInt(currentPage),1};
		return findList(sql, params);
	}

}
