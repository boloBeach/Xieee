package net.xieee.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xieee.util.Pager;
import net.xieee.web.dao.BaseDao;
import net.xieee.web.service.BaseServiceInter;

import org.springframework.stereotype.Repository;
@Repository
public class BaseServiceImpl implements BaseServiceInter {

	@Resource
	private BaseDao baseDao;
	
	public Pager findBypager(String sql, Pager pager) {
		// TODO Auto-generated method stub
		return baseDao.findBypager(sql, pager);
	}

	
	public int getCount(String sql,Object[] params) {
		// TODO Auto-generated method stub
		return baseDao.getCount(sql,params);
	}

	
	public List<Object> getList(String sql) {
		// TODO Auto-generated method stub
		return baseDao.getList(sql);
	}

	
	public Object getObject(String sql, Object[] valus, Class c) {
		// TODO Auto-generated method stub
		return baseDao.getObject(sql, valus, c);
	}

	
	public int save(String sql,Object[] params) {
		// TODO Auto-generated method stub
		return baseDao.save(sql,params);
	}

	
	public int update(String sql, Object[] params) {
		// TODO Auto-generated method stub
		return baseDao.update(sql, params);
	}

	
	public Object get(String sql) {
		// TODO Auto-generated method stub
		return baseDao.get(sql);
	}


	public List<Map<String,Object>> getList(String sql, Object[] params) {
		
		return baseDao.getList(sql, params);
	}


	public List findList(String sql, Object[] params) {
		
		return baseDao.findList(sql, params);
	}

}
