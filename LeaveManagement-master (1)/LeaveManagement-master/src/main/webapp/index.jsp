<%@ page import="java.sql.*" %>
<html>
<head>
<title>Employee Login</title>
<style>
body { font-family: Arial; background:#eef2ff; text-align:center; padding-top:60px; }
.box { background:white; width:350px; margin:auto; padding:25px; border-radius:12px; box-shadow:0 0 10px gray; }
input { width:90%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid gray; }
button { padding:10px 20px; background:blue; color:white; border:none; border-radius:6px; cursor:pointer; }
a { text-decoration:none; color:blue; }
</style>
</head>

<body>
<div class="box">
<h2>Employee Login</h2>

<form method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

<br>
<a href="adminLogin.jsp">Admin Login</a>
</div>

<%
if(request.getMethod().equals("POST")) {
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM employees WHERE username=? AND password=?");
        ps.setString(1, user);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            session.setAttribute("empId", rs.getInt("id"));
            response.sendRedirect("empDashboard.jsp");
        } else {
            out.println("<p style='color:red'>Invalid Login!</p>");
        }
    } catch(Exception e) { out.println(e); }
}
%>
</body>
</html>
