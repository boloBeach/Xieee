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
	public List getCartoon(String currentPage, int maxId);



	/**
	 * 获取cartoon的maxId值 <method description>
	 *
	 * @return
	 */
	public int getMaxId();



	/**
	 * 获取节操笑话的三个信息 <method description>
	 *
	 * @param currentId
	 * @param maxId
	 * @return
	 */
	public List getVirgin(String currentId, int maxId);



	/**
	 * 获取节操笑话的最大的id值，也就是说是最新的 <method description>
	 *
	 * @return
	 */
	public int getVirginMaxId();



	/**
	 * 对漫画进行顶等操作 <method description>
	 *
	 * @param urlId
	 *            漫画的id值
	 * @return
	 */
	public int likeResource(String urlId, String type);



	/**
	 * 
	 * <method description>
	 *	对评论进行顶的操作
	 * @param commonId 评论的id
	 * @param type  类型
	 * @return -1 表示传入的参数有问题，1表示OK
	 */
	public int commonTop(String commonId, String type);

	/**
	 * 获取无节操笑话，从内涵吧里面抓取的 <method description>
	 *
	 * @param currentPage
	 * @return
	 */
	// public List getVirgin(String currentPage);
}
