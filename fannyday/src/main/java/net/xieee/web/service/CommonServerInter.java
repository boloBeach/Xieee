package net.xieee.web.service;

import java.util.List;

import net.xieee.util.Pager;

/**
 * 评论的借口类 <class description>
 *
 * @author: royzhang
 * @version: 1.0, 2015年3月11日
 */
public interface CommonServerInter extends BaseServiceInter {

	/**
	 * 
	 * <method description> 根据[漫画]资源Id来获取评论内容
	 * 
	 * @param resourceId
	 *            资源的id值
	 * @param catalogId
	 *            菜单的id值
	 * @param currentPage 当前页
	 * @return java.util.Pager对象 对象
	 */
	public Pager getCartoonCommonByResourceId(String resourceId, String catalogId,String currentPage);



	/**
	 * 保存评论，通过资源ID和catalogId来进行区分评论的内容
	 * <method description>
	 * @param userName 用户的名字
	 * @param catalogId 菜单的Id值
	 * @param resourceId 资源的id值
	 * @param ip ip地址
	 * @param ipaddress ip对象的地址
	 * @param content 内容
	 * @return java.lang.int 如果返回0表示插入失败， 如果返回-1表示资源id和catalogId为空，或者不可用，如果是1表示成功
	 */
	public int saveCommont(String userName,String catalogId, String resourceId, String ip, String ipaddress, String content);
}
