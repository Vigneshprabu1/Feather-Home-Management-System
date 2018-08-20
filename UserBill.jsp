<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Home Management System | Bill Display</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script>
        function myFunction() {
            window.print();
        }
    </script>

</head>
<body>
<%!String emailId;%>
<%!String milkBill;%>
<%!String newsPaper;%>
<%
String emailId=(String)session.getAttribute("emailid");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics","root","admin"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from user where email_id='"+emailId+"'"); 
while(rs.next()) 
{
emailId=rs.getString("email_id");
milkBill=rs.getString("MilkBill");
newsPaper=rs.getString("NewspaperBill");
}
%>
<!------MENU SECTION START-->
<div class="navbar navbar-inverse set-radius-zero" >
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" >

                    <img src="assets/img/logo.png" />
                </a>

            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->
        <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">                        
                          
                          

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>


<!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Monthly Bill </h4>
                
                </div>

            </div>
        <div class="row">
           
        <div class="col-md-9 col-md-offset-1">
            <div class="panel panel-info">
                <div class="panel-heading">
                    Current Month Bill
                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <label>Email Id</label>
                            <input class="form-control" type="text" id="housenumber" name="housenumber" value='<%=emailId%>' readonly/>
                        </div>


                        <div class="form-group">
                            <label>Milk Bill</label>
                            <input class="form-control" type="text" name="houseownername" value='<%=milkBill%>' readonly />
                        </div>

                        

                        <div class="form-group">
                            <label>News Paper Bill</label>
                            <input class="form-control" type="text" name="monthlywaterbill" value='<%=newsPaper%>' readonly/>
                        </div>

                        <center><button type="button"  class="btn btn-info" onclick="myFunction()" >Print Bill</button>
                        <button type="buton"  class="btn btn-info" onclick="location.href='Services.jsp'" id="submit">Back</button></center>

                </div>
            </div>
        </div>
        </div>
        </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
     <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   &copy; 2018 Home Management System 
                </div>

            </div>
        </div>
    </section>
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
