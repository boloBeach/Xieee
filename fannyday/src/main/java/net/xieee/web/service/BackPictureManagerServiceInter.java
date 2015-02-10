package net.xieee.web.service;

import net.xieee.util.Pager;

public interface BackPictureManagerServiceInter extends BaseServiceInter {
	
	/**
	 * 通过parentId来获取分页信息
	 * @param currentPage 当前页
	 * @param parentId id值
	 * @return
	 */
	public Pager getPagerByParentId(String currentPage,String parentId);
}
