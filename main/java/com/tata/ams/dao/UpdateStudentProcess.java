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

@WebServlet("/UpdateStudent")
public class UpdateStudentProcess extends HttpServlet {
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

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;

        try {

            // SQL query to update student record
            String sql = "UPDATE student SET name=?, phone_no=?, gender=?, d_name=? WHERE stud_id=?";

            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, name);
            pstmt.setString(2, phone_no);
            pstmt.setString(3, gender);
            pstmt.setString(4, d_name);
            pstmt.setInt(5, stud_id);

            // Execute the query
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>Student record updated successfully.</p>");
            } else {
                out.println("<p>No student record found with ID: " + stud_id + "</p>");
            }

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
