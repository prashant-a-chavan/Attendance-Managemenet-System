<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iAttendance : Admin Dashboard</title>
    <style>
        html {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-size: cover;
		    background-repeat: no-repeat;
		    background-position: top;
		    background-image: url('adminImage1.png');
            height: 100vh;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
        }
		button {
		    padding: 10px 20px;
		    margin: 10px;
		    font-size: 18px;
		    cursor: pointer;
		    background-color: rgba(0, 0, 0, 0); /* Transparent background */
		    color: #2a2828;
    		font-weight: 600;
		    border: 1px solid #2a2828; /* Light border */
		    border-radius: 5px;
		    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); /* Box shadow */
		}
		
		button:hover {
		    background-image: linear-gradient(to right, rgb(0, 0, 0,0.6), rgb(0, 0, 0,0.5), rgba(0, 0, 0,0.6));
		    text-shadow: 0px 0px 20px #ffffff;
		    color : white; 
			transition: 0.2s;
			
		}


        .login_container {
            position: absolute;
            top: 130px;
		    left: 500px;
		    width: 180px;
		    height: 227px;
		    background-color: #f1f8ff5e;
		    padding: 20px 20px;
		    box-shadow: 0px 0px 58px #000000;
		    text-shadow: 0px 0px 5px white;
		    border-radius: 25px;
		    text-align: center;
		    border: 3px solid #00000040;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    z-index: -1;
        }
        #b1
        {
        	position: absolute;
            top: 160px;
		    left: 515px;
        }
        
        #b2
        {
        	position: absolute;
            top: 240px;
		    left: 520px;
        }
         #b3
        {
        	position: absolute;
            top: 320px;
		    left: 503px;
		    
        }
    </style>
</head>
<body>
    <div class="login_container"></div>
    <div class="container">
        <button onclick="redirectTo('student')" id = "b1">Student Details</button>
        <button onclick="redirectTo('teacher')" id = "b2">Teacher Details</button>
        <button onclick="redirectTo('attendance')" id = "b3">Attendance Details</button>
    </div>
    
    <script>
        function redirectTo(page) {
            switch (page) {
                case 'student':
                    window.location.href = 'student_details.jsp';
                    break;
                case 'teacher':
                    window.location.href = 'teacher_details.jsp';
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