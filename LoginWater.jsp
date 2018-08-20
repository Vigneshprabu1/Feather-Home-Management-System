<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.utill.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Feather Home Management System | Water Billing</title>

    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/form-loginn.css">

    <style>

        #table {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #table td, #table th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #table tr:nth-child(even){background-color: #f2f2f2;}

        #table tr:hover {background-color: #ddd;}

        #table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #FF69B4;
            color: white;
        }
    </style>

</head>
<body>
    <!--- MENU SECTION START-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <img style="margin-top: 30px" src="assets/img/logo.png" /><br>
    <ul style="background-color: white" class="nav navbar-nav ">
        <li ><a href="Logout.jsp">Log Out</a></li>
    </ul>
  </div>
</nav>
<!-- MENU SECTION END-->



<form class="form-login" method="post" action="ValidateToEnter.jsp">

            <div style="padding: 10px;margin-bottom: 20px" class="form-log-in-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>House Details</h1>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Enter Email id</span>
                            <input type="email" name="emailid">
                        </label>
                    </div>

                   
                    <div class="form-row">

                        <center><button type="submit" name="login" class="btn btn-info">LOGIN </button>&nbsp;<button type="button" onclick="location.href='GridDisplay.jsp'"  class="btn btn-danger">Back </button></center>
                    </div>               

                </div>
            </div>

            

        </form>

   
             
<!--LOGIN PANEL START-->           
<!---LOGIN PABNEL END-->                   
<table id="table">
<tr>

<th>EMAIL ID</th>
<th>INITIAL WATER READING</th>
<th>TOTAL CONSUMPTION PER MONTH</th>
<th>TOTAL COST PER MONTH</th>
</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/shinelogics";
String username="root";
String password="admin";
String query="select * from billing_details ";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
 %>
    <tr><td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    </tr>
        <%
}
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>
</table>

    </div>
<!-- CONTENT-WRAPPER SECTION END-->
     <section class="footer-section" style="background-color: white">
        <div class="container">
            <div class="row">
                <div class="col-md-12"><br>
                   &copy; 2018 Feather Home Management System <br><br>
                </div>

            </div>
        </div>
    </section>
<!-- FOOTER SECTION END-->

    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>

</body>
</html>
