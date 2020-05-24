package com.czw.utils;

import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtils {
	private static String driver;
	private static String url;
	private static String user;
	private static String password;

	static Connection conn = null;

	static {
		Properties properties = new Properties(); // 创建一个properties对象
		Reader inReader; // 一个reader属性;

		try {
			String path = Thread.currentThread().getContextClassLoader().getResource("jdbc.properties").getPath();
			inReader = new FileReader(path); // 用这个方法获取properties配置文件;
			properties.load(inReader); // 加载load内部的地址;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 通过properties.getProperty("driver");方法获取值
		driver = properties.getProperty("driver");
		url = properties.getProperty("url");
		user = properties.getProperty("user");
		password = properties.getProperty("password");
	}

	/**
	 * 打开数据库连接
	 * 
	 * @return
	 */
	public static Connection open() {
		try {
			Class.forName(driver);
			System.out.println("连接成功......");
			return DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("连接数据库失败....");
		}
		return null;
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @return
	 */
	public static Connection close() {
		if (conn != null) {
			try {
				conn.close();// 关闭数据库
				System.out.println("关闭...");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("数据库关闭失败...");
			}
		}
		return null;
	}
}
