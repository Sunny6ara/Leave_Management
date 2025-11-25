<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

PreparedStatement ps = con.prepareStatement("UPDATE leave_requests SET status='rejected' WHERE id=?");
ps.setInt(1, id);
ps.executeUpdate();

con.close();
response.sendRedirect("pendingRequests.jsp");
%>
