package com.tata.ams.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import com.tata.ams.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AttendanceTake")
public class AttendanceProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Print received parameters for debugging
        String staffId = request.getParameter("staff_id");
        String departmentName = request.getParameter("d_name");
        String subject = request.getParameter("subject");
        String presentStudents = request.getParameter("presentStudents");
//        System.out.println("Received parameters:");
//        System.out.println("Staff ID: " + staffId);
//        System.out.println("Department Name: " + departmentName);
//        System.out.println("Subject: " + subject);
//        System.out.println("Present Students: " + presentStudents);

        int staff_id = Integer.parseInt(staffId);
        String d_name = departmentName;
        String sub = subject;
        String[] presentStudentsArray = presentStudents.split(",");
        int[] presentStudentsIds = Arrays.stream(presentStudentsArray).mapToInt(Integer::parseInt).toArray();

        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;

        try {
            String sql = "INSERT INTO attendance (stud_id, d_name, staff_id, subject, attendance_date) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = now.format(formatter);

            for (int rollNo : presentStudentsIds) {	
                pstmt.setInt(1, rollNo);
                pstmt.setString(2, d_name);
                pstmt.setInt(3, staff_id);
                pstmt.setString(4, sub);
                pstmt.setString(5, formattedDateTime);
                pstmt.executeUpdate();
                out.println("<p>Attendance recorded for Roll No " + rollNo + ".</p>");
            }

            pstmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
            out.println("<p>Error: " + se.getMessage() + "</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
