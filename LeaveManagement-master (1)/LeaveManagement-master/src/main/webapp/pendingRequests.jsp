<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("adminId") == null){
    response.sendRedirect("adminLogin.jsp");
}
%>

<html>
<head>
<title>Pending Leave Requests</title>

<style>
body {
    font-family: Arial;
    background: #f4faff;
    margin: 0;
    padding: 0;
}
h2 {
    text-align: center;
    background: #0073e6;
    padding: 15px;
    color: white;
    margin: 0;
}

table {
    width: 85%;
    margin: 30px auto;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
}
th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    text-align: center;
}
th {
    background: #0099ff;
    color: white;
}
tr:hover {
    background: #f1faff;
}

.btn {
    padding: 7px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    color: white;
}
.approve { background: #28a745; }
.reject { background: #dc3545; }
.disabled {
    background: gray !important;
    cursor: not-allowed;
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
</style>

</head>
<body>

<a class="logout" href="adminLogin.jsp">Logout</a>

<h2>Pending Leave Requests</h2>

<table>
<tr>
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
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_mgmt","root","admin");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM leave_requests ORDER BY id DESC");
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        String status = rs.getString("status");
%>

<tr>
    <td><%= rs.getInt("emp_id") %></td>
    <td><%= rs.getString("from_date") %></td>
    <td><%= rs.getString("to_date") %></td>
    <td><%= rs.getString("reason") %></td>
    <td style="font-weight:bold;">
        <% if(status.equals("pending")) { %>
            <span style="color:#ff9900;">Pending</span>
        <% } else if(status.equals("approved")) { %>
            <span style="color:green;">Approved</span>
        <% } else { %>
            <span style="color:red;">Rejected</span>
        <% } %>
    </td>

    <td>
        <% if(status.equals("pending")) { %>

            <a href="approveLeave.jsp?id=<%= rs.getInt("id") %>">
                <button class="btn approve">Approve</button>
            </a>

            <a href="rejectLeave.jsp?id=<%= rs.getInt("id") %>">
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
