<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
}
%>

<html>
<head>
<title>Admin Dashboard - Pending Leave Requests</title>

<style>
body {
    font-family: Arial;
    background: #f4faff;
    margin: 0;
}
h2 {
    text-align: center;
    padding: 15px;
    background: #0073e6;
    color: white;
    margin: 0;
}

.logout {
    float: right;
    margin: 15px;
    padding: 10px 18px;
    background: #ff4444;
    color: white;
    border-radius: 8px;
    text-decoration: none;
}
.logout:hover {
    background: #cc0000;
}

table {
    width: 90%;
    margin: 30px auto;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
}

th {
    background: #0099ff;
    color: white;
    padding: 12px;
    text-align: center;
}

td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background: #f1faff;
}

.btn {
    padding: 7px 15px;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
}

.approve { background: #28a745; }
.reject { background: #dc3545; }
.disabled { background: gray !important; cursor: not-allowed; }
</style>

</head>

<body>

<a class="logout" href="adminLogin.jsp">Logout</a>

<h2>Pending Leave Requests</h2>

<table>
<tr>
<th>ID</th>
<th>Employee ID</th>
<th>From</th>
<th>To</th>
<th>Reason</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM leaves ORDER BY id DESC");

    while(rs.next()) {

        String status = rs.getString("status");   // <-- FIXED
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getInt("emp_id")%></td>
<td><%=rs.getString("from_date")%></td>
<td><%=rs.getString("to_date")%></td>
<td><%=rs.getString("reason")%></td>

<td>
<% if(status.equalsIgnoreCase("Pending")) { %>
    <span style="color:#ff9900;font-weight:bold;">Pending</span>
<% } else if(status.equalsIgnoreCase("Approved")) { %>
    <span style="color:green;font-weight:bold;">Approved</span>
<% } else { %>
    <span style="color:red;font-weight:bold;">Rejected</span>
<% } %>
</td>

<td>
<% if(status.equalsIgnoreCase("Pending")) { %>

    <a href="updateLeave.jsp?id=<%=rs.getInt("id")%>&action=approve">
        <button class="btn approve">Approve</button>
    </a>

    <a href="updateLeave.jsp?id=<%=rs.getInt("id")%>&action=reject">
        <button class="btn reject">Reject</button>
    </a>

<% } else { %>

    <button class="btn disabled">No Action</button>

<% } %>
</td>
</tr>

<%
    }
    con.close();
} catch(Exception e){
    out.println(e);
}
%>

</table>

</body>
</html>
