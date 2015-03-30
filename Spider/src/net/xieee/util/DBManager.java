package net.xieee.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;
import org.apache.log4j.Logger;

/**
 * tomcat数据库连接池管理类<br>
 * 使用为tomcat部署环境<br>
 * 需要在类路径下准备数据库连接配置文件dbcp.properties
 * 
 * @author 宋信强
 * @mail songxinqiang123@gmail.com
 * 
 * @time 2013-12-27
 * 
 */
public class DBManager {
	private static final Logger log = Logger.getLogger(DBManager.class);
	private static final String configFile = "dbcp.properties";

	private static DataSource dataSource;

	/**
	 * 创建PreparedStatement对象
	 */
	private PreparedStatement preparedStatement = null;

	/**
	 * 创建结果集对象
	 */
	private ResultSet resultSet = null;

	static {
		Properties dbProperties = new Properties();
		try {
			dbProperties.load(DBManager.class.getClassLoader().getResourceAsStream(configFile));
			dataSource = BasicDataSourceFactory.createDataSource(dbProperties);
		} catch (Exception e) {
			e.printStackTrace();
			log.error("初始化连接池失败：" + e);
		}
	}

	public DBManager() {
	}

	/**
	 * 获取链接，用完后记得关闭
	 * 
	 * @see {@link DBManager#closeConn(Connection)}
	 * @return
	 */
	public static final Connection getConn() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("获取数据库连接失败：" + e);
		}
		return conn;
	}

	/**
	 * SQL 查询将查询结果直接放入ResultSet中
	 * 
	 * @param sql
	 *            SQL语句
	 * @param params
	 *            参数数组，若没有参数则为null
	 * @return 结果集
	 */
	public ResultSet executeQueryRS(String sql, Object[] params,
			Connection connnection) {
		try {
			// 调用SQL
			preparedStatement = (PreparedStatement) connnection
					.prepareStatement(sql);
			// 参数赋值
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i + 1, params[i]);
				}
			}
			// 执行
			resultSet = preparedStatement.executeQuery();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return resultSet;
	}

	public List<Object> excuteQuery(String sql, Object[] params) {
		// 执行SQL获得结果集
		Connection conn = getConn();
		ResultSet rs = executeQueryRS(sql, params, conn);
		// 创建ResultSetMetaData对象
		ResultSetMetaData rsmd = null;
		// 结果集列数
		int columnCount = 0;
		try {
			rsmd = (ResultSetMetaData) rs.getMetaData();
			// 获得结果集列数
			columnCount = rsmd.getColumnCount();
		} catch (SQLException e1) {
			System.out.println(e1.getMessage());
		}
		// 创建List
		List<Object> list = new ArrayList<Object>();
		try {
			// 将ResultSet的结果保存到List中
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 1; i <= columnCount; i++) {
					map.put(rsmd.getColumnLabel(i), rs.getObject(i));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			// 关闭所有资源
			closeConn(conn);
		}
		return list;
	}

	public int executeUpdate(String sql, Object[] params) {
		// 受影响的行数
		int affectedLine = 0;
		Connection connection = getConn();
		try {
			// 调用SQL
			preparedStatement = (PreparedStatement) connection
					.prepareStatement(sql);
			// 参数赋值
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					preparedStatement.setObject(i + 1, params[i]);
				}
			}
			// 执行
			affectedLine = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			// 释放资源
			closeConn(connection);
		}
		return affectedLine;
	}

	/**
	 * 关闭连接
	 * 
	 * @param conn
	 *            需要关闭的连接
	 */
	public static void closeConn(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				System.out.println("close connection");
				conn.setAutoCommit(true);
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("关闭数据库连接失败：" + e);
		}
	}

}