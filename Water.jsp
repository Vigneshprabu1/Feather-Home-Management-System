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
String emailId=request.getParameter("emailid");

String number;
int count=0;
String name;
int initial_reading;
String queryString=null;
Connection connection=null;
String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(emailId!=null && emailId!=null){
	try{
	 connection=DriverManager.getConnection(connectionURL,"root","admin");
	 if(connection!=null){
	 out.println("Connected");
     queryString="SELECT user_details.house_number,user_details.house_owner_name,billing_details.initial_water_reading FROM user_details inner join billing_details WHERE user_details.email_id='"+emailId+"' AND billing_details.email_id='"+emailId+"'"; 
     Statement statement = connection.createStatement();
	 ResultSet rs= statement.executeQuery(queryString);
    while(rs.next()){
		 number=rs.getString("house_number");
	     name=rs.getString("house_owner_name");
		 initial_reading=rs.getInt("initial_water_reading");
session.setAttribute("name",name);
session.setAttribute("number",number);
session.setAttribute("reading",initial_reading);
session.setAttribute("emailid",emailId);
		if(number!=null && name!=null){
		      count++;
		      response.sendRedirect("WaterCalculate.jsp");  
		 }
		 }

		if(count==0){
		  response.sendRedirect("GridDisplay.jsp"); 		
	    }
	}
   }catch(Exception e){
   out.println(e);
	out.println("Unable to check with database");
   }

}
else{
	response.sendRedirect("GridDisplay.jsp");		
}
%>
</body>
</html>