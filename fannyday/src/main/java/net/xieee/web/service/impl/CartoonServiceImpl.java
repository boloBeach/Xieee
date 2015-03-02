package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import net.xieee.util.StringUtil;
import net.xieee.web.service.CartoonServiceInter;

import org.springframework.stereotype.Repository;

@Repository
public class CartoonServiceImpl extends BaseServiceImpl implements CartoonServiceInter  {

	public List getCartoon(String currentPage) {
		String sql = "select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = (select max(id) from cartoon where id < ? and is_delete=1) UNION select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = ? and is_delete=1 UNION select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = (select min(id) from cartoon where id > ? and is_delete=1)";
		Integer id = StringUtil.stringToInt(currentPage);
		if(id==0){
			String sqlId = "select max(id) as id from cartoon";
			Map map = (Map)getList(sqlId).get(0);
			id = StringUtil.stringToInt(map.get("id").toString());
		}
		Object[] params = {id,id,id};
		return findList(sql, params);
	}

}
