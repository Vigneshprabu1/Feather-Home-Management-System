<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
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
    <title>Home Management System | Calculation</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<script lanugage=javascript runat=server>
  function add() {
    var ini = parseInt(document.getElementById('initialreading').value);
    var fin = parseInt(document.getElementById('endreading').value);
    var cal=fin-ini;   
    document.getElementById("demo").value = cal;
  }
  function mul() {
    var cpl = parseInt(document.getElementById('currentcost').value);
    var tot= parseInt(document.getElementById('demo').value);
    var cal2=cpl*tot;   
    document.getElementById("demo2").value = cal2;
  }
</script>  

</head>
<body>
<%
  String name=(String)session.getAttribute("name");
  String number=(String)session.getAttribute("number");
  int initialReading=(Integer)session.getAttribute("reading");
  
  String emailId=(String)session.getAttribute("emailid");
  session.setAttribute("emailid",emailId);
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
                
                </div>

            </div>
        <div class="row">
           
        <div class="col-md-9 col-md-offset-1">
            <div class="panel panel-info">
                <div class="panel-heading">
                    Water Bill Calculation 
                </div>
                <div class="panel-body">
                    <form name="signup" method="post" action="WaterUpdate.jsp">
                        <div class="form-group">
                            <label>House Number</label>
                            <input class="form-control" type="text" id="housenumber" name="housenumber" value='<%=number%>' readonly />
                        </div>


                        <div class="form-group">
                            <label>House Owner Name</label>
                            <input class="form-control" type="text" name="houseownername" value='<%=name%>' readonly />
                        </div>

                        <center> Water Consumption Reading </center>

                        <div class="form-group">
                            <label>Initial Reading (in litre) </label>
                            <input class="form-control" type="text" name="initialreading" id="initialreading" value='<%=initialReading%>' readonly />
                        </div>

                        <div class="form-group">
                            <label>End Reading (in litre) </label>
                            <input class="form-control" type="number" name="endreading" id="endreading" />
                        </div>

                        <center><button type="button" onclick="add()" class="btn btn-info">Calculate </button></center>

                        <div class="form-group">
                            <label>Total Consumption For Month</label>
                            <input class="form-control" type="text" name="totalconsumpion" id="demo" />
                        </div>

                        <div class="form-group">
                            <label>Current Cost/Litre</label>
                            <input class="form-control" type="number" name="currentcost" id="currentcost" />
                        </div>

                        <center><button type="button" onclick="mul()" class="btn btn-info">Total Bill </button></center>

                        
                        <div class="form-group">
                            <label>Bill Amount per Month</label>
                            <input class="form-control" type="number" id="demo2" name="monthlywaterbill" />
                        </div>            
                    

                        <center><button type="submit" name="signup" class="btn btn-info" id="submit">Update</button>&nbsp;<button type="button" onclick="location.href='GridDisplay.jsp'"  class="btn btn-danger">Back </button></center>

                    </form>
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
                   &copy; 2018 Feather Home Management System 
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
