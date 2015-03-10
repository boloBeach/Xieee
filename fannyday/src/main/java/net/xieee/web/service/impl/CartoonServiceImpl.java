package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import net.xieee.util.StringUtil;
import net.xieee.web.service.CartoonServiceInter;

import org.springframework.stereotype.Repository;

@Repository
public class CartoonServiceImpl extends BaseServiceImpl implements CartoonServiceInter  {

	public List getCartoon(String currentPage,int maxId) {
		String sql = "select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = ? and is_delete=1  union select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = (select max(id) from cartoon where id < ? and is_delete=1) UNION select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url,down_count,top_count,old_cartoon,modify_time from cartoon where id = (select min(id) from cartoon where id > ? and is_delete=1)";
		Integer id = StringUtil.stringToInt(currentPage);
		if(id==0){
			id = maxId;
		}
		Object[] params = {id,id,id};
		return findList(sql, params);
	}

	public int likeResource(String pUriId, String pSpanCount, String pType) {
		// good is top_count
		// bad is down_count
		// old is old_cartoon
		String updateSql = null;
		if(StringUtil.isNull(pType) || pType.trim().equals("good")){
			updateSql = "update cartoon set top_count=top_count+1 where id=?";
		}else if (pType.trim().equals("bad")) {
			updateSql = "update cartoon set down_count=down_count+1 where id=?";
		}else if (pType.trim().equals("old")) {
			updateSql = "update cartoon set old_cartoon=old_cartoon+1 where id=?";
		}else {
			updateSql = "update cartoon set top_count=top_count+1 where id=?";
		}
		Object[] params = {pUriId};
		return update(updateSql, params);
	}

	
	public int getMaxId() {
		String sqlId = "select max(id) as id from cartoon";
		Map map = (Map)getList(sqlId).get(0);
		return StringUtil.stringToInt(map.get("id").toString());
	}

}
