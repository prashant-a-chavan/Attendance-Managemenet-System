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

@WebServlet("/UpdateStaff")
public class UpdateStaffProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
        String name = request.getParameter("name");
        String phone_no = request.getParameter("phone_no");
        String gmail = request.getParameter("gmail");
        String subject = request.getParameter("subject");
        String d_name = request.getParameter("d_name");

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;

        try {

            // SQL query to update teacher record
            String sql = "UPDATE staff SET name=?, phone_no=?, gmail=?, subject=?, d_name=? WHERE staff_id=?";

            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, name);
            pstmt.setString(2, phone_no);
            pstmt.setString(3, gmail);
            pstmt.setString(4, subject);
            pstmt.setString(5, d_name);
            pstmt.setInt(6, teacher_id);

            // Execute the query
            pstmt.executeUpdate();

            out.println("<p>Teacher record updated successfully.</p>");

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
