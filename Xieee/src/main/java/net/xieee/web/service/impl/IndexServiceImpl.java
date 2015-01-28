package net.xieee.web.service.impl;

import java.util.List;

import net.xieee.util.StringUtil;
import net.xieee.web.bean.Catalog;
import net.xieee.web.service.IndexServiceInter;

import org.springframework.stereotype.Repository;


@Repository
public class IndexServiceImpl<T> extends BaseServiceImpl<T> implements
		IndexServiceInter {

	public List<Catalog> getCatalogByParentId(String parent_catalog_id) {
		if (StringUtil.isNull(parent_catalog_id)) {
			parent_catalog_id = "0";
		}
		String sql = "select id,name,parent_catalog_id,url from catalog where parent_catalog_id=? and is_delete=?";
		Object[] params = { parent_catalog_id, 1 };
		return (List<Catalog>) getListByClass(sql, Catalog.class, params);
	}

}
