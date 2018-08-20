<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.utill.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*" %>

<% 
		String title = request.getParameter("title");
		String desc = request.getParameter("desc");
		String conection_url="jdbc:mysql://localhost:3306/shinelogics";
		String users = request.getParameter("users");
		String[] userlist = users.split("\\,");
		try{
			Class.forName("com.mysql.jdbc.Driver");
	
	        // Open a connection
	        Connection conn = DriverManager.getConnection(conection_url, "root", "admin");
	
	        // Execute SQL query
	        Statement stmt = conn.createStatement();
	        String sql;
	        if(userlist !=null){
	        for(int i=0;i<userlist.length;i++){
		        sql = "insert into announce values('"+userlist[i]+"','"+title+"','"+desc+"');";
		        stmt.executeUpdate(sql);
	        }
	        }
	        else{
	        out.println("error");
	        }
	        RequestDispatcher view=request.getRequestDispatcher("GridDisplay.jsp");
            view.forward(request,response);
		}catch(Exception e){
			e.printStackTrace();
		}





%>