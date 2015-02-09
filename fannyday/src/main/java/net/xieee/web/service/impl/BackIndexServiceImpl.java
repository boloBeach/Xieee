package net.xieee.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.xieee.util.MD5;
import net.xieee.util.StringUtil;
import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.Users;
import net.xieee.web.service.BackIndexServiceInter;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.sun.accessibility.internal.resources.accessibility;

@Repository
public class BackIndexServiceImpl<T> extends BaseServiceImpl<T> implements BackIndexServiceInter{
	private final static Logger LOGGER = Logger.getLogger(BackIndexServiceImpl.class);
	public int checkAdmin(Users users) {
		if(StringUtil.isNull(users)){
			return 0;
		}
		String sql = "select user_password from users where is_delete=? and role=? and email=?";
		Object[] params = {1,2,users.getEmail()};
		List<Map<String, Object>> list = getList(sql, params);
		if(StringUtil.isNull(list)){
			return -1;
		}
		
		Object password = list.get(0).get("user_password");
		if(StringUtil.isNull(password)){
			LOGGER.equals("email:"+users.getEmail()+"的用户登录失败 ，因为密码为空！");
			return -2;
		}
		
		if(password.equals(MD5.GetMD5Code(users.getUser_password()))){
			LOGGER.warn("email:"+users.getEmail()+"的用户登录后台");
			return 1;
		}
		
		return -3;
	}
	public List<Catalog> getCatalogByParentId(String parent_catalog_id) {
		List<Catalog> result = new ArrayList<Catalog>();
		if (StringUtil.isNull(parent_catalog_id)) {
			parent_catalog_id = "0";
		}
		String sql = "select id,name,parent_catalog_id,url,is_delete from catalog where parent_catalog_id=?";
		Object[] params = { parent_catalog_id};
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
				
				if(key.equals("is_delete")){
					catalog.setIs_delete((String)map.get(key));
				}
			}
			result.add(catalog);
		}
		
		return result;
	}
	public Catalog getCatalogById(String catalog_id) {
		if(StringUtil.isNull(catalog_id)){
			return null;
		}
		String sql = "select url,is_delete,id,name,parent_catalog_id from catalog where id=?";
		Object[] params = {catalog_id};
		List<Map<String, Object>> list = getList(sql, params);
		if(list!=null){
			Map map = list.get(0);
			Catalog catalog = new Catalog();
			catalog.setId((Integer)map.get("id"));
			catalog.setParent_catalog_id((Integer)map.get("parent_catalog_id"));
			catalog.setIs_delete((String)map.get("is_delete"));
			catalog.setName((String)map.get("name"));
			catalog.setUrl((String)map.get("url"));
			return catalog;
		}
		return null;
	}
	
	public int updateCatalog(Catalog catalog) {
		String sql = "update catalog set name=?,url=?,is_delete=? where id=?";
		if(StringUtil.isNull(catalog) || StringUtil.isNull(catalog.getId())){
			return 0;
		}
		Object[] params = {catalog.getName(),catalog.getUrl(),catalog.getIs_delete(),catalog.getId()};
		return save(sql, params);
	}
	
	public int saveCatalog(Catalog catalog) {
		
		String sql = "insert into catalog(name,parent_catalog_id,url,is_delete) values(?,?,?,?)";
		if(StringUtil.isNull(catalog) || StringUtil.isNull(catalog.getParent_catalog_id())){
			return 0;
		}
		Object[] params = {catalog.getName(),catalog.getParent_catalog_id(),catalog.getUrl(),catalog.getIs_delete()};
		return save(sql, params);
	}
}
