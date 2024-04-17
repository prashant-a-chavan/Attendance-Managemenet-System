<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>iAttendance : Staff Details</title>
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

    .container {
        width: 80%;
        margin: 20px auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    tr {
        background-color: #f2f2f2;
    }

    .options {
        margin-top: 20px;
        margin-left : 250px;
    }

    
    button {
	    padding: 10px 20px;
	    margin-top : -5px;
	    margin-left : 10px;
	    font-size: 18px;
	    cursor: pointer;
	    background-color: rgba(0, 0, 0, 0); 
	    color : black;
   		font-weight: 600;
	    border: 1px solid #2a2828;
	    border-radius: 5px;
	    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
	    text-shadow: 0px 0px 5px #ffffff; 
	    background-image: linear-gradient(to right, rgb(255, 255, 255, 0.8), rgb(255, 255, 255, 0.4), rgba(0, 0, 0, 0));
	}
		
		button:hover {
		    background-image: linear-gradient(to right, rgb(0, 0, 0,0.6), rgb(0, 0, 0,0.5), rgba(0, 0, 0,0.6));
		    text-shadow: 0px 0px 20px #ffffff;
		    color : white; 
			transition: background-color 0.8s;
		}

    .scroll-table {
        max-height: 427px; /* Adjust the max height as needed */
        overflow-y: auto;
    }
    h1{
    	color : white;
    	margin-left : 430px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Staff Details</h1>
        <div class="scroll-table">
            <table>
                <tr>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Department Name</th>
                </tr>
        <% 
        // JDBC driver name and database URL
        final String URL = "jdbc:mysql://localhost:3306/kaveri";
        final String USER = "root";
        final String PASSWORD = "reposeful";
        Connection conn = null;
        Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try {
            // Execute SQL query
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT staff_id, name, phone_no, gmail, subject, d_name FROM staff";
            ResultSet rs = stmt.executeQuery(sql);

            // Extract data from result set and display
            while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("staff_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("phone_no") %></td>
                    <td><%= rs.getString("gmail") %></td>
                    <td><%= rs.getString("subject") %></td>
                    <td><%= rs.getString("d_name") %></td>
                </tr>
                <%
            }
            // Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch(SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch(Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // Finally block used to close resources
            try {
                if(stmt!=null) stmt.close();
            } catch(SQLException se2) {
            } // Nothing we can do
            try {
                if(conn!=null) conn.close();
            } catch(SQLException se) {
                se.printStackTrace();
            } // End finally try
        } // End try
        %>
    </table>
</div>

<div class="options">
    <button onclick="location.href='insert_staff.jsp'">Insert New Staff</button>
    <button onclick="location.href='update_staff.jsp'">Update Staff</button>
    <button onclick="location.href='delete_staff.jsp'">Delete Staff</button>
</div>
</div>
</body>
</html>
