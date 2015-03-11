package net.xieee.web.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.service.CommonServerInter;

@Repository
public class CommonServiceImpl extends BaseServiceImpl implements CommonServerInter{

	@Override
	public Pager getCartoonCommonByResourceId(String pResourceId, String pCatalogId,String currentPage) {
		if(StringUtil.isNull(pCatalogId) || StringUtil.isNull(pResourceId)){
			return null;
		}
		Pager pager = new Pager();
		Integer currentPages = 1;
		if(!StringUtil.isNull(currentPage)){
			currentPages = Integer.valueOf(currentPage);
		}
		Object[] params = {pResourceId,pCatalogId};
		// 获取totalRows
		String sqlRow = "select count(id) from commont where resource_id=? and catalogId=?";
		Integer countInteger = getCount(sqlRow, params);
		if (StringUtil.isNull(countInteger)) {
			countInteger = 0;
		}
		pager.Pager(countInteger, Contants.commont_pagesize, currentPages);
		String sql = "select id,resource_id,user_id,is_delete,catalogId,address,content,top_count,down_count,modify_time from commont where resource_id=? and catalogId=? and is_delete=1";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

	@Override
	public int saveCommont(String userName,String pCatalogId, String pResourceId, String pIp, String pIpaddress, String pContent) {
		if(StringUtil.isNull(pCatalogId) || StringUtil.stringToInt(pCatalogId)==0 || StringUtil.isNull(pResourceId) || StringUtil.stringToInt(pResourceId)==0 ){
			return -1;
		}
		if(StringUtil.isNull(pContent)){
			return 0;
		}
		String sql = "insert into commont(user_id,resource_id,ip,address,content,catalogId) values(?,?,?,?,?,?)";
		Object[] params={userName,pResourceId,pIp,pIpaddress,pContent,pCatalogId};
		return save(sql, params);
	}

}
