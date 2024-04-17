<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <h1>Students List</h1>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Classes Attended</th>
            <th>Attendance Percentage</th>
        </tr>
        <%-- Iterate over the list of students and display each student's details --%>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.stud_id}</td>
                <td>${student.name}</td>
                <td>${student.classes_attended}</td>
                <td>${student.percentage_attendance}%</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
