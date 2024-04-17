<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>iAttendance : Attendance Details</title>
    <style>
        body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-size: cover;
	        background-repeat: no-repeat;
	        background-position: top;
	        background-image: url('adminImage1.png');
	        background-color: #f2f2f2; /* Set a fallback background color */
	        background-attachment: fixed;
	    }

        h1 {
            text-align: center;
            color: white;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="button"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #0056b3;
        }

        #studentsTableDiv {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
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
    <h1>Attendance Details</h1>
    <form id="attendanceDetailsForm">
        <label for="staff_id">Staff ID:</label>
        <input type="text" id="staff_id" name="staff_id" required>

        <label for="d_name">Department Name:</label>
        <input type="text" id="d_name" name="d_name" required>

        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>

        <label for="total_classes">Total Classes Taken:</label>
        <input type="number" id="total_classes" name="total_classes" required>

        <input type="button" value="Get Students" onclick="getStudents()">
    </form>

    <div id="studentsTableDiv"></div>

    <script>
        function getStudents() {
            var staff_id = document.getElementById("staff_id").value;
            var d_name = document.getElementById("d_name").value;
            var subject = document.getElementById("subject").value;
            var total_classes = document.getElementById("total_classes").value;

            // AJAX call to fetch students data
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    displayStudentsTable(this.responseText);
                }
            };
            xhttp.open("POST", "StudAttendanceDetails", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("staff_id=" + staff_id + "&d_name=" + d_name + "&subject=" + subject + "&total_classes=" + total_classes);
        }

        function displayStudentsTable(response) {
            // Parse JSON response and display students table
            var studentsData = JSON.parse(response);
            var tableDiv = document.getElementById("studentsTableDiv");
            var tableHTML = "<h2>Attendance Details</h2><table border='1'><tr><th>Student ID</th><th>Name</th><th>Classes Attended</th><th>Attendance Percentage</th></tr>";
            
            studentsData.forEach(function(student) {
                tableHTML += "<tr><td>" + student.stud_id + "</td><td>" + student.name + "</td><td>" + student.classes_attended + "</td><td>" + student.percentage_attendance + "%</td></tr>";
            });

            tableHTML += "</table>";
            tableDiv.innerHTML = tableHTML;
        }
    </script>
</body>
</html>
