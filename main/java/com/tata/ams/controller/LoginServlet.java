package com.tata.ams.controller;

import java.io.IOException;
import java.sql.Statement;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;

import com.tata.ams.util.DBUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int loginId = Integer.parseInt(request.getParameter("loginId"));
        String password = request.getParameter("password");

//        final String URL = "jdbc:mysql://localhost:3306/kaveri";
//        final String USER = "root";
//        final String PASSWORD = "reposeful";
//        Connection con = null;
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection(URL,USER,PASSWORD);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//        if(con!=null)
//        {
//        	System.out.println("Connected");
//        }

        try  {
        	Connection con = DBUtil.getConnection();
            String sql = "SELECT * FROM login_table WHERE login_id = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, loginId);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("login_id"));
                if(loginId == 0)
                {
                	response.sendRedirect("adminHome.jsp");
                }
                else if(loginId >= 1 && loginId <= 1000)
                {
                	response.sendRedirect("staffHome.jsp");
                }
                else if(loginId >= 1000)
                {
                	response.sendRedirect("studentHome.jsp");
                }
                else
                {
                	response.sendRedirect("login.jsp"); 
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid login");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }


}