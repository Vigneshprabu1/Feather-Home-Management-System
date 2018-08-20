<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page session="true"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User | Home Page</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style>

#table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#table td, #table th {
    border: 1px solid #ddd;
    padding: 8px;
}

#table tr:nth-child(even){background-color: #f2f2f2;}

#table tr:hover {background-color: #ddd;}

#table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #FF69B4;
    color: white;
}


</style>
</head>
<%@ page import="java.sql.*"%>
<body bgcolor="#E5E4E2">


  <form style="background-color: white"  class="modal-content animate" action="AdminLogin" method="post">
  <center><h2>Announcements and Events Frame</h2></center>
    <div class="container">
      	<table id="table">
          	<tr>
				<th>Title</th>
				<th>Description</th>

			</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/shinelogics";
String username="root";
String password="admin";
String usernam=(String)session.getAttribute("house");
String query="select title, description from announce where house_number='"+usernam+"'";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{ %>
		    <tr>
			    <td><%=rs.getString("title") %></td>
			    <td><%=rs.getString("description") %></td>
		    </tr>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
}
%>



    </table>
      	
        
      
      
    </div>

    <div class="container" >
      <button style="background-color:  #6caee0" type="button" onclick="location.href='Services.jsp'" class="cancelbtn">Back</button>
      
    </div>
  </form>
</div>

<script>
function exit(){
	window.location="index.jsp";
}
</script>


</body>
</html>