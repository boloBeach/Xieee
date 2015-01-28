package net.xieee.web.service;

import java.util.List;

import net.xieee.web.bean.Catalog;


public interface IndexServiceInter extends BaseServiceInter {
	/**
	 * 通过parent_catalog_id获取list的菜单信息
	 * @param parent_catalog_id 父类菜单的id值
	 * @return
	 */
	public List<Catalog> getCatalogByParentId(String parent_catalog_id);
}