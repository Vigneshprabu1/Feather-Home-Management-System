<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
String emailId=request.getParameter("userid");
String password=request.getParameter("password");
int count=0;
String queryString=null;
Connection connection=null;
String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(emailId!=null && password!=null){
	if(emailId!="" && password!=""){
	try{
	 connection=DriverManager.getConnection(connectionURL,"root","admin");
	 if(connection!=null){
     queryString="SELECT email_id,password,house_number FROM user_details"; 
     Statement statement = connection.createStatement();
	 ResultSet rs= statement.executeQuery(queryString);
    while(rs.next()){
    	
		String name=rs.getString("email_id");
		String pass=rs.getString("password");
		String hno=rs.getString("house_number");
		if(emailId.equals(name)){
		    if(password.equals(pass)){
		    session.setAttribute("emailid",name);  
		    session.setAttribute("house",hno);
		      count++;
		      response.sendRedirect("Services.jsp");  
		    }
		}
		 }
		if(count==0){
		  response.sendRedirect("UserLogin.html");		
	    }
   

	}
   }catch(Exception e){
   out.println(e);
	out.println("Unable to check with database");
   }
}
}
else{
	response.sendRedirect("UserLogin.html"); 		
}
%>
</body>
</html>