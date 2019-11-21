<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Restaurant</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body  background="Images/nasa.jpg" style="background-size: cover;">
  <div class="container mt-4 mb-5" style="margin-left: 400px;">
    <div class="row">
      <div class="card bg-light">
          <h1 class="text-center">Register Restaurant</h1>

          <form action="RestaurantdbSignup.jsp" method="post" class="m-5">
          EMAIL:<input type="text" class="form-control" placeholder="Username" name="email" style="width:500px; ">
          <br>
          <br>
          RESTAURANT NAME:<input type="text" class="form-control" placeholder="Restaurant Name" name="rname" style="width:500px; ">
          <br>
          <br>
          CITY:<input type="text" class="form-control" placeholder="city" name="city" style="width:500px; ">
          <br>
          <br>
          STATE:<input type="text" class="form-control" placeholder="state" name="state" style="width:500px; ">
          <br>
          <br>
          PHONE:<input type="text" class="form-control" placeholder="phone" name="phone" style="width:500px; ">
          <br>
          <br>
          PASSWORD:<input type="password" class="form-control" placeholder="Password" name="password" style="width: 500px;">
          <br>
          <br>
          <button type="submit" class="btn btn-primary btn-block" style="width: 100px; margin-left: 200px;">Submit</button>
    </form>
      </div>
    </div>
  </div>
    
     
    

</body>
</html>                                		                            