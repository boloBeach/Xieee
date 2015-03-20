package net.xieee.web.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.xieee.spider.util.Constants;
import net.xieee.util.Contants;
import net.xieee.util.Pager;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.ParentPicture;
import net.xieee.web.service.IndexServiceInter;

import org.springframework.stereotype.Repository;

import sun.print.resources.serviceui;


@Repository
public class IndexServiceImpl<T> extends BaseServiceImpl<T> implements
		IndexServiceInter {

	public List<Catalog> getCatalogByParentId(String parent_catalog_id) {
		List<Catalog> result = new ArrayList<Catalog>();
		if (StringUtil.isNull(parent_catalog_id)) {
			parent_catalog_id = "0";
		}
		String sql = "select id,name,parent_catalog_id,url from catalog where parent_catalog_id=? and is_delete=?";
		Object[] params = { parent_catalog_id, 1 };
		List<Map<String, Object>> mapList = getList(sql, params);
		if(mapList == null || mapList.size()==0){
			return null;
		}
		String key = null;
		for (Map<String, Object> map : mapList) {
			Catalog catalog = new Catalog();
			for (Map.Entry<String,Object> entry : map.entrySet()) {
				key = entry.getKey();
				if(key.equals("id")){
					catalog.setId((Integer)map.get(key));
				}
				
				if(key.equals("name")){
					catalog.setName((String)map.get(key));
				}
				
				if(key.equals("parent_catalog_id")){
					catalog.setParent_catalog_id((Integer)map.get(key));
				}
				
				if(key.equals("url")){
					catalog.setUrl((String)map.get(key));
				}
			}
			result.add(catalog);
		}
		
		return result;
	}

	public List<ParentPicture> getParentPictures(String urlId,
			Integer pageSize, Integer types) {
		if(StringUtil.isNull(urlId)){
			return null;
		}
		if(StringUtil.isNull(pageSize)){
			pageSize = Constants.index_pageSize;
		}
		
		if(StringUtil.isNull(types)){
			types = Constants.index_types;
		}
		// 等下在修改。
		String sql = "select id,parent_picture_name,detail,modify_time,";
		
		
		return null;
	}

	public List randPicture(String urlId,String type) {
		String sql = null;
		if(StringUtil.isNull(type) || type.equals("heat")){
			if(StringUtil.isNull(urlId)|| StringUtil.stringToInt(urlId)==1 || StringUtil.stringToInt(urlId)==0 ){
				sql = "select id,parent_picture_name,picture_url,detail from parent_picture where is_delete=?  order by skim_count DESC limit 18";
				Object[] params = {1};
				return findList(sql, params);
			}else {
				sql = "select id,parent_picture_name,picture_url,detail from parent_picture where is_delete=? and catalog_id=?  order by skim_count DESC limit 18";
				Object[] params = {1,StringUtil.stringToInt(urlId)};
				return findList(sql, params);
			}
		}else {
			if(StringUtil.isNull(urlId)|| StringUtil.stringToInt(urlId)==1 || StringUtil.stringToInt(urlId)==0 ){
				sql = "select id,parent_picture_name,picture_url,detail from parent_picture where is_delete=?  order by modify_time DESC limit 18";
				Object[] params = {1};
				return findList(sql, params);
			}else {
				sql = "select id,parent_picture_name,picture_url,detail from parent_picture where is_delete=? and catalog_id=?  order by modify_time DESC limit 18";
				Object[] params = {1,StringUtil.stringToInt(urlId)};
				return findList(sql, params);
			}
		}
	}

	public List getTag() {
		String sql = "select tag_name,id from tag where is_delete=?";
		Object[] params = {1};
		return findList(sql, params);
	}

	public List randCartoon() {
		String sql = "SELECT id,cartoon_title FROM cartoon ORDER BY RAND() limit "+Constants.rand_cartoon_count+" ";
		return findList(sql, null);
	}

	@Override
	public List getNewCommontList() {
		String sql ="select id,user_id,resource_id,address,content,catalogId,modify_time from commont where is_delete=1 order by id desc limit 4";
		return findList(sql, null);
	}

	@Override
	public Pager getGifPicture(String parentId, String currentPage) {
		if(StringUtil.isNull(parentId)){
			return null;
		}
		Pager pager = new Pager();
		Integer currentPages = StringUtil.stringToInt(currentPage);
		if(currentPages==0){
			currentPages = 1;
		}
		Object[] params = {parentId};
		pager.Pager(getRowsGif(parentId), Constants.detailt_picture_size, currentPages);
		String sql = "select id,height,width,detail,author,top_count,down_count,old_picture,modify_time,title,local_url from picture where parent_picture =? and  is_delete=1";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

	@Override
	public int getRowsGif(String parentId) {
		if(StringUtil.isNull(parentId)){
			return 0;
		}
		String sql ="select count(id) from picture where parent_picture=? and is_delete=1";
		Object[] params = {parentId};
		return getCount(sql, params);
	}

	@Override
	public Pager getIndexPictureDetail(String pParentId, String pCurrentPages, int pRows) {
		if(StringUtil.isNull(pParentId)){
			return null;
		}
		Pager pager = new Pager();
		Integer currentPages = StringUtil.stringToInt(pCurrentPages);
		if(currentPages==0){
			currentPages = 1;
		}
		Object[] params = {pParentId};
		pager.Pager(pRows, Constants.detailt_picture_size, currentPages);
		String sql = "select id,height,width,detail,author,top_count,down_count,old_picture,modify_time,title,local_url,local_url_small from picture where parent_picture =? and  is_delete=1";
		pager =  findBypager(sql, pager, params);
		return pager;
	}

	@Override
	public int getIndexPictureDetailRows(String pParentId) {
		if(!StringUtil.isNull(pParentId)){
			String sql = "select count(id) from picture where is_delete=1 and parent_picture=?";
			Object[] params = {pParentId};
			return getCount(sql, params);
		}
		return 0;
	}

	@Override
	public ParentPicture getParentPictureById(String pParentId) {
		if(!StringUtil.isNull(pParentId)){
			String sql = "select parent_picture_name, detail,id from parent_picture where id=?";
			Object[] params = {pParentId};
			List list = getList(sql, params);
			if(list!=null && !list.isEmpty()){
				Map map = (Map)list.get(0);
				ParentPicture parentPicture = new ParentPicture();
				parentPicture.setId((Integer)map.get("id"));
				parentPicture.setParent_picture_name((String)map.get("parent_picture_name"));
				parentPicture.setDetail((String)map.get("detail"));
				return parentPicture;
			}
		}
		return null;
	}

}
