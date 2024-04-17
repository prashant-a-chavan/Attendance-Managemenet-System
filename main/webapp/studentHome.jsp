<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iAttendance : Student Attendance Status</title>
<style>
		body {
    display: flex;
    flex-direction: column;
    justify-content: center; /* Vertically center the content */
    align-items: center; /* Horizontally center the content */
    min-height: 100vh;
    margin: 0;
    padding: 0;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-image: url('28466.jpg');
    background-attachment: fixed; /* Make the background image fixed */
}

}

h1 {
    text-align: center;
    color: #007bff;
}


form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0px 0px 10px black;
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"],
input[type="number"],
input[type="submit"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

#attendanceStatusDiv {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}


</style>
</head>
<body>
    <h1>Attendance Status</h1>

    <form id="attendanceStatusForm" onsubmit="checkAttendanceStatus(); return false;">
        <label for="stud_id">Student ID:</label>
        <input type="text" id="stud_id" name="stud_id" required>
        
        <label for="d_name">Department Name:</label>
        <input type="text" id="d_name" name="d_name" required>

        <input type="submit" value="Check Attendance Status">
    </form>

    <div id="attendanceStatusDiv"></div>

    <script>
        function checkAttendanceStatus() {
            var stud_id = document.getElementById("stud_id").value;
            var d_name = document.getElementById("d_name").value;

            // AJAX call to fetch attendance status
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("attendanceStatusDiv").innerHTML = this.responseText;
                }
            };
            xhttp.open("POST", "CheckStudAttendanceStatus", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("stud_id=" + stud_id + "&d_name=" + d_name);
        }
    </script>
</body>
</html>
