# Attendance Management System

## Introduction
This is an Attendance Management System implemented in Java using JSP (JavaServer Pages) and Servlet. The system aims to provide a convenient and efficient way to manage attendance records for various purposes, such as in educational institutions or workplaces.

## Project Structure
The project is organized into the following folders:

- **Bean**: Contains JavaBeans classes used for data representation and manipulation.
- **Controller**: Houses the Servlet classes responsible for handling HTTP requests and responses.
- **DAO (Data Access Object)**: Contains classes responsible for interacting with the database, including CRUD operations.
- **Services**: Includes classes for implementing business logic and services required by the system.
- **Util**: Contains utility classes and helper functions used across the project.

## Database Setup
1. **Prerequisites**: Ensure you have a compatible relational database management system (e.g., MySQL, PostgreSQL) installed on your system.
2. **Table Creation**: Execute the following SQL commands to create the necessary tables in your database:

    #### 1) Dept Table
    CREATE TABLE dept (
        d_name VARCHAR(255) NOT NULL,
        PRIMARY KEY (d_name)
    );

    #### 2) Student Table
    CREATE TABLE Student (
        stud_id INT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        phone_no VARCHAR(20),
        gender VARCHAR(10),
        d_name VARCHAR(255),
        FOREIGN KEY (d_name) REFERENCES dept(d_name)
    );
    
    #### 3) Staff Table
    CREATE TABLE Staff (
        staff_id INT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        phone_no VARCHAR(20),
        gmail VARCHAR(255),
        subject VARCHAR(255),
        d_name VARCHAR(255),
        FOREIGN KEY (d_name) REFERENCES dept(d_name)
    );
    
    #### 4) Attendance Table
    CREATE TABLE Attendance (
        stud_id INT,
        d_name VARCHAR(255),
        staff_id INT,
        subject VARCHAR(255),
        attendance_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (stud_id) REFERENCES Student(stud_id),
        FOREIGN KEY (d_name) REFERENCES dept(d_name),
        FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
    );



## Setup and Deployment
1. **Prerequisites**: Ensure you have Java Development Kit (JDK) and Apache Tomcat installed on your system.
2. **Database Setup**: Set up your database according to the table creation commands mentioned in the `Database Setup` section.
3. **Deploying the Application**: Deploy the project on a servlet container such as Apache Tomcat by placing the WAR (Web Application Archive) file in the `webapps` directory of Tomcat.
4. **Accessing the Application**: Once deployed, access the application through your web browser using the appropriate URL.

## Contact Information
For any inquiries or issues regarding the project, please contact reposeful8887@gmail.com
