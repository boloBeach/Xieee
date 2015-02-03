package net.xieee.web.service;

import java.util.List;
import java.util.Map;

import net.xieee.util.Pager;

public interface BaseServiceInter<T> {
	/**
	 * 根据sql获取一条数据
	 * @param sql
	 * @return
	 */
	public Object get(String sql);
	/**
	 * 保存数据
	 * @param sql
	 */
	public int save(String sql,Object[] params);
	/**
	 * 更新数据
	 * @param sql
	 * @param valus
	 */
	public int update(String sql,Object[] params);
	/**
	 * 获取记录数
	 * @param sql
	 * @return
	 */
	public int getCount(String sql,Object[] params);
	
	/**
	 * 根据条件查询一条数据
	 * @param sql
	 * @param valus
	 * @param obj
	 * @return
	 */
	public Object getObject(String sql,Object[] valus,Class c);
	/**
	 * 查询数据集合
	 * @param sql
	 * @return
	 */
	public List<Object> getList(String sql);
	
	/**
	 * get list by sql and params is params
	 * @param sql the sql
	 * @param params
	 * @return
	 */
	public List<Map<String,Object>> getList(String sql,Object[] params);
	
	/**
	 * 分页查询
	 * @param sql
	 * @return
	 */
	public Pager findBypager(String sql,Pager pager);
	
	/**
	 * 获取list
	 * @param sql
	 * @param params
	 * @param clazz
	 * @return
	 */
	public List findList(String sql,Object[] params);
	
	/**
	 * 通过sql和class获取list<object>
	 * @param sql 语句
	 * @param clazz class类型
	 * @param params 參數對象
	 * @return list<object>
	 */
	public List<T> getListByClass(String sql,Class clazz,Object[] params);
}
