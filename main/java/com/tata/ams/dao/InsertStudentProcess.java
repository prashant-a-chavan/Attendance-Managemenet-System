package com.tata.ams.dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tata.ams.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InsertStudent")
public class InsertStudentProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        int stud_id = Integer.parseInt(request.getParameter("stud_id"));
        String name = request.getParameter("name");
        String phone_no = request.getParameter("phone_no");
        String gender = request.getParameter("gender");
        String d_name = request.getParameter("d_name");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Register JDBC driver

            // Open a connection
            conn = DBUtil.getConnection();

            // SQL query to insert student record
            String sql = "INSERT INTO student (stud_id,name, phone_no, gender, d_name) VALUES (?, ?, ?, ?, ?)";

            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setInt(1, stud_id);
            pstmt.setString(2, name);
            pstmt.setString(3, phone_no);
            pstmt.setString(4, gender);
            pstmt.setString(5, d_name);

            // Execute the query
            pstmt.executeUpdate();

            out.println("<p>Student record inserted successfully.</p>");

            // Close resources
            pstmt.close();
            conn.close();
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
            out.println("<p>Error: " + se.getMessage() + "</p>");
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block used to close resources
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (SQLException se2) {
            } // Nothing we can do
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } // End finally try
        } // End try
    }
}
