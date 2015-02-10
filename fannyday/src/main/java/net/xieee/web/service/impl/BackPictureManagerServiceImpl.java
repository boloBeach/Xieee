package net.xieee.web.service.impl;

import org.springframework.stereotype.Repository;

import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.service.BackPictureManagerServiceInter;

@Repository
public class BackPictureManagerServiceImpl extends BaseServiceImpl implements BackPictureManagerServiceInter{

	public Pager getPagerByParentId(String currentPage, String parentId) {
		if(StringUtil.isNull(parentId)){
			return null;
		}
		
		Pager pager = new Pager();
		Integer currentPages = 1;
		if(!StringUtil.isNull(currentPage)){
			currentPages = Integer.valueOf(currentPage);
		}
		Object[] params = {parentId};
		// 获取totalRows
		String sqlRow = "select count(id) from parent_picture where catalog_id=?";
		Integer countInteger = getCount(sqlRow, params);
		if (StringUtil.isNull(countInteger)) {
			countInteger = 0;
		}
		pager.Pager(countInteger, Contants.picture_catalog_pagesize, currentPages);
		String sql = "select id,parent_picture_name,picture_url,is_delete,catalog_id from parent_picture where catalog_id=?";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

}
