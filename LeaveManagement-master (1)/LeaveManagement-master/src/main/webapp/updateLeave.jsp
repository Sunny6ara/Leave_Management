<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String action = request.getParameter("action");

String status = "";

if(action.equals("approve")){
    status = "Approved";
}
else if(action.equals("reject")){
    status = "Rejected";
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/leave_mgmt",
    "root",
    "admin"
);

PreparedStatement ps = con.prepareStatement(
    "UPDATE leaves SET status=? WHERE id=?"
);

ps.setString(1, status);
ps.setInt(2, id);
ps.executeUpdate();

con.close();
response.sendRedirect("adminDashboard.jsp");
%>
