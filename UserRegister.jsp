<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home Management System | User Signup</title>

    <link rel="stylesheet" href="assets/demo.css">
    <link rel="stylesheet" href="assets/form-register.css">
    <script type="text/javascript">
function valid()
{
if(document.signup.password.value!= document.signup.confirmpassword.value)
{
alert("Password and Confirm Password Field do not match  !!");
document.signup.confirmpassword.focus();
return false;
}
return true;
}
</script>

<script>
function checkAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'emailid='+$("#emailid").val(),
type: "POST",
success:function(data){
$("#user-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>    


</head>

    
<body>

     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <img style="margin-top: 30px" src="assets/img/logo.png" /><br>
    <ul class="nav navbar-nav">
        <li><a href="UserRegister.jsp" class="active">User Signup</a></li>
        <li><a href="UserLogin.html" >User Login</a></li>
        <li><a href="AdminLogin.html">Admin Login</a></li>
    </ul>
  </div>
</nav>

    <div class="main-content">
          <form class="form-register" name="signup" method="post" action="Register.jsp" onSubmit="return valid();">
            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Create an account</h1>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Name</span>
                            <input type="text" name="houseownername">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Mobile Number </span>
                            <input type="text" name="mobilenumber">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>House Number</span>
                            <input type="text" name="housenumber">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>House Type</span>
                            <select name="housetype" class="form-control">
                                <option value="2BHK">2 BHK</option>
                                <option value="3BHK">3 BHK</option>
                                <option value="4BHK">4 BHK</option>
                                <option value="Others">Others (i,e) Villa,Row,Flat</option>
                            </select>
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>House Members(Count)</span>
                            <input type="text" name="housemembers">
                        </label>
                    </div>
                     <div class="form-row">
                        <label>
                            <span>Rent/Sales Amount</span>
                             
                            <input class="form-control" type="text" name="rentsalesamount" maxlength="10" autocomplete="off" required />
                             <br>
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Rent:</span>
                            <input  type="radio" name="house" value="rent" checked> 
                            <span>Sales:</span>
                            <input type="radio" name="house" value="sale">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="email"  name="userid" id="userid" onBlur="checkAvailability()">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="password">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Confirm Password</span>
                            <input type="password" name="confirmpassword">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Services Required </span>
                            <br>
                             <input  type="checkbox" name="service" value="milk" checked> Milk
                            <input  type="checkbox" name="service" value="water"> Water
                            <input  type="checkbox" name="service" value="newspaper"> Newspaper
                        </label>
                    </div>

                    <div class="form-row">
                        <button type="submit" name="signup">Register</button>
                    </div><br>
                     <a href="UserLogin.html" class="form-log-in-with-existing">Already have an account? Login here &rarr;</a>
                </div>
           </div>

            

        </form>

    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
     <footer style="background-color: white">
        <div class="col-md-12"><br>
            &copy; 2018 Feather Home Management System <br><br>
        </div>
</footer></body>

</html>
