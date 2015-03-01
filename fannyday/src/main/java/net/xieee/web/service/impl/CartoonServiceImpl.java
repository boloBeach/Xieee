package net.xieee.web.service.impl;

import org.springframework.stereotype.Repository;

import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.service.CartoonServiceInter;

@Repository
public class CartoonServiceImpl extends BaseServiceImpl implements CartoonServiceInter  {

	public Pager getCartoon(String currentPage) {
		Pager pager = new Pager();
		Integer currentPages = 1;
		if(!StringUtil.isNull(currentPage)){
			currentPages = Integer.valueOf(currentPage);
		}
		Object[] params = {1};
		// 获取totalRows
		String sqlRow = "select count(id) from cartoon where is_delete=1";
		Integer countInteger = getCount(sqlRow, null);
		if (StringUtil.isNull(countInteger)) {
			countInteger = 0;
		}
		pager.Pager(countInteger, Contants.cartoon_picture_pagesize, currentPages);
		String sql = "select id,cartoon_name,cartoon_title,cartoon_user_name,cartoon_detail,image_height,image_width,cartoon_local_url from cartoon where is_delete=? order by modify_time";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

}
