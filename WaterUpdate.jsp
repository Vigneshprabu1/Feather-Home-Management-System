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
String emailId=(String)session.getAttribute("emailid");
String endWaterReading=request.getParameter("endreading");
String totalConsumption=request.getParameter("totalconsumpion");
String monthlyWaterBill=request.getParameter("monthlywaterbill");
int updateQueryBill=0;
int updateQueryPrint=0;
Connection connection=null;
int count=0;
String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(emailId!="" && emailId!=null){
	try{
	 connection=DriverManager.getConnection(connectionURL,"root","admin");
	 if(connection!=null){
	 out.println("Connected");
         Statement statement = connection.createStatement();
         
updateQueryBill=statement.executeUpdate("insert into billing_details(email_id,initial_water_reading,total_consumption_month,total_cost_month) values('"+emailId+"','"+endWaterReading+"','"+totalConsumption+"','"+monthlyWaterBill+"')");
 //statement.executeUpdate(queryString);

  updateQueryPrint=statement.executeUpdate("UPDATE print_details set initial_water_reading='"+endWaterReading+"',total_consumption_month='"+totalConsumption+"',total_cost_month='"+monthlyWaterBill+"' where email_id='"+emailId+"'");
 //statement.executeUpdate(queryStringUpdate);
 if(updateQueryBill!=0 && updateQueryPrint!=0){
		count++;
		  response.sendRedirect("GridDisplay.jsp"); 		
}
		 }

	}
   catch(Exception e){
   out.println(e);
	out.println("Unable to check with database");
   }

}
else{
	response.sendRedirect("LoginWater.jsp");		
}
%>
</body>
</html>