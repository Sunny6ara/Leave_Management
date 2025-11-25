<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("empId")==null){
    response.sendRedirect("index.jsp");
}
int eid = (int)session.getAttribute("empId");
%>

<html>
<head>

<title>Leave History</title>

<style>
table{width:90%;margin:auto;border-collapse:collapse;}
td,th{border:1px solid gray;padding:10px;text-align:center;}
</style>

</head>

<body>

<h2>Your Leave History</h2>

<table>
<tr>
<th>ID</th>
<th>From</th>
<th>To</th>
<th>Reason</th>
<th>Status</th>
</tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM leaves WHERE emp_id=?");

    ps.setInt(1,eid);

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("from_date")%></td>
<td><%=rs.getString("to_date")%></td>
<td><%=rs.getString("reason")%></td>
<td><%=rs.getString("status")%></td>
</tr>

<%
    }

}catch(Exception e){ out.println(e); }
%>

</table>

</body>
</html>
