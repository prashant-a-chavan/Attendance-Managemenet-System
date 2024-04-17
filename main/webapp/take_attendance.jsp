<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iAttendance : Take Attendance</title>
<style>
    body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url('staffImage.png');
            background-attachment: fixed; /* Make the background image fixed */
      }

    h1 {
        text-align: center;
        margin-top: 20px;
    }

    form {
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 8px;
    }

    input[type="text"], input[type="button"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="button"], input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
    }

    input[type="button"]:hover, input[type="submit"]:hover {
        background-color: #0056b3;
    }

    input[type="checkbox"] {
        margin-right: 10px;
    }

    label.checkbox-label {
        display: inline-block;
        margin-bottom: 10px;
    }
    
    /* Style for the table */
    table {
        width: 100%;
        border-collapse: collapse;
    }
    /* Style for the table headers */
    th {
        background-color: #f2f2f2;
        padding: 8px;
        text-align: center;
    }
    /* Style for the table cells */
    td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }
    #submitButton {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 12px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 10px;
    }

    #submitButton:hover {
        background-color: #45a049;
    }
    #submitButton:disabled {
        background-color: #cccccc;
        cursor: not-allowed;
    }
</style>
</head>
<body>
    <h1>Take Attendance</h1>
    
    <form id="attendanceForm" onsubmit="takeAttendance(event);">
        <label for="staff_id">Staff ID:</label>
        <input type="text" id="staff_id" name="staff_id" required>
        
        <label for="d_name">Department Name:</label>
        <input type="text" id="d_name" name="d_name" required>
        
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>
        
        <input type="button" value="Generate Roll Numbers" onclick="promptTotalStudents()">
        
        <!-- Table to contain the checkboxes -->
        <table id="checkboxTable"></table>
        
        <input type="submit" id="submitButton" value="Submit" disabled>
    </form>

      <script>
        var totalStudents;

        function promptTotalStudents() {
            totalStudents = prompt("Enter the total number of students:");
            if (totalStudents !== null && totalStudents !== "") {
                generateStudentCheckboxes(parseInt(totalStudents, 10));
            } else {
                alert("Please enter a valid number of students.");
            }
        }

        function generateStudentCheckboxes(totalStudents) {
            var checkboxTable = document.getElementById("checkboxTable");
            checkboxTable.innerHTML = ''; // Clear existing table contents

            // Create a row for each student
            for (var i = 1; i <= totalStudents; i++) {
                var row = checkboxTable.insertRow();
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);

                var checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.id = "student" + i;
                checkbox.name = "student" + i;

                var label = document.createElement("label");
                label.htmlFor = "student" + i;
                label.appendChild(document.createTextNode("Roll No " + i));

                cell1.appendChild(checkbox);
                cell2.appendChild(label);
            }

            var submitButton = document.getElementById("submitButton");
            submitButton.disabled = false;
        }

        function takeAttendance(event) {
            event.preventDefault(); // Prevent form submission

            var staff_id = document.getElementById("staff_id").value;
            var d_name = document.getElementById("d_name").value;
            var subject = document.getElementById("subject").value;
            var presentStudents = [];

            // Check which students are present
            for (var i = 1; i <= totalStudents; i++) {
                var checkbox = document.getElementById("student" + i);
                if (checkbox.checked) {
                    presentStudents.push(i);
                }
            }

            // Convert presentStudents array to a comma-separated string
            var presentStudentsString = presentStudents.join(",");

            // Send the attendance data to servlet using AJAX
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Response handling if needed
                    alert("Attendance submitted successfully!");
                    location.reload();
                }
            };
            xhttp.open("POST", "AttendanceTake", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("staff_id=" + staff_id + "&d_name=" + d_name + "&subject=" + subject + "&presentStudents=" + presentStudentsString);
        }
    </script>
</body>
</html>
