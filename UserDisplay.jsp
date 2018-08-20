<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home Management System | User Login</title>

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
</nav>
        <%
String number=(String)session.getAttribute("number");
String name=(String)session.getAttribute("name");
int litre=(Integer)session.getAttribute("litre");
int cost=(Integer)session.getAttribute("cost");
//int cons=(Integer)session.getAttribute("cons");
%>
    <div align="center"  class="main-content">

        <!-- You only need this form and the form-login.css -->

        

            <div class="form-log-in-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Current Month Bill</h1>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>House Number</span>
                            <input type="text" type="text" id="housenumber" name="housenumber" value='<%=number%>' readonly/>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>House Owner Name</span>
                            <input type="text" name="houseownername" value='<%=name%>' readonly />
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Total Consumption For Month</span>
                            <input  type="text" name="totalconsumpion" value='<%=litre%>' readonly />
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Monthly Water Bill Amount</span>
                            <input  type="text" name="monthlywaterbill" value='<%=cost%>' readonly/>
                        </label>
                    </div>
                    <button type="button"   onclick="myFunction()" >Print Bill</button>
                        <button type="buton"   onclick="location.href='Services.jsp'" id="submit">Back</button>



                    

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
