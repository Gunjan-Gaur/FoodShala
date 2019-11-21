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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height:50px;">
  <div class="container">
  <div class="zoom" >
   <a class="navbar-brand" href="Sports.jsp">South Indian Food</a>
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
<!--grid-->

<div class="container-fluid bg-light">
  <div class="row">
    <div class="col-md-8 mt-4">
      <div class="card">
        <%  
          String id=(String)request.getParameter("id");
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
            ps=con.prepareStatement("select * from items where id=?");
            ps.setString(1,id);      
            rs=ps.executeQuery();
            rs.next();
        %>
            <div style="display: inline-flex;">
              <div class="overflow-x:auto">
                <img src="Images/<%=rs.getString("image") %>" class="rounded-lg m-4" height="150" width="150" alt="...">
              </div>
              <div class="m-4">
                <h2><%=rs.getString("title")%></h2>
                <span class="text-muted"><%=rs.getString("address")%></span>
                <hr>
                Closed (Opens at 12noon-12midnight)<br>
                Desserts, Beverages, Ice Cream<br>   
                Costs Rs.300 for two
              </div>
            </div>
        <%
          }
          catch(Exception e)
          {
            out.println(e);
          }
        %>
      </div>

      <div class="card mt-4">
        <div class="btn-group">
          <button type="button" class="btn">OverView</button>
          <button type="button" class="btn">Menu</button>
          
        </div>
      </div>
      
      <div class="card mt-4">
        <%  
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
            ps=con.prepareStatement("select * from items where id=?");
            ps.setString(1,id);      
            rs=ps.executeQuery();
            rs.next();
        %>
          <div class="row">
           <div class="rounded-lg pt-2 pl-3 col-lg-5 m-4">
            <b><h4>Address:</h4></b><%=rs.getString("address")%><br><hr>
            <b><h4>Opening Hours:</h4></b>Closed (Opens at 12noon-12midnight)<br><hr> 
            <b><h4>Average Cost:</h4></b>Costs Rs.300 for two<br>
           </div>

           <div class="col-md-5 ml-3 mt-3 mb-3">
             <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d56142.50453727314!2d77.2701289887994!3d28.42207700686114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sgiani%20ice%20cream%20near%20Faridabad%2C%20Haryana!5e0!3m2!1sen!2sin!4v1573102682319!5m2!1sen!2sin" width="300" height="300" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
           </div>
           </div>
        <%
          }
          catch(Exception e)
          {
            out.println(e);
          }
        %>
      </div>  
      
      <div class="card mt-4 mb-3">
        <%  
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
            ps=con.prepareStatement("select * from items where id=?");
            ps.setString(1,id);      
            rs=ps.executeQuery();
            rs.next();
        %>
          <h4 class="ml-5"><b>Menu</b></h4>
          <div>
           <img src="Images/<%=rs.getString("menu") %>" class="m-3 text-center" style="height:500px; width:500px;" alt="...">
          </div>
        <%
          }
          catch(Exception e)
          {
            out.println(e);
          }
        %>
      </div>

      <div class="card">
        <%  
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
            ps=con.prepareStatement("select * from items where id=?");
            ps.setString(1,id);      
            rs=ps.executeQuery();
            rs.next();
        %>
        <div class="row" style="display: inline-flex;">
          <div class="col-md-2 rounded-lg mt-3 ml-3 mb-3 ">
            <img src="Images/<%=rs.getString("image") %>" class="text-center rounded-lg" style="height:100px; width:100px;" alt="...">
          </div>
          <div class="mt-3 ml-3 col-md-5">
            <b><%=rs.getString("category")%></b><span style="margin-left:125px;"><b>Price: </b><%=rs.getString("price") %></span><br>
            <b>*Veg</b><br>
            <p class="text-muted">*<%=rs.getString("content")%></p>
          </div>  
          <div class="col-md-3 mt-3 ml-5">
            <button class="button w-50 rounded-lg h-50"> Add +</button>
          </div>
        </div>
        <%
          }
          catch(Exception e)
          {
            out.println(e);
          }
        %>
      </div>

      <div class="card mt-4">
        <%  
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
            ps=con.prepareStatement("select * from items where id=?");
            ps.setString(1,id);      
            rs=ps.executeQuery();
            rs.next();
        %>
          <div class="row" style="display: inline-flex;">
          <div class="col-md-2 rounded-lg m-3 ">
            <img src="Images/<%=rs.getString("image") %>" class="text-center rounded-lg" style="height:100px; width:100px;" alt="...">
          </div>
          <div class="m-3 col-md-5">
            <b><%=rs.getString("category")%></b><span style="margin-left:125px;"><b>Price: </b><%=rs.getString("price") %></span><br>
            <b>*Veg</b><br>
            <p class="text-muted">*<%=rs.getString("content")%></p>
          </div>  
            <div class="col-md-3 mt-3 ml-5">
            <button class="button w-50 rounded-lg h-50"> Add +</button>
            </div>
          
        </div>
        <%
          }
          catch(Exception e)
          {
            out.println(e);
          }
        %>  
      </div>
    </div>  
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
    
</div>    
<!-- Footer -->
<footer class="mt-4 page-footer font-small mdb-color lighten-3 pt-4 w-100">

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

</body>
</html>
