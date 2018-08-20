<%@ page import="java.sql.*"%>
<%@ page import="java.io.* "%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Home Page</title>
<link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/form-login.css">
   <!--  <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<link rel="stylesheet" type="text/css" href="css/jquery.flexdatalist.css">
<link rel="stylesheet" type="text/css" href="css/jquery.flexdatalist.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="js/jquery.flexdatalist.js"></script>
<script src="js/jquery.flexdatalist.min.js"></script>
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
    background-color: #45AFD3;
    color: white;
}


</style>
</head>
<body style="align-content: center;"> 

<!-- <div id="id01" class="modal"> -->
  <form  style="border-radius: 30px" action="postannounce.jsp" method="post">

            <div style="margin-left: 240px" align="center" class="form-log-in-with-email">

                <div style="margin-left: : 40px" align="center" class="form-white-background">

                    <div class="form-title-row">
                        <h1>Add Anouncements/Events</h1>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Title</span>
      <input type="text" placeholder="Anouncement Title" name="title" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Description</b></span>
      <input type="textarea" placeholder="Description" name="desc" required>
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                          <span>Select Users</span></label>
      <input type="text" list="users" id="list" placeholder="select users" class='flexdatalist'
       data-min-length='1'
       multiple='multiple'
       data-selection-required='1'>
                      </div>               
<%
     try{
        Class.forName("com.mysql.jdbc.Driver");

           // Open a connection
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shinelogics", "root", "admin");

           // Execute SQL query
           
           Statement stmt = conn.createStatement();
           String sql;
           sql = "SELECT house_number FROM user_details";
           ResultSet rs = stmt.executeQuery(sql);
           %>
           

           <datalist id="users" >
           
           <%while(rs.next()){ %>
            <option value="<%= rs.getString(1)%>" ></option>
           <% }
           }catch(SQLException e){
            e.printStackTrace();
           }%>
<script>
  $('.flexdatalist').flexdatalist({
     minLength: 1
});
</script>

<script>
function Test(){
   var len = $( "li" ).size();
    var Value = new Array(len);
    for(i=0;i<len;i++){
     Value[i] = document.getElementsByClassName('text')[i].innerHTML;
     var prev = document.getElementById("hide").value;
      document.getElementById("hide").value = prev + Value[i]+"," ;
    }
}   
</script>
</datalist>
<button type="submit" style="background-color: #9641C4;" onclick="Test();">Send</button>
<input type="hidden" id="hide" name="users" value="" />
    <div class="container" >
      <button type="button" onclick="location.href='GridDisplay.jsp'" class="cancelbtn">Close</button>
      
    </div>
                </div>
            </div>

            

        </form>








  
<!-- </div> -->
</body>
</html>
