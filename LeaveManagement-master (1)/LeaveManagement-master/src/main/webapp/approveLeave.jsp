<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String status = request.getParameter("status");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/leave_mgmt","root","admin");

    PreparedStatement ps = con.prepareStatement(
        "UPDATE leaves SET status=? WHERE id=?");

    ps.setString(1,status);
    ps.setInt(2,id);
    ps.executeUpdate();

    response.sendRedirect("adminDashboard.jsp");

}catch(Exception e){
    out.println(e);
}
%>
