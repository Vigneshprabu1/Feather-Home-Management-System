<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home Management System |Milk & NewsPaper</title>

    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/form-loginn.css">
    <script>
        function myFunction() {
            window.print();
        }
    </script>

</head>


   
    <body >
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <img style="margin-top: 30px" src="assets/img/logo.png" /><br>
    <ul class="nav navbar-nav">
        <h2>Monthly Bill</h2>
    </ul>
  </div>
</nav>
<%!String hnumber;%>
<%!String hname;%>
<% String emailId=(String)session.getAttribute("emailid");
        session.setAttribute("emailid",emailId);
try{ 
    String connectionURL="jdbc:mysql://localhost:3306/shinelogics";
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   
    Connection connection=DriverManager.getConnection(connectionURL,"root","admin");
        
    
    if(connection !=null){

String   queryString="SELECT house_number,house_owner_name FROM user_details where email_id='"+emailId+"' "; 
 Statement statement = connection.createStatement();
 ResultSet rs1= statement.executeQuery(queryString);

while(rs1.next()){

     hnumber=rs1.getString("house_number");
    hname=rs1.getString("house_owner_name");
      
        }
  }
else
   out.println(connection);
}catch(Exception e){
out.println("database!!!\n"+e);
}
//session.setAttribute("hnum",hnumber);
//session.setAttribute("hname",hname);
 %>

<div align="center"  class="main-content">

        <!-- You only need this form and the form-login.css -->

        

            <div align="center" class="form-log-in-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Milk & News Paper</h1>
                    </div>
                    <form name="signup" method="post" action="MilkUpdate.jsp" >
                    <div class="form-row">
                        <label>
                            <span>Home Number</span>
                            <input class="form-control" type="text" name="Hnumber" value='<%=hnumber %>' readonly  />
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>House Owner name</span>
                            <input class="form-control" type="text" name="HownerName" value='<%=hname %>' readonly/>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Milk Brand</span>
                            <select name="Milk" class="form-control">
                                <option value="1">Aavin</option>
                                <option value="2">Arokya</option>
                                <option value="3">Kavins</option>
                            </select>
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Quantity</span>
                            <input class="form-control" type="text" name="quantity" required />
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>News Paper - Brand</span>
                            <select name="Newspaper" class="form-control">
                                <option value="1">Hindu</option>
                                <option value="2">Dinakaran</option>
                                <option value="3">Dhinadhanthi</option>
                            </select>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>News Paper - Language</span>
                            <select name="Newspaper_Lang" class="form-control">
                                <option value="1">Tamil</option>
                                <option value="2">English</option>
                            </select>
                        </label>
                    </div>

                    <button type="submit" name="signup" class="btn btn-info" id="submit">Submit </button>
                </form>
                                   
                         <button style="margin-left: 40px" type="button" name="signup" onclick="location.href='change.jsp'" id="submit">Pause </button>
                         <button type="button" name="signup" onclick="location.href='change.jsp'" id="submit">Change </button>
                         
                         <button style="margin-right: 40px" type="button"  onclick="location.href='Services.jsp'" id="submit">Back</button>
                    
            </div>
          </div>
    <!-- CONTENT-WRAPPER SECTION END-->
 <footer style="background-color: white;margin-bottom: -20px">
        <div class="col-md-12">
            <br>
            &copy; 2018 Feather Home Management System <br><br>
        </div>
</footer>
<!-- FOOTER SECTION END-->

</body>
</html>
