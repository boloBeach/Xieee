package net.xieee.web.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.ParentPicture;
import net.xieee.web.bean.PictureBean;
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

	public ParentPicture getParentPictureById(String id) {
		if(StringUtil.isNull(id))
			return null;
		String sql = "select id,parent_picture_name,detail,skim_count,catalog_id,is_delete from parent_picture where id=?";
		Object[] params = {id};
		List list = findList(sql, params);
		if (StringUtil.isNull(list) || list.size()==0) {
			return null;
		}
		ParentPicture parentPicture = new ParentPicture();
		Map map = (Map)list.get(0);
		parentPicture.setId((Integer)map.get("id"));
		parentPicture.setDetail((String)map.get("detail"));
		parentPicture.setParent_picture_name((String)map.get("parent_picture_name"));
		parentPicture.setSkim_count((Integer)map.get("skim_count"));
		parentPicture.setCatalog_id((Integer)map.get("catalog_id"));
		parentPicture.setIs_delete((String)map.get("is_delete"));
		return parentPicture;
	}

	public int updateParentPicture(ParentPicture parentPicture) {
		if(StringUtil.isNull(parentPicture))
			return 0;
		String sql = "update parent_picture set parent_picture_name=?,detail=?,skim_count=? where id=?";
		Object[] params = {parentPicture.getParent_picture_name(),parentPicture.getDetail(),parentPicture.getSkim_count(),parentPicture.getId()};
		return update(sql, params);
	}

	public int saveParentPicture(ParentPicture parentPicture) {
		if(StringUtil.isNull(parentPicture)){
			return 0;
		}
		String sql = "insert into parent_picture(parent_picture_name,detail,catalog_id,skim_count,is_delete) values(?,?,?,?,?)";
		Object[] params = {parentPicture.getParent_picture_name(),parentPicture.getDetail(),parentPicture.getCatalog_id(),parentPicture.getSkim_count(),parentPicture.getIs_delete()};
		return save(sql, params);
	}

	
	public Pager getPicturePager(String currentPage) {
		
		Pager pager = new Pager();
		Integer currentPages = 1;
		if(!StringUtil.isNull(currentPage)){
			currentPages = Integer.valueOf(currentPage);
		}
		Object[] params = {1};
		// 获取totalRows
		String sqlRow = "select count(id) from picture where parent_picture is null";
		Integer countInteger = getCount(sqlRow, null);
		if (StringUtil.isNull(countInteger)) {
			countInteger = 0;
		}
		pager.Pager(countInteger, Contants.picture_catalog_pagesize, currentPages);
		String sql = "select id,local_url,detail,is_delete from picture where is_delete=? and parent_picture is null";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

	public List getPictureCatalog(String parentCatalogId) {
		if(StringUtil.isNull(parentCatalogId)){
			return null;
		}
		String sql = "select id,parent_picture_name from parent_picture where catalog_id=? and is_delete=? ORDER BY modify_time desc";
		Object[] params = {parentCatalogId,1};
		return findList(sql, params);
	}

	public int submitPicture(PictureBean pictureBean) {
		int result = 0;
		if(StringUtil.isNull(pictureBean)){
			return result;
		}
		if(StringUtil.isNull(pictureBean.getParentOneId()) && StringUtil.isNull(pictureBean.getParentTwoId())){
			return result;
		}
		String parentId = pictureBean.getParentTwoId();
		if(StringUtil.isNull(parentId)){
			parentId = pictureBean.getParentOneId();
		}
		// 同时需要更新
		
		String sql = "update picture set parent_picture=?,is_delete=? where id in ("+Arrays.toString(pictureBean.getPictureIds()).replace("]", "").replace("[", "")+")";
		Object[] params = {parentId,pictureBean.getTypes()};
		return update(sql, params);
	}
}
