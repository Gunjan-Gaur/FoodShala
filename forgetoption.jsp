<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
	<%
	String email=request.getParameter("email");
	session.setAttribute("email",email);
	
	%>
	<center>
		<div>
			<form action="changepass.jsp">
	    <button type="button" class="btn btn-light" onclick="textfield()">Phone</button>
	    <div id="display" style="display: none;">
        <input type="text" placeholder="Enter phone" id="phone" name="phone" >
        <button type="button" style="display: inline;" class="btn btn-light" onclick="SendOtp()">sendotp</button>	
        </div>
        <div id="check" style="display: none;">
        <input type="text" placeholder="Enter otp" id="otp" name="otp">
        <button type="submit" style="display: inline;" class="btn btn-light" onclick="verifyOtp()">submit</button><br>
        </div>		
	        </form>
		</div>
		
	
		<div>
		<form action="changepass.jsp">
	    <button type="button" class="btn btn-light" onclick="textfield1()">Email</button>
	    <div id="display1" style="display: none;">
        <input type="text" placeholder="Enter email" id="email" name="email" >
        <button type="button" style="display: inline;" class="btn btn-light" onclick="EmailOtp()">sendingotp</button>	
        </div>
        <div id="apply" style="display: none;">
        <input type="text" placeholder="Enter otp" id="verify" name="verify">
        <button type="submit" style="display: inline;" class="btn btn-light" onclick="verifyEmail()">submit</button>
        </div>		
	        </form>
		</div>
    </center>


<script type="text/javascript">
function textfield()
{
	document.getElementById("display").style.display="block";
}
function textfield1()
{
	document.getElementById("display1").style.display="block";
}
</script>


<script type="text/javascript">
var v=new XMLHttpRequest();
function SendOtp()
{
	
    var y= document.getElementById("phone").value;
    v.open("post","process.jsp?phone="+y);
    v.onreadystatechange=Result;
    v.send();
}
function Result()
{
	
    if(v.readyState==4 && v.status==200)
    {
        document.getElementById("check").style.display="block";
        alert("otp send");
    }
}
</script>


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
function EmailOtp()
{

    var y= document.getElementById("email").value;
    v.open("post","mailotp.jsp?email="+y);
    v.onreadystatechange=changes;
    v.send();
    alert("Result");
}
function changes()
{
    if(v.readyState==4 && v.status==200)
    {
    	alert("In loop");
        document.getElementById("apply").style.display="block";
    }
}
</script>


<script type="text/javascript">
var k=new XMLHttpRequest();
function verifyEmail()
{

    var x= document.getElementById("verify").value;
    alert("Verify");
    k.open("get","everify.jsp?otpvalue="+x);
    k.onreadystatechange=otpR;
    k.send();
}
function otpR()
{
  
    if(k.readyState==4 && k.status==200)
    {
        var i=k.responseText;
        alert(i);
        if(i==1)
        {
        document.getElementById("status").value="1";        
        //window.location.href="changepass.jsp";
        }
        else
        {
            alert("Wrong Otp");
        }
    }
}
</script>

</body>
</html>