package com.tata.ams.bean;

public class Student {
    private int studId;
    private String name;
    private int classesAttended;
    private double percentageAttendance;
    private double attendancePercentage;
    private int totalClassesTaken;
    private int studentId;
	private String subject;

    // Constructors
    public Student() {
    }

    public Student(int studId, String name, int classesAttended, double percentageAttendance) {
        this.studId = studId;
        this.name = name;
        this.classesAttended = classesAttended;
        this.percentageAttendance = percentageAttendance;
    }
    public Student(int studId)
    {
    	this.studentId = studId;
    }

    public Student(int studId, String name, int classesAttended) {
        this.studId = studId;
        this.name = name;
        this.classesAttended = classesAttended;
    }
    
    public Student(int studentId, String name, int totalClassesTaken, int classesAttended, double attendancePercentage) {
        this.studentId = studentId;
        this.name = name;
        this.totalClassesTaken = totalClassesTaken;
        this.classesAttended = classesAttended;
        this.attendancePercentage = attendancePercentage;
    }

    // Getters and setters
    public int getStudId() {
        return studId;
    }

    public void setStudId(int studId) {
        this.studId = studId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getClassesAttended() {
        return classesAttended;
    }

    public void setClassesAttended(int classesAttended) {
        this.classesAttended = classesAttended;
    }

    public double getPercentageAttendance() {
        return percentageAttendance;
    }

    public void setPercentageAttendance(double percentageAttendance) {
        this.percentageAttendance = percentageAttendance;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getTotalClassesTaken() {
        return totalClassesTaken;
    }

    public void setTotalClassesTaken(int totalClassesTaken) {
        this.totalClassesTaken = totalClassesTaken;
    }

    public double getAttendancePercentage() {
        return attendancePercentage;
    }

    public void setAttendancePercentage(double attendancePercentage) {
        this.attendancePercentage = attendancePercentage;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "Student [studId=" + studId + ", name=" + name + ", classesAttended=" + classesAttended
                + ", percentageAttendance=" + percentageAttendance + "]";
    }
    public void setSubject(String subject) {
		// TODO Auto-generated method stub
		this.subject = subject;
	}

	public String getSubject() {
		// TODO Auto-generated method stub
		return subject;
	}
}
