package com.tata.ams.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.tata.ams.bean.Attendance;
import com.tata.ams.service.AttendanceService;
/**
 * Servlet implementation class AttendenceServlet
 */
@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AttendanceService attendanceService = new AttendanceService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String dateString = request.getParameter("date");
        String status = request.getParameter("status");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = (Date) dateFormat.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Attendance attendance = new Attendance(studentId, date, status);
        boolean success = false;
		try {
			success = attendanceService.addAttendance(attendance);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if (success) {
            response.getWriter().println("Attendance added successfully");
        } else {
            response.getWriter().println("Failed to add attendance");
        }
    }
}