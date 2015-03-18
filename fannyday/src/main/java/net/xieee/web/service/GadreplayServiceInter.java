package net.xieee.web.service;

import net.xieee.util.Pager;

public interface GadreplayServiceInter extends BaseServiceInter {
	/**
	 * 获取6条神回复
	 * @param currentPage 当前页
	 * @param rows 神回复的条数
	 * @return Pager {@link Pager}
	 */
	public Pager getGadReplay(String currentPage,int rows);
	
	/**
	 * 获取神回复的条数
	 * @return java.lang.int 条数
	 */
	public int getGadRows();
}
