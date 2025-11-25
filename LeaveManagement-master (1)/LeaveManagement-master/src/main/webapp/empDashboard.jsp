<%
Integer empId = (Integer) session.getAttribute("empId");
if(empId == null){
    response.sendRedirect("index.jsp");
    return;
}
%>

<html>
<head>
<title>Employee Dashboard</title>
<style>
body {font-family:Arial;background:#eaffea;text-align:center;margin-top:50px;}
a {display:block;margin:15px;font-size:20px;}
</style>
</head>

<body>
<h2>Welcome Employee</h2>

<a href="applyLeave.jsp">Apply Leave</a>
<a href="viewLeaveHistory.jsp">View Leave History</a>
<a href="index.jsp">Logout</a>
</body>
</html>
