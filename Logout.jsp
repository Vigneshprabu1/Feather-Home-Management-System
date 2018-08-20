<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page session="true"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>


<% 
session.invalidate();
response.sendRedirect("UserLogin.html");
%>

</body>
</html>