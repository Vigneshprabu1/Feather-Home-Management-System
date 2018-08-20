<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.utill.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Feather Home Management System | Admin Dashboard</title>

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
    <!--- MENU SECTION START--><nav class="navbar navbar-default">
  <div class="container-fluid">
    <img style="margin-top: 30px" src="assets/img/logo.png" /><br>
    <ul style="background-color: white" class="nav navbar-nav ">
        <li ><a href="Logout.jsp">Log Out</a></li>
    </ul>
  </div>
</nav>

<!-- MENU SECTION END-->
<div class="form-log-in-with-email">
    <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h1 class="header-line">&nbsp;&nbsp;&nbsp;&nbsp;Admin Dashboard</h1>
            </div>
        </div>
             
<!--LOGIN PANEL START-->           
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" >
            <center>
                    <button style="background-color: #6caee0" type="submit" name="login" onclick="location.href='LoginWater.jsp'" class="btn btn-info">Water </button>
                    <button style="background-color: #6caee0" type="submit" name="login" onclick="location.href='BillTable.jsp'" class="btn btn-info">Milk/Newspaper</button>
                    <button style="background-color: #6caee0" type="submit" name="login" onclick="location.href='announce.jsp'" class="btn btn-info">Announcements</button>
            </center>
            </div>
        </div>

        <br>
        <br>
        <div class="row">
            <div class="col-md-12">
                <table id="table">
  <tr>
<th>ID</th>
<th>EMAIL ID</th>
<th>HOUSE NUMBER</th>
<th>HOUSE OWNER NAME</th>
<th>MOBILE NUMBER</th>
<th>NUMBER OF HOUSE MEMBERS</th>
<th>HOUSE TYPE</th>
<th>RENT</th>
<th>SALE</th>
<th>RENT/SALE AMOUNT</th>
<th>WATER</th>
<th>NEWSPAPER</th>
<th>MILK</th>
</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/shinelogics";
String username="root";
String password="admin";
String query="select * from user_details ";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
 %>
    <tr><td><%=rs.getString("id") %></td>
    <td><%=rs.getString("email_id") %></td>
    <td><%=rs.getString("house_number") %></td>
    <td><%=rs.getString("house_owner_name") %></td>
    <td><%=rs.getString("mobile_number") %></td>
    <td><%=rs.getString("house_members_count") %></td>
    <td><%=rs.getString("house_type") %></td>
    <td><%=rs.getString("rent") %></td>
    <td><%=rs.getString("sale") %></td>
    <td><%=rs.getString("rent_sale_amount") %></td>
    <td><%=rs.getString("water") %></td>
    <td><%=rs.getString("newsPaper") %></td>
    <td><%=rs.getString("milk") %></td>
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


        </div>



    </div>
</div>   
<!---LOGIN PABNEL END--> 

 <!-- <footer style="background-color: white;margin-bottom: -20px">
        <div class="col-md-12">
            <br>
            &copy; 2018 Feather Home Management System <br><br>
        </div>
</footer> -->

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
