<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page session="true"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%!String email;%>
	<%!int count=0;%>
	<%!int queryUpdate=0;%>

<%
String emailId =(String)request.getParameter("emailid");
String password =(String)request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/shinelogics";


String query="select email_id from user_details where email_id='"+emailId+"'";
Connection conn=DriverManager.getConnection(url,"root","admin");
if(conn!=null){
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{ 
	 count++;
}
if(count!=0){
	queryUpdate=stmt.executeUpdate("update user_details set password='"+password+"' where email_id='"+emailId+"' ");
	out.println("<script type=\"text/javascript\">");
   out.println("alert('Password updated successfully');");
   out.println("location='UserLogin.html';");
   out.println("</script>");
}
else
{
   out.println("<script type=\"text/javascript\">");
   out.println("alert('EmailId is not exist');");
   out.println("location='UserLogin.html';");
   out.println("</script>");
}
if(queryUpdate!=0){
	response.sendRedirect("UserLogin.html");
}
}
}catch(SQLException e){
	e.printStackTrace();
}
%>

</body>
</html>>