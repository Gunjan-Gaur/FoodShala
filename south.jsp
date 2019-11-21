<%@page import= "java.sql.*"%>
<%!
  Connection con;
  PreparedStatement ps;
  ResultSet rs;
  String dd;
%>  

<!DOCTYPE html>
<html>
<head>
	<title></title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
function openNav() 
{
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginRight = "250px";
}

function closeNav() 
{
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginRight= "0";
}
</script>

<script type="text/javascript">
function facebook()
{
	if(document.getElementById("fb").style.color=="black")
	{
		document.getElementById("fb").style.color="blue";
	}
	else
	{	
	document.getElementById("fb").style.color="black";
    }
}

function heart()
{
	if(document.getElementById("heart").style.color=="black")
	{
		document.getElementById("heart").style.color="red";
	}
	else
	{	
	document.getElementById("heart").style.color="black";
    }
}

function facebooks()
{
	if(document.getElementById("fbs").style.color=="black")
	{
		document.getElementById("fbs").style.color="blue";
	}
	else
	{	
	document.getElementById("fbs").style.color="black";
    }
}

function hearts()
{
	if(document.getElementById("hearts").style.color=="black")
	{
		document.getElementById("hearts").style.color="red";
	}
	else
	{	
	document.getElementById("hearts").style.color="black";
    }
}

// Get the modal
var modal = document.getElementById('id');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-light" style="height:60px;">
	<a class="navbar-brand" href="#"> <img src="Images/restaurant.svg" width="30" height="30" alt="">&nbsp;&nbsp;<span class="text-body">Food Shala</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
  <nav>
  	<div class="zoom">
  <a class="navbar-brand" href="index.jsp">

 <img src="Images/city-hall.svg" width="30" height="30" alt="">
  </a>
  </div>
 </nav>
  <nav>
	 <div class="zoom">
    <a class="navbar-brand" href="adminlogin.html">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/multiple-user.svg" width="30" height="30" alt="">
    </a>
</div>
</nav>
<!--<a href="upsign.html"><button>Signup</button></a>-->

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button onclick="document.getElementById('id').style.display='block'" style="width:auto;margin-left:500px;  ">Sign Up</button>
 <div id="id" class="modal">
	
  <form class="modal-content animate">
    
    <div class="container slideanim">
      <label for="phone"><b>Phone Number</b></label>
      <input type="text" placeholder="Enter phone" id="phone" name="phone">
      <button type="button" onclick="SendOtp()">Send OTP</button>
      <br>
      </div>
      <div id="check"  style="display:none">
      <input type="text" placeholder="Enter otp" id="otp" name="otp">
      <button type="button" onclick="verifyOtp()">Submit</button>
      </div>
  </form>
</div>

<form action="login.html">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" style="width:auto;">Login</button>  
</form>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="index.jsp">Home</a>
  <a href="adminlogin.html">Restaurant</a>
</div>

<div id="main" class="zoom" style="margin-left:1250px; position:absolute;">
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
</div>


</nav>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky" style="height:50px;">
  <div class="container">
  <div class="zoom" >
   <a class="navbar-brand" href="south.jsp">South Indian Food</a>
</div>
<div class="zoom">
   <a class="navbar-brand" href="LifeStyle.jsp">Burger</a>
</div>
<div class="zoom">
   <a class="navbar-brand" href="Scientific.jsp">Pizza</a>
  </div>
  <div class="zoom"> 
   <a class="navbar-brand" href="Politics.jsp">Italian Food</a>
  </div>
  <div class="zoom"> 
   <a class="navbar-brand" href="Faridabad.jsp">Dessert</a>
  </div>
</div>
</nav>
<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="Images/food2.jpeg" width="50" height="400" class="d-block w-100" alt="...">
       
      </div>
      <div class="carousel-item">
        <img src="Images/food3.jpg" width="50" height="400" class="d-block w-100" alt="...">
        
      </div>
      <div class="carousel-item">
        <img src="Images/chocho.jpg" width="50" height="400" class="d-block w-100" alt="...">
        
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<!--grid-->

<div class="container-fluid bg-light">
  <div class="row">
    <div class="col-md-3 mt-4">
      <div class="card-deck">
        <div class="card">
          <div class="card-body">
          <p class="card-text"><b>Nearby Restaurants</b></p>
          
          <hr>
          
          <div style="display: inline-flex;">
            <div>
              <img src="Images\south.jpeg" style="width: 40px; height: 40px;"></div>
            <div class="pl-3">  
              Milan Sweet House
              <br>
              <span class="text-muted">Sector-10,Delhi NCR</span>
            </div>
          </div> 
          
          <hr>
          <div style="display: inline-flex;">
            <div>
              <img src="Images\pizza.jpg" style="width: 40px; height: 40px;"></div>
            <div class="pl-3">  
              Pizza Live
              <br>
              <span class="text-muted">Sector-10,Delhi NCR</span>
            </div>
          </div>

            <hr>

            <div style="display: inline-flex;">
            <div>
              <img src="Images\food1.jpg" style="width: 40px; height: 40px;"></div>
            <div class="pl-3">  
              Gaini(Dessert Parlor) 
              <br>
              <span class="text-muted">Sector-10,Delhi NCR</span>
            </div>
          </div>

          <hr>

          <div style="display: inline-flex;">
            <div>
              <img src="Images\food.jpg" style="width: 40px; height: 40px;"></div>
            <div class="pl-3">  
              Shiv Sweet House
              <br>
              <span class="text-muted">Sector-10,Delhi NCR</span>
            </div>
          </div>

        </div>
      </div>
    </div>  

    </div>
    
    <div class="card col-md-6 mt-4 mb-4"><br>
      <table>

