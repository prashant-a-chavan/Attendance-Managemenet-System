package com.tata.ams.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.tata.ams.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudAttendanceDetails")
public class AttendanceDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        int staff_id = Integer.parseInt(request.getParameter("staff_id"));
        String d_name = request.getParameter("d_name");
        String subject = request.getParameter("subject");
        int total_classes = Integer.parseInt(request.getParameter("total_classes"));

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            conn = DBUtil.getConnection();

            // SQL query to retrieve students attendance details
            String sql = "SELECT s.stud_id, s.name, COUNT(*) AS classes_attended, (COUNT(*) / ?) * 100 AS attendance_percentage "
                    + "FROM attendance a INNER JOIN student s ON a.stud_id = s.stud_id "
                    + "WHERE a.staff_id = ? AND a.d_name = ? AND a.subject = ? GROUP BY a.stud_id, s.name";
            // Create prepared statement
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setInt(1, total_classes);
            pstmt.setInt(2, staff_id);
            pstmt.setString(3, d_name);
            pstmt.setString(4, subject);

            // Execute query
            rs = pstmt.executeQuery();

            // Create JSON response
            StringBuilder jsonResponse = new StringBuilder("[");
            while (rs.next()) {
                int stud_id = rs.getInt("stud_id");
                String name = rs.getString("name");
                int classes_attended = rs.getInt("classes_attended");
                double attendance_percentage = rs.getDouble("attendance_percentage");

                jsonResponse.append("{\"stud_id\":").append(stud_id)
                            .append(",\"name\":\"").append(name)
                            .append("\",\"classes_attended\":").append(classes_attended)
                            .append(",\"percentage_attendance\":").append(attendance_percentage)
                            .append("},");
            }
            if (jsonResponse.charAt(jsonResponse.length() - 1) == ',') {
                jsonResponse.deleteCharAt(jsonResponse.length() - 1);
            }
            jsonResponse.append("]");
            
            // Send JSON response
            out.println(jsonResponse.toString());

        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
            out.println("{\"error\": \"" + se.getMessage() + "\"}");
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
            out.println("{\"error\": \"" + e.getMessage() + "\"}");
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
