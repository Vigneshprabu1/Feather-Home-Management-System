<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%!int water=0;%>
<%!int newsPaper=0;%>
<%!int milk=0;%>
<%!int houseRent=0;%>
<%!int houseSale=0;%>
<%
String emailId=request.getParameter("userid");
String password=request.getParameter("password");
String houseOwnerName=request.getParameter("houseownername");
String houseNumber=request.getParameter("housenumber");
String houseMembers=request.getParameter("housemembers");
String mobileNumber=request.getParameter("mobilenumber");
String[] waterArray=request.getParameterValues("service");
String houseType=request.getParameter("housetype");
String rentSalesAmount=request.getParameter("rentsalesamount");
String house=request.getParameter("house");
if (house.equals("rent")) {
  houseRent =1;
}
else if(house.equals("sale")){
  houseSale=1;
}
if (waterArray != null) 
   {
      for (int i = 0; i < waterArray.length; i++) 
      {
         if(waterArray[i].equals("water")){
         	water=1;
         }
         else if(waterArray[i].equals("milk")){
         	milk=1;
         }
         else if(waterArray[i].equals("newspaper")){
         	newsPaper=1;
         }
      }
   }
int updateQueryUser=0;
int updateQueryWater=0;
int updateQueryWaterPrint=0;
String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
int updateQuery=0;
if(emailId!=null ||emailId !="" && password !=null || password !="" && houseOwnerName !=null || houseOwnerName !="" && houseNumber !=null || houseNumber !=""  && houseMembers !=null || houseMembers !=""){
  
	try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection connection=DriverManager.getConnection(connectionURL,"root","admin");
	    if(connection !=null){
	    out.println("connected");
      Statement statement = connection.createStatement();
  
      updateQueryUser=statement.executeUpdate("INSERT INTO user_details(email_id,password,house_number,house_owner_name,mobile_number,house_members_count,house_type,rent,sale,rent_sale_amount,water,newsPaper,milk) VALUES('"+emailId+"','"+password+"','"+houseNumber+"','"+houseOwnerName+"','"+mobileNumber+"','"+houseMembers+"','"+houseType+"','"+houseRent+"','"+houseSale+"','"+rentSalesAmount+"','"+water+"','"+newsPaper+"','"+milk+"')");
       
     updateQueryWater=statement.executeUpdate("INSERT INTO billing_details(email_id) VALUES('"+emailId+"')"); 
     
     updateQueryWaterPrint=statement.executeUpdate("INSERT INTO print_details(email_id) VALUES('"+emailId+"')"); 
     updateQueryWaterPrint=statement.executeUpdate("INSERT INTO user(email_id) VALUES('"+emailId+"')"); 
       
       
        if(updateQueryUser !=0 && updateQueryWater!=0 && updateQueryWaterPrint!=0){
	       response.sendRedirect("UserLogin.html");  
        }
        else{
	       response.sendRedirect("UserRegister.jsp");  
        }
       }
    }catch(Exception e){
    out.println(e);
	   out.println("Unable to connect to database!!!\n");
    }
  }
  else{ 
      response.sendRedirect("UserRegister.jsp");
  }
%>
</body>
</html>