<%  try
    {
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
      ps=con.prepareStatement("select image,title,id,category,price,title,address from items where category=?");
      ps.setString(1,"South Indian");
      rs=ps.executeQuery();
%>
<%
    while(rs.next())
        {
%> 
        <tr valign="left">
          <div class="overflow-x:auto" style="display: inline-flex;"><br><br>
            <div>
               <img src="Images/<%=rs.getString("image") %>" class="ml-5 rounded-lg" style="height:200px; width:200px;" alt="...">
            </div>
            
            <div class="card w-50 mt-2 rounded-lg bg-light ml-4 h-25" >
              <div class="card-body text-md-left">
                  <p class="card-text text-center">
                    <h4 class=""><%=rs.getString("title")%></h4>
                    <span class="text-muted"><%=rs.getString("address")%></span>
                  </p>
                  <hr>
                  <p class="card-text"><b><%=rs.getString("category")%></b><span style="margin-left:125px;"><%=rs.getString("price") %></span></p>
              </div>
            </div>
          </div>
            <form action="login.html">
              <button class="button w-25 " style="margin-left: 70px;">ORDER NOW</button>
            </form>
          
        
         </tr><br><br>
    <%
     }
  %>
   </table>
<% 
}
catch(Exception e)
{
  out.println(e);
}
%>

    </div>   
    
	<!--
   Card Deck
  -->
  <div class="col-md-3 card-deck pt-4 pl-5 pb-5" style="width:350px;">
    <div class="card" style="background-color: lightgray;">
    <div class="card-body text-center">
      <img src="Images/diagram.svg" class="" style="height: 100px;" alt="..."><h3>No Minimum Order</h3>
      <p class="card-text">Order in for yourself or for the group,with no restrictions on order value</p>
      <img src="Images/tracking.svg" class="mt-5" style="height: 100px;" alt="..."><h3>Live Order Tracking</h3>
      <p class="card-text">Know where your order is all the times,from the restaurant to your doorstep</p>
    </div>
  </div>
  </div>

<!-- Footer -->
<footer class="page-footer font-small mdb-color lighten-3 pt-4 w-100">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Content -->
        <h5 class="font-weight-bold text-uppercase mb-4">Footer Content</h5>
        <p>Herer you can use rows and columns to organize your footer content.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit amet numquam iure provident voluptate
          esse
          quasi, veritatis totam voluptas nostrum.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 mx-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Links -->
        <h5 class="font-weight-bold text-uppercase mb-4">About</h5>

        <ul class="list-unstyled">
          <li>
            <p>
              <a href="#!">PROJECTS</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">ABOUT US</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">BLOG</a>
            </p>
          </li>
          <li>
            <p>
              <a href="#!">AWARDS</a>
            </p>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Contact details -->
        <h5 class="font-weight-bold text-uppercase mb-4">Address</h5>

        <ul class="list-unstyled">
          <li>
            <p>
              <i class="fa fa-home mr-3"></i> New York, NY 10012, US</p>
          </li>
          <li>
            <p>
              <i class="fa fa-envelope mr-3"></i> info@example.com</p>
          </li>
          <li>
            <p>
              <i class="fa fa-phone mr-3"></i> + 01 234 567 88</p>
          </li>
          <li>
            <p>
              <i class="fa fa-print mr-3"></i> + 01 234 567 89</p>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 text-center mx-auto my-4 slideanim">

        <!-- Social buttons -->
        <h5 class="font-weight-bold text-uppercase mb-4">Follow Us</h5>

        <!-- Facebook -->
        <nav class="navbar navbar-light">

        	<div class="zoom">
        <a class="navbar-brand" href="https://www.facebook.com/">
       <img src="Images/facebook.svg" width="30" height="30" class="d-inline-block align-right" alt="">
      </a>
  </div>
      </nav>

        <!-- Twitter -->
        <nav class="navbar navbar-light">
        	<div class="zoom">
        <a class="navbar-brand" href="https://twitter.com/login">
       <img src="Images/twitter.svg" width="30" height="30" class="d-inline-block align-right" alt="">
      </a>
  </div>
      </nav>
        <!-- Dribbble -->
          <nav class="navbar navbar-light">
          	<div class="zoom">
        <a class="navbar-brand" href="#">
       <img src="Images/gmail.svg" width="30" height="30" class="d-inline-block align-right popshadow" alt="">
      </a>
  </div>
      </nav>
      
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

   <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2018 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> MDBootstrap.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

<script type="text/javascript">
var k=new XMLHttpRequest();
function verifyOtp()
{	
 	var x= document.getElementById("otp").value;
    alert(x);
    k.open("get","otpprocess.jsp?otpvalue="+x);
    k.onreadystatechange=nextfun;
    k.send();
}
function nextfun()
{
     
    if(k.readyState==4 && k.status==200)
    {
        var i = k.responseText;
        alert(i);
        if(i==1)
        {
           alert("gunjan");
           window.location.href="upsign.html";
        }
        else
        {
            alert("Wrong Otp");
        }
    }
}
</script>

<script type="text/javascript">
var v=new XMLHttpRequest();
function SendOtp()
{
    var y= document.getElementById("phone").value;
    alert("sendotp");
    v.open("post","process.jsp?phone="+y);
    v.onreadystatechange=Result;
    v.send();
}
function Result()
{
	
    if(v.readyState==4 && v.status==200)
    {
    	document.getElementById("check").style.display="block";
    }
}
</script>
</body>
</html>
