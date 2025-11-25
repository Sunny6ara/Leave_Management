<%@ page import="java.sql.*" %>
<html>
<head>
<title>Admin Login</title>
<style>
body { font-family: Arial; background:#f9f0ff; text-align:center; margin-top:70px; }
.box { background:white; width:350px; margin:auto; padding:25px; border-radius:10px; box-shadow:0 0 10px gray; }
input,button { width:90%; padding:10px; margin:10px; }
button { background:purple; color:white; border:none; border-radius:6px; }
</style>
</head>

<body>
<div class="box">
<h2>Admin Login</h2>

<form method="post">
<input type="text" name="username" placeholder="Username">
<input type="password" name="password" placeholder="Password">
<button type="submit">Login</button>
</form>
</div>

<%
if(request.getMethod().equals("POST")) {
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    if(u.equals("admin") && p.equals("admin123")) {
        session.setAttribute("admin", "yes");
        response.sendRedirect("adminDashboard.jsp");
    } else {
        out.print("<p style='color:red'>Wrong Credentials!</p>");
    }
}
%>

</body>
</html>
