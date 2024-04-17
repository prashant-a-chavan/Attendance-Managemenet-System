<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>iAttendance : Update Student</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: top;
        background-image: url('adminImage1.png');
        height: 100vh;
        background-color: #f2f2f2; /* Set a fallback background color */
        background-attachment: fixed;
    }
    form {
        width: 400px;
        margin: 50px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        margin-top: -10px;
        color: #333; /* Change the color to ensure visibility */
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }
    input[type="text"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    
    <form method="post" action="UpdateStudent">
    	<h1>Update Student</h1>
    
        <label for="stud_id">Student ID:</label>
        <input type="text" id="stud_id" name="stud_id" required><br><br>
    
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="phone_no">Phone Number:</label>
        <input type="text" id="phone_no" name="phone_no"><br><br>
        
        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender"><br><br>
        
        <label for="d_name">Department Name:</label>
        <input type="text" id="d_name" name="d_name"><br><br>
        
        <input type="submit" value="Update">
    </form>
</body>
</html>
