package net.xieee.web.service;

import net.xieee.util.Pager;
import net.xieee.web.bean.ParentPicture;

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
}
