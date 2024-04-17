<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>iAttendance : Login</title>

<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }
 .login-container {
    position: relative; /* Ensure the container is positioned relatively */
    background-color : #f1f8ff5e;
    padding: 50px 50px;
    box-shadow: 0px 0px 100px #f5b47b;
    text-shadow: 0px 0px 5px white;
    border-radius: 15px;
    text-align: center;
    border: 3px solid #00000040;
}
  input[type="text"], input[type="password"], select {
    width: 120%;
    padding: 10px 15px;
    margin: 10px -20px;
    border: 1px solid #aea3a3;
    border-radius: 5px;
    box-sizing: border-box;
  }

input[type="text"]:focus, input[type="password"]:focus, select:focus {
    outline: none; /* Remove the default focus outline */
}

  
  h2 {
  font-family: 'Pacifico', cursive; /* Change the font-family to 'Pacifico' */
  color: #4285f4; /* Change the color of the text */
  font-size: 3em; /* Adjust the font size */
  text-transform: uppercase; /* Transform text to uppercase */
  letter-spacing: 4px; /* Add some letter spacing */
  margin-bottom: 10px; /* Add some spacing below the text */
  margin-top: -10px; /* Add some spacing below the text */
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Add a text shadow for a stylish effect */
  padding: 10px; /* Add padding to make the text more prominent */
  cursor: pointer; /* Change cursor style to pointer */
  transition: transform 0.3s ease; /* Add a smooth transition effect */
}

h2:hover {
  transform: scale(1.05); /* Increase size on hover for a subtle effect */
}

    
    input[type="submit"] {
	    padding: 10px 20px;
	    margin-top : 15px;
	    width : 60%;
	    font-size: 18px;
	    cursor: pointer;
	    background-color: rgba(0, 0, 0, 0); 
	    color: #3f3f3f;	
   		font-weight: 600;
	    border: 1px solid #2a2828;
	    border-radius: 5px;
	    box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.5);
	    text-shadow: 0px 0px 3px #ffffff; 
	    background-image: linear-gradient(to right, rgb(255, 255, 255, 0.8), rgb(255, 255, 255, 0.4), rgba(0, 0, 0, 0));
	}
		
		input[type="submit"]:hover {
		    background-image: linear-gradient(to right, rgb(0, 0, 0,0.6), rgb(0, 0, 0,0.5), rgba(0, 0, 0,0.6));
		    text-shadow: 0px 0px 20px #ffffff;
		    color : white; 
			transition: background-color 0.8s;
			box-shadow : 0px 0px 0px white;
		}


</style>
</head>
<body style="background-image: url('loginImage1.jpg');">	
    
<div class="login-container">
  <h2>Login</h2>
  <form id="loginForm" action="login" method="post">
    <input type="text" name="loginId" placeholder="Login ID">
    <br>
    <input type="password" name="password" placeholder="Password">
    <br>
    <br>
    <input type="submit" value="Login">
  </form>
</div>
</body>
</html>
