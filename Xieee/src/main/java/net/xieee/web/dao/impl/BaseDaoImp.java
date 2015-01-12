package net.xieee.web.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xieee.util.Pager;
import net.xieee.web.dao.BaseDao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional
public class BaseDaoImp implements BaseDao {

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	
	@SuppressWarnings("unchecked")
	
	public Pager findBypager(String sql,Pager pager) {
		// TODO Auto-generated method stub
		if(pager==null){
			pager=new Pager();
		}
		
		sql += " limit " +(pager.getPageNumber() - 1) * pager.getPageSize() + " , " +pager.getPageSize();
		List rows = jdbcTemplate.queryForList(sql);
		pager.setList(rows);
		return pager;
	}

	
	public int getCount(String sql) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForInt(sql);
	}

	@SuppressWarnings("unchecked")
	
	public List getList(String sql) {
		List rows = jdbcTemplate.queryForList(sql);
		return rows;
	}

	@SuppressWarnings("unchecked")
	
	public Object getObject(String sql, Object[] valus, Class c) {
		// TODO Auto-generated method stub
		List list = jdbcTemplate.queryForList(sql,valus);
		Object obj = null;
		if(list.size()>0){
			obj = list.get(0);
		}
		return obj;
	}

	
	public void save(String sql,Object[] valus) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(sql,valus);
	}

	
	public void update(String sql, Object[] valus) {
		// TODO Auto-generated method stub
		jdbcTemplate.update(sql, valus);
		
	}

	@SuppressWarnings("unchecked")
	
	public Object get(String sql) {
		// TODO Auto-generated method stub
		List list = jdbcTemplate.queryForList(sql);
		Object obj = null;
		if(list.size()>0){
			obj = list.get(0);
		}
		return obj;
	}


	public List<Map<String,Object>> getList(String sql, Object[] params) {
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql, params);
		if(list.size()>0)
			return list;
		return null;
	}

}
