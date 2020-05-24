package com.czw.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.czw.utils.DBUtils;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 更新数据
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (id != null && username != null || password != null) {
			// 获得数据库连接
			Connection conn = DBUtils.open();
			String sql = "update user set user_name=?,password=? where id=?"; // sql语句

			try {
				PreparedStatement prtmt = conn.prepareStatement(sql); // 预编译语句

				prtmt.setString(1, username); // 给第一个? 添加数据
				prtmt.setString(2, password); // 给第二个? 添加数据
				prtmt.setString(3, id); // 给第三个? 添加数据

				int resInt = prtmt.executeUpdate(); // 执行
				request.setAttribute("resInt", resInt); // 返回影响的行数
				request.getRequestDispatcher("/findAllServlet").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtils.close(); // 关闭数据库连接
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		doGet(request, response);
	}

}
