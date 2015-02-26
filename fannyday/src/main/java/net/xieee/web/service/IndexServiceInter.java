package net.xieee.web.service;

import java.util.List;

import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.ParentPicture;


public interface IndexServiceInter extends BaseServiceInter {
	/**
	 * 通过parent_catalog_id获取list的菜单信息
	 * @param parent_catalog_id 父类菜单的id值
	 * @return
	 */
	public List<Catalog> getCatalogByParentId(String parent_catalog_id);
	
	/**
	 * 通过catalog的ID 来获取对应的catalogId的所有的图片获取其他的信息
	 * @param urlId catalogId值
	 * @param pageSize 用户显示多少条记录
	 * @param types 类型，有按照时间类型，还有按照热度
	 * @return 返回一个list<parentPicture>
	 */
	public List<ParentPicture> getParentPictures(String urlId,Integer pageSize,Integer types);
	
	/**
	 * 获取9个随机的图片
	 * @return
	 */
	public List randPicture();
	
	/**
	 * 随机的获取9个gif
	 * @return
	 */
	public List randGifPicture();
}