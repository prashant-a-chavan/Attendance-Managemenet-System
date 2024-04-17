package com.tata.ams.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.tata.ams.bean.Attendance;
import com.tata.ams.util.DBUtil;

public class AttendanceDao {
    public boolean addAttendance(Attendance attendance) throws ClassNotFoundException {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO attendance (student_id, date, status) VALUES (?, ?, ?)")) {
            ps.setInt(1, attendance.getStudentId());
            ps.setDate(2, new java.sql.Date(attendance.getDate().getTime()));
            ps.setString(3, attendance.getStatus());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
