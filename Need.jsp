<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>


	<title></title>
</head>
<body>
<%String emailId=(String)session.getAttribute("emailid");
session.setAttribute("emailid",emailId);
	  int aavin=40,kavins=41,arokya=39,cost_milk=0,cost_paper=0;
	  int hindu=8,thinakaran=5,dhinamalar=6;
	 int updateQuery=0,milk_cost=0,news_cost=0;
	  int mo_milk=0,mo_news=0,milk_news=0,milk=0,news=0;
	   String hnumb=null,h_name=null;
	   String mb=null,np=null;

	String milk_bran=request.getParameter("milk_brand");
	String pause_m=request.getParameter("text_pause_Milk");
	int mbb=Integer.parseInt(milk_bran);
	
	String quan=request.getParameter("quantity");
	String  pause_n=request.getParameter("text_pause_Newspaper");
    String np_brand=request.getParameter("newspaper_brand");
    int npp=Integer.parseInt(np_brand);
    String np_lang=request.getParameter("newspaper_lang");
     int pause_milk=Integer.parseInt(pause_m);
	int quant=Integer.parseInt(quan);
	 int pause_news=Integer.parseInt(pause_n);
	try{
	
	switch(mbb){
	case 1:
			cost_milk=aavin*quant;
			out.println(cost_milk);
			mb="Aavin";
	break;
	case 2:
		cost_milk=arokya*quant;
		out.println(cost_milk);
		mb="Arokya";
	break;
	case 3:
		cost_milk=kavins*quant;
		out.println(cost_milk);
		mb="Kavins";
	break;
}
		switch(npp){
	case 1:
		cost_paper=hindu;
		np="Hindu";

	break;
	case 2:
		cost_paper=thinakaran;
		np="Thinakaran";
	break;
	case 3:
		cost_paper=dhinamalar;
		np="Dhinamalar";
		break;

}
}catch(Exception e)
	{
	
	out.println("Exception "+e);
}

try{ 
		String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
		
        Class.forName("com.mysql.jdbc.Driver").newInstance();
       
	    Connection connection=DriverManager.getConnection(connectionURL,"root","admin");
			
	    
	    if(connection !=null){

  String   queryString="SELECT Milk,NewsPaper,MilkBill,NewspaperBill FROM user where email_id='"+emailId+"' "; 
     Statement statement = connection.createStatement();
	 ResultSet rs1= statement.executeQuery(queryString);

    while(rs1.next()){
	
		
		milk=rs1.getInt("Milk");
		 news=rs1.getInt("NewsPaper");
		 mo_milk=rs1.getInt("MilkBill");
		 mo_news=rs1.getInt("NewspaperBill");	
		
		out.println(mo_milk);
		}}
	else
       out.println(connection);
}catch(Exception e){
	out.println("database!!!\n"+e);
    }
 if(pause_milk ==0 && pause_news==0)
		out.println("No Pause");
   else{
   out.println(" Pause");
   out.println("monthly milk bill"+mo_milk);
   milk_cost=mo_milk-milk*pause_milk ;
	out.println(milk_cost);
	news_cost=mo_news-news*pause_news ;
   	out.println(news_cost);
   }%>	
<%
  try{
		
	    
		String connectionURL="jdbc:mysql://localhost:3306/Register";
		
      Class.forName("com.mysql.jdbc.Driver").newInstance();
     
	    Connection connection=DriverManager.getConnection(connectionURL,"root","admin");
			
	    
	    if(connection !=null){

	    	String sql="Update user set MilkBill='"+milk_cost+"',NewspaperBill='"+news_cost+"' where email_id='"+emailId+"'";

      PreparedStatement ps=connection.prepareStatement(sql);
      
     int i= updateQuery=ps.executeUpdate();
      if(i!=0){
      response.sendRedirect("Services.jsp");
      }
     }
     else
     out.println("Unable to connect database");
  
  }catch(Exception e){
	   out.println("Unable to connect to database!!!\n"+e);
  }

  
  
  %>     
</body>
</html>