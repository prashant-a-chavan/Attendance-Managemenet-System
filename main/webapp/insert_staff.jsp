<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>iAttendance : Insert Staff</title>
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

    h1 {
        text-align: center;
        margin-top: -10px;
    }

    form {
        width: 400px;
        margin: 20px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
        margin-bottom: 10px;
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
    
    <form method="post" action="InsertStaff">
	    <h1>Insert Staff</h1>
    
        <label for="staff_id">Staff ID:</label>
        <input type="text" id="staff_id" name="staff_id" required><br><br>
    
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="phone_no">Phone Number:</label>
        <input type="text" id="phone_no" name="phone_no"><br><br>
        
        <label for="gmail">Email:</label>
        <input type="text" id="gmail" name="gmail"><br><br>
        
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject"><br><br>
        
        <label for="d_name">Department Name:</label>
        <input type="text" id="d_name" name="d_name"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
