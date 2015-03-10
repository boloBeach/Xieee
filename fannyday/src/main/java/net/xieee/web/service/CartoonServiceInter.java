package net.xieee.web.service;

import java.util.List;

import net.xieee.util.Pager;

public interface CartoonServiceInter extends BaseServiceInter {
	/**
	 * 获取搞笑漫画两页数据，分别是上一页和下一页
	 * 
	 * @param currentPage
	 * @return
	 */
	public List getCartoon(String currentPage,int maxId);
	
	/**
	 * 获取cartoon的maxId值
	* <method description>
	*
	* @return
	 */
	public int getMaxId();



	/**
	 * 对漫画进行顶等操作 <method description>
	 *
	 * @param uriId
	 * @param spanCount
	 * @return
	 */
	public int likeResource(String uriId, String spanCount, String type);



	/**
	 * 获取无节操笑话，从内涵吧里面抓取的 <method description>
	 *
	 * @param currentPage
	 * @return
	 */
	//public List getVirgin(String currentPage);
}
