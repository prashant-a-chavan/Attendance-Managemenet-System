<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iAttendance : Staff Dashboard</title>
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
        .container {
            width: 80%;
            margin: -30px 116px;
            text-align: center;
        }
        button {
		    padding: 10px 20px;
		    margin: 20px;
		    font-size: 18px;
		    cursor: pointer;
		    background-color: rgba(0, 0, 0, 0); 
		    color: #2a2828;
    		font-weight: 600;
		    border: 1px solid #2a2828;
		    border-radius: 5px;
		    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); 
		    background-image: linear-gradient(to left, rgb(255, 255, 255, 0.8), rgb(255, 255, 255, 0.4), rgba(0, 0, 0, 0));
		}
		
		button:hover {
		    background-color: rgba(0, 8, 8, 0.6); /* Light background on hover */
			color : white;
			transition: background-color 0.8s;
		}
        h1{
        	color : white;
        	margin : 120px;
        }
        
        #b1{
        	    background-image: linear-gradient(to right, rgb(255, 255, 255, 0.8), rgb(255, 255, 255, 0.4), rgba(0, 0, 0, 0));
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Staff Dashboard</h1>
        <button onclick="redirectTo('takeA')" id='b1'>Take Attendance</button>
        <button onclick="redirectTo('attendance')">Attendance Details</button>
    </div>

    <script>
        function redirectTo(page) {
            switch (page) {
                case 'takeA':
                    window.location.href = 'take_attendance.jsp';
                    break;
                case 'attendance':
                    window.location.href = 'attendance_details.jsp';
                    break;
                default:
                    break;
            }
        }
    </script>
</body>
</html>
