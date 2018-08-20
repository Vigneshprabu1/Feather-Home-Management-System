<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<%!int count;%>
<%
int Aavin=40,Kavins=41,Arokya=39,Cost_milk=0;
int Hindu=8,Thinakaarn=5,Dhanathanthi=5,Cost_paper=0;
int mb=0,np=0;
String emailId=(String)session.getAttribute("emailid");
session.setAttribute("emailid",emailId);
//String Home_Number=request.getParameter("Hnumber");
//String Home_Ownername=request.getParameter("HownerName");
String Milk_brand =request.getParameter("milk_brand");
int mbb=Integer.parseInt(Milk_brand);
String quan=request.getParameter("quantity");
int quant=Integer.parseInt(quan);
String NewsPaper =request.getParameter("Newspaper");
int npp=Integer.parseInt(Milk_brand);
/* out.println(Home_Number);
out.println(Home_Ownername);
out.println(Milk_brand);
out.println(quan);
out.println(quant);
out.println(NewsPaper);
*/


switch(mbb){
case 1:
	Cost_milk=Aavin*quant*30;
		//out.println(Cost_milk);
		mb=Aavin;
break;
case 2:
	Cost_milk=Arokya*quant*30;
	//out.println(Cost_milk);
	mb=Arokya;
break;
case 3:
	Cost_milk=Kavins*quant*30;
	//out.println(Cost_milk);
	mb=Kavins;
break;
}
switch(npp){ 
case 1:
	Cost_paper=Hindu*30;
	//out.println(Cost_paper);
	np=Hindu;
break;
case 2:
	Cost_paper=Thinakaarn*30;
	//out.println(Cost_paper);
	np=Thinakaarn;
	break;
case 3:
	Cost_paper=Dhanathanthi*30;
	//out.println(Cost_paper);
	np=Dhanathanthi;
break;
}
//String MonthlyBills=""+(Cost_milk + Cost_paper)+"";
//out.println(MonthlyBills);

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics", "root", "admin");
Statement st=conn.createStatement();

int i=st.executeUpdate ("insert into user(email_id,Milk,Newspaper,MilkBill,NewspaperBill)values( '"+emailId+"','"+mb+"','"+np+"','"+Cost_milk+"','"+Cost_paper+"') ");
if(i!=0){
	count++;
	response.sendRedirect("Services.jsp");
}
if(count==0){
	response.sendRedirect("Milk.jsp");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>

</body>
</html>