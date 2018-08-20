<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>WATER BILL</title>
</head>
<body>
<%
//String houseNumber=request.getParameter("housenumber");
//String houseOwnerName=request.getParameter("houseownername");
String emailId=(String)session.getAttribute("emailid");
int count=0;
String number;
String name;
int litre;
int cost;
int cons;
String queryString=null;
Connection connection=null;
String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(emailId!=null && emailId!=""){
	//if(houseNumber!="" && houseOwnerName!=""){
	try{
	 connection=DriverManager.getConnection(connectionURL,"root","admin");
	 if(connection!=null){
	 out.println("Connected");
	 /*
queryString="SELECT house_number,house_owner_name,initial_water_reading,total_consumption_month,total_cost_month FROM billing_details WHERE house_number='"+houseNumber+"'";
 */

queryString="SELECT user_details.house_number,user_details.house_owner_name,print_details.initial_water_reading,print_details.total_consumption_month,print_details.total_cost_month FROM user_details inner join print_details WHERE user_details.email_id='"+emailId+"' AND print_details.email_id='"+emailId+"'";
 out.println("Connected");
Statement statement = connection.createStatement();
	 ResultSet rs= statement.executeQuery(queryString);
while(rs.next())
{
number=rs.getString("house_number");
name=rs.getString("house_owner_name");
cons=rs.getInt("initial_water_reading");
litre=rs.getInt("total_consumption_month");
cost=rs.getInt("total_cost_month");
 
session.setAttribute("name",name);
session.setAttribute("number",number);
session.setAttribute("litre",litre);
session.setAttribute("cost",cost);

if(name.equals(name)){
		      count++;
		      response.sendRedirect("UserDisplay.jsp");  
		    }
		 }

		if(count==0){

		  response.sendRedirect("Services.jsp"); 		
	    }
   }
}
catch(Exception e)
    {
out.println(e);
out.println("Unable to connect to database");
    }
}

else{
	response.sendRedirect("Services.jsp");
}
%>
</body>
</html>