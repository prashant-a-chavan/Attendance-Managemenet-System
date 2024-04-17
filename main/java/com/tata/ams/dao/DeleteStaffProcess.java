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

@WebServlet("/DeleteStaff")
public class DeleteStaffProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        int staff_id = Integer.parseInt(request.getParameter("staff_id"));


        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;

        try {

            // SQL query to delete staff record
            String sql = "DELETE FROM staff WHERE staff_id=?";

            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameter
            pstmt.setInt(1, staff_id);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Staff record with ID " + staff_id + " deleted successfully.</p>");
            } else {
                out.println("<p>No staff record found with ID " + staff_id + ".</p>");
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
