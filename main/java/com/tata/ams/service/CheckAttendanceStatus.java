package com.tata.ams.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tata.ams.util.DBUtil;

@WebServlet("/CheckStudAttendanceStatus")
public class CheckAttendanceStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        int stud_id = Integer.parseInt(request.getParameter("stud_id"));
        String d_name = request.getParameter("d_name");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish connection
            conn = DBUtil.getConnection();

            // SQL query to retrieve students attendance status
            String sql = "SELECT subject, COUNT(attendance_date) AS attendance_count FROM attendance WHERE stud_id = ? AND d_name = ? GROUP BY subject";

            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setInt(1, stud_id);
            pstmt.setString(2, d_name);

            // Execute query
            rs = pstmt.executeQuery();

            // Display attendance details
            out.println("<table border='1'>");
            out.println("<tr><th>Subject</th><th>Total Attended Classes</th></tr>");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString("subject") + "</td><td>" + rs.getInt("attendance_count") + "</td></tr>");
            }
            out.println("</table>");

        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
            out.println("<p>Error: " + se.getMessage() + "</p>");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block used to close resources
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } // End finally try
        } // End try
    }
}
