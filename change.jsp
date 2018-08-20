<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home Management System | Milk & NewsPaper</title>

    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/form-login.css">
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
</nav><% String hnumber=null;
String emailId=(String)session.getAttribute("emailid");
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
     String hname=rs1.getString("house_owner_name");
      
        }}
else
   out.println(connection);
}catch(Exception e){
out.println("database!!!\n"+e);
}


%>
<div align="center"  class="main-content">
  <div align="center"  class="form-log-in-with-email">
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
                            <span>Milk - Pause Days</span>
                            <input class="form-control" type="text" name="text_pause_Milk" required />
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Milk Brand</span>
                            <select name="milk_brand" class="form-control">
                                <option value="1">Aavin</option>
                                <option value="2">Arokya</option>
                                <option value="3">Kavins</option>
                            </select>
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Milk - Change Quantity</span>
                            <input class="form-control" type="text" name="quantity" required />
                        </label>
                    </div>

                     <div class="form-row">
                        <label>
                            <span>News Paper - Pause Days</span>
                            <input class="form-control" type="text" name="text_pause_Newspaper" required />
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>News Paper - Change Brand</span>
                            <select name="newspaper_brand" class="form-control">
                                <option value="1">Hindu</option>
                                <option value="2">Dinakaran</option>
                                <option value="3">Dhinadhanthi</option>
                            </select>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>News Paper - Change Language</span>
                            <select name="newspaper_Lang" class="form-control">
                                <option value="1">Tamil</option>
                                <option value="2">English</option>
                            </select>
                        </label>
                    </div>

                    <button type="submit" name="signup" class="btn btn-info" id="submit">Submit </button>
                </form>
                                   
                        
                         
                         <button style="margin-left: : 40px" type="button"  onclick="location.href='Services.jsp'" id="submit">Back</button>
                    
            </div>
          </div>
      </div>
    <!-- CONTENT-WRAPPER SECTION END-->
     <footer style="background-color: white">
        <div class="col-md-12">
            <br>
            &copy; 2018 Feather Home Management System <br><br>
        </div>
</footer>s
<!-- FOOTER SECTION END-->

</body>
</html>
