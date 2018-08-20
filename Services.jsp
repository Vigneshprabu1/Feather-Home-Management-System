<%@ page import="java.io.*"%>
<%@ page session="true"%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home Management System | User Dashboard</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" /> 
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>

<body>
<%
String emailId=(String)session.getAttribute("emailid");
session.setAttribute("emailid",emailId);
%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <img style="margin-top: 30px" src="assets/img/logo.png" /><br>
    <div align="right" >
   
       <a href="Logout.jsp">Log Out</a>
   
  </div>
</div>
</nav>
    <!-- <!--- MENU SECTION START-->
<!-- <div class="navbar navbar-inverse set-radius-zero" >
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
        <!-- <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">                        
                          
                            <li><a href="Logout.jsp">Log Out</a></li>
                          

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section> 
  -->
<!-- MENU SECTION END-->
<div class="content-wrapper">
<div class="container">
<div class="row pad-botm">
<div class="col-md-12">
<h4 class="header-line">USER Dashboard</h4>
</div>
</div>
             
<!--LOGIN PANEL START-->  

<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" >
    <center>
    <button type="submit" name="login" onclick="location.href='Value.jsp'"  class="btn btn-info">Water </button>
    <button type="submit" name="login" onclick="location.href='Milk.jsp'" class="btn btn-info">Milk/Newspaper</button>
    <%
    String hno=(String)session.getAttribute("house");
    session.setAttribute("house",hno);
    %>
    <button type="submit" name="login" onclick="location.href='userannounce.jsp'" class="btn btn-info">Announcements</button>
    </center>
</div>
</div>   
<!---LOGIN PABNEL END-->                   
 
    </div>
    </div>
<!-- CONTENT-WRAPPER SECTION END-->
      <footer style="background-color: #E5E4E2">
        <div class="col-md-12">
            <br>
            &copy; 2018 Feather Home Management System <br><br>
        </div>
</footer>
<!-- FOOTER SECTION END-->

    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>

</body>
</html>
