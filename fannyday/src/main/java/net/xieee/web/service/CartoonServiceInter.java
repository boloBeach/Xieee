package net.xieee.web.service;

import java.util.List;

import net.xieee.util.Pager;

public interface CartoonServiceInter extends BaseServiceInter {
	/**
	 * 获取两页数据，分别是上一页和下一页
	 * @param currentPage
	 * @return
	 */
	public List getCartoon(String currentPage);
}
