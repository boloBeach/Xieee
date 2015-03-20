package net.xieee.web.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xieee.util.Pager;
import net.xieee.web.dao.BaseDao;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class BaseDaoImp<T> implements BaseDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings("unchecked")
	public Pager findBypager(String sql, Pager pager,Object... params) {
		// TODO Auto-generated method stub
		if (pager == null) {
			pager = new Pager();
		}

		sql += " limit " + (pager.getPageNumber() - 1) * pager.getPageSize()
				+ " , " + pager.getPageSize();
		List rows = jdbcTemplate.queryForList(sql,params);
		pager.setList(rows);
		return pager;
	}

	@SuppressWarnings("unchecked")
	public Pager findCartoonPager(String sql, Pager pager,Object... params) {
		// TODO Auto-generated method stub
		if (pager == null) {
			pager = new Pager();
		}

		if(pager.getPageNumber()!=1){
			sql += " limit " + ((pager.getPageNumber() - 1) * pager.getPageSize()-2)
					+ " , " + pager.getPageSize();
			
		}else {
			sql += " limit " + (pager.getPageNumber() - 1) * pager.getPageSize()
					+ " , " + pager.getPageSize();
		}
		List rows = jdbcTemplate.queryForList(sql,params);
		pager.setList(rows);
		return pager;
	}

	public int getCount(String sql, Object[] params) {
		// TODO Auto-generated method stub
		return jdbcTemplate.queryForInt(sql, params);
	}

	@SuppressWarnings("unchecked")
	public List getList(String sql) {
		List rows = jdbcTemplate.queryForList(sql);
		return rows;
	}

	@SuppressWarnings("unchecked")
	public Object getObject(String sql, Object[] valus, Class c) {
		// TODO Auto-generated method stub
		List list = jdbcTemplate.queryForList(null, valus, c);
		Object obj = null;
		if (list.size() > 0) {
			obj = list.get(0);
		}
		return obj;
	}

	public int save(final String sql, final Object[] params) {
		  final String innersql = sql;
		  KeyHolder keyHolder = new GeneratedKeyHolder();
		  try {
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public java.sql.PreparedStatement createPreparedStatement(
						java.sql.Connection paramConnection) throws SQLException {
					PreparedStatement ps = jdbcTemplate.getDataSource()
						       .getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
						     for(int i = 0;i<params.length;i++){
						    	 ps.setObject(i+1, params[i]);
						     }
						     return ps;
				}
		   }, keyHolder);
		  } catch (DataAccessException e) {
		   e.printStackTrace();
		  }
		  return keyHolder.getKey().intValue();
	}

	
	public int saveTemplate(String sql,Object[] params){
		return jdbcTemplate.update(sql, params);
	}
	
	
	public int update(String sql, Object[] params) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update(sql, params);

	}

	@SuppressWarnings("unchecked")
	public Object get(String sql) {
		// TODO Auto-generated method stub
		List list = jdbcTemplate.queryForList(sql);
		Object obj = null;
		if (list.size() > 0) {
			obj = list.get(0);
		}
		return obj;
	}

	public List<Map<String, Object>> getList(String sql, Object[] params) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, params);
		if (list.size() > 0)
			return list;
		return null;
	}

	public List findList(String sql, Object[] params) {
		List list = jdbcTemplate.queryForList(sql, params);
		if (list.size() > 0)
			return list;
		return null;
	}

	public List<T> getListByClass(String sql, Class clazz,Object[] params) {
		List<T> list = jdbcTemplate.queryForList(sql,params, clazz);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

}
