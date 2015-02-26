package net.xieee.web.service;

import java.util.List;

import net.xieee.util.Pager;
import net.xieee.web.bean.ParentPicture;
import net.xieee.web.bean.PictureBean;

public interface BackPictureManagerServiceInter extends BaseServiceInter {
	
	/**
	 * 通过parentId来获取分页信息
	 * @param currentPage 当前页
	 * @param parentId id值
	 * @return
	 */
	public Pager getPagerByParentId(String currentPage,String parentId);
	
	/**
	 * 通过id来获取 parentPicture
	 * @param id
	 * @return
	 */
	public ParentPicture getParentPictureById(String id);
	
	/**
	 * 更新parentPicture
	 * @param parentPicture
	 * @return
	 */
	public int updateParentPicture(ParentPicture parentPicture);
	
	/**
	 * 保持picture
	 * @param parentPicture
	 * @return
	 */
	public int saveParentPicture(ParentPicture parentPicture);
	
	/**
	 * 获取picture的pager
	 * @param currentPage
	 * @return
	 */
	public Pager getPicturePager(String currentPage);
	
	/**
	 * 通过catalogId来获取所有的信息
	 * @param parentCatalogId
	 * @return
	 */
	public List getPictureCatalog(String parentCatalogId);
	
	/**
	 * 发布图片
	 * @param pictureBean
	 * @return
	 */
	public int submitPicture(PictureBean pictureBean);
}
