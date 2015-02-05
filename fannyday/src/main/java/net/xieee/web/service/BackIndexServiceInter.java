package net.xieee.web.service;

import java.util.List;

import net.xieee.web.bean.Catalog;
import net.xieee.web.bean.Users;

public interface BackIndexServiceInter extends BaseServiceInter{
	/**
	 * @see 返回0 表示用户传入的参数为空
	 * @see 返回1表示成功
	 * @see 返回-1表示查询出的list为空，这个用户不存在
	 * @see 返回-2 表示用户登录失败， 用户的密码为空 ，但是用户存在
	 * @see 返回-3 表示用户的密码错误，请重新输入密码
	 * @param users
	 * @return 
	 */
	public int checkAdmin(Users users);
	
	/**
	 * 通过父类id来获取子id
	 * @param parentId
	 * @return
	 */
	public List<Catalog> getCatalogByParentId(String parentId);
	
	/**
	 * 通过catalog的id获取catalog的信息
	 * @param catalog_id
	 * @return
	 */
	public Catalog getCatalogById(String catalog_id);
	
	/**
	 * 保存catalog信息
	 * @param catalog catalog对象
	 * @return
	 */
	public int saveCatalog(Catalog catalog);
}
