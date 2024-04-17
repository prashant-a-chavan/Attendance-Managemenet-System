package com.tata.ams.service;

import com.tata.ams.bean.Attendance;
import com.tata.ams.dao.AttendanceDao;

public class AttendanceService {
    private AttendanceDao attendanceDao = new AttendanceDao();

    public boolean addAttendance(Attendance attendance) throws ClassNotFoundException {
        return attendanceDao.addAttendance(attendance);
    }
}
