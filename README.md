This project is a web-based application that allows employees to apply for leave and track their leave status. It includes modules such as Employee Login, Apply Leave, Dashboard, Leave History, Admin Login, Pending Leave Requests, and Admin Approval/Rejection. Admin can approve or reject leave requests, and employees can view their leave record online. The system uses JSP, JDBC, and MySQL for backend processing.
📌 Features
🔹 Employee Management

Add, update, delete, and view employee details.

Maintain employee roles and profile information.

🔹 Employee Login

Secure login system for employees.

Employees can apply for leave.

View leave status (Pending / Approved / Rejected).

Check complete leave history.

🔹 Admin Login

Admin authentication with dedicated dashboard.

Approve or reject employee leave requests.

Manage all employee records.

Track and monitor overall leave activity.

🔹 Leave Tracking

Submit leave applications with reason and date range.

Real-time status updates.

Admin can view all leave requests and update them.

🛠️ Technologies Used

Backend: Java Servlets, JDBC

Frontend: JSP, HTML, CSS

Build Tool: Maven

Database: MySQL

Server: Apache Tomcat

IDE: IntelliJ IDEA / Eclipse

🗄️ Database Setup

Create a database:

CREATE DATABASE leave_management;


Import your SQL schema:

leave_management.sql


Update DB credentials in:

src/main/java/com/employee/util/DBConnection.java


2. Configure Database

Update DB username/password in DBConnection.java.

3. Build Using Maven
mvn clean package

4. Deploy on Apache Tomcat

Copy the generated WAR file from
target/LeaveManagement.war
to Tomcat’s webapps folder.

Start Tomcat.

5. Access Application
http://localhost:8080/LeaveManagement

👨‍💻 Default Login Credentials (optional section)

You can edit/remove this:

Admin Login

Username: admin

Password: admin123

Employee Example

Username: employee1

Password: emp@123

📜 License

This project is open-source and free to use.
