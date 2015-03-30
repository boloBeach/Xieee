package net.xieee.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;
import org.apache.log4j.Logger;

public class DB {
	/**
	 * 日志
	 */
	private static Logger logger = Logger.getLogger(DB.class);
	// 下面是sqlserver2008连接数据库的方式
	private static ResultSet _rs = null;
	private static Connection _conn = null;
	private static Statement _stmt = null;
	private static String DBURL = null;
	private static String DBDRIVER = null;
	private static String DBUSER = null;
	private static String DBPASSWORD = null;
	// 创建一个连接池，用来计算以及添加用户列表的
	private static DataSource datasource;
	
	// 采用静态快来完成
	static {
		Properties properties = new Properties();
		InputStream inputStream = DB.class.getResourceAsStream("/dbcp.properties");
		try {
			properties.load(inputStream);
			datasource = BasicDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("加载资源发生异常" + e.toString());
		}

	}

	/**
	 * 
	 * @author:张兵
	 * @Date:2014年7月24日:下午3:42:09
	 * @Description 获取一个datasource
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception ：异常
	 */
	public static DataSource getDataSource(){
        return datasource;
    }
	
	/**
	 * 
	 * @author:张兵
	 * @Date:2014年7月24日:下午3:42:38
	 * @Description 获取用户连接
	 * @param :输入参数
	 * @return :输出结果
	 * @throws Exception ：异常
	 */
	public static Connection getScoreConnection(){
        try {
        	return datasource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("获取数据库连接发生错误" + e.toString());
        }
		return null;
    }
	
	
	/**
	 * 获取一个数据库连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		try {
			Class.forName(DBDRIVER);
			_conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			logger.error("获取数据库连接发生错误" + e.toString());
		}
		return _conn;
	}

	/**
	 * 通过sql语句获取信息
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数信息
	 * @return 返回List<HashMap<String,Object>>类型
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<HashMap<String, Object>> excuteQuery(final String sql,
			Object[] params,Connection conn) {
		List<HashMap<String, Object>> datas = null;
		PreparedStatement sta = null;
		ResultSet rs = null;
		try {
			sta = conn.prepareStatement(sql);
			if (params != null) {
				int i = 0;
				for (Object obj : params) {
					if (obj instanceof Date) {
						sta.setTimestamp(i + 1, Timestamp.valueOf(FileUtil.getStringByDate((Date)obj)));
					} else {
						sta.setObject(i + 1, obj);
					}
					i++;
				}
			}
			rs = sta.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int recount = rsmd.getColumnCount();
			String[] colLabels = new String[recount];
			for (int i = 0; i < recount; i++) {
				colLabels[i] = rsmd.getColumnLabel(i + 1);
			}
			datas = new ArrayList<HashMap<String, Object>>();
			while (rs.next()) {
				HashMap<String, Object> data = new HashMap<String, Object>();
				for (int i = 0; i < colLabels.length; i++) {
					data.put(colLabels[i], rs.getObject(colLabels[i]));
				}
				datas.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("获取数据库连接发生错误" + e.toString());
		} finally {
			close(conn, sta, rs);
		}
		return datas;
	}

	/**
	 * 执行更新操作返回的行数
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数
	 * @return int类型，返回操作成功的行数，如果为-1则说明操作失败，或者没有更新
	 */
	public static int excuteUpdate(String sql, Object[] params,Connection _conn) {
		int result = -1;
		PreparedStatement stmt = null;
		if (_conn != null) {
			try {
				stmt = _conn.prepareStatement(sql);
				if (params != null) {
					int i = 0;
					for (Object obj : params) {
						if (obj instanceof Date) {
							stmt.setTimestamp(i + 1, Timestamp.valueOf(FileUtil.getStringByDate((Date)obj)));
						} else {
							stmt.setObject(i + 1, obj);
						}
						i++;
					}
				}
				result = stmt.executeUpdate();

			} catch (Exception e) {
				logger.error("executeUpdate方法执行sql语句方法异常" + sql + "-----错误信息为"
						+ e.toString());
			} finally {
				close(_conn, stmt, null);
			}
		} else {
			logger.error("获取数据库连接发生错误");
		}
		return result;
	}

	private static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			logger.error("关闭数据库发生异常" + e.toString());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				logger.error("关闭数据库发生异常" + e.toString());
			} finally {
				try {
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					logger.error("关闭数据库发生异常" + e.toString());
				}
			}
		}
	}
}
