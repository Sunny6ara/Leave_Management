<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("empId")==null){
    response.sendRedirect("index.jsp");
}
%>

<html>
<head>
<title>Apply Leave</title>

<style>
body{font-family:Arial;text-align:center;margin-top:50px;}
textarea,input,button{width:70%;padding:10px;margin:8px;}
button{background:green;color:white;border:none;border-radius:6px;}
</style>

</head>

<body>

<h2>Apply for Leave</h2>

<form method="post">
    From Date: <input type="date" name="from"><br>
    To Date: <input type="date" name="to"><br>
    Reason:<br>
    <textarea name="reason"></textarea><br>
    <button type="submit">Submit</button>
</form>

<%
if(request.getMethod().equals("POST")) {

    int id = (int)session.getAttribute("empId");
    String f = request.getParameter("from");
    String t = request.getParameter("to");
    String r = request.getParameter("reason");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO leaves(emp_id,from_date,to_date,reason,status) VALUES(?,?,?,?,?)");

        ps.setInt(1,id);
        ps.setString(2,f);
        ps.setString(3,t);
        ps.setString(4,r);
        ps.setString(5,"Pending");

        ps.executeUpdate();

        out.println("<p style='color:green'>Leave Request Submitted!</p>");

    } catch(Exception e){ out.println(e); }
}
%>

</body>
</html>
