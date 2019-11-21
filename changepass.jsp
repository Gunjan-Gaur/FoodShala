
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%
	String phone=request.getParameter("phone");
	session.setAttribute("phone",phone);
	%>
	<form action="changepassdb.jsp">	
	<div>  
	  <label for="password"><b>Change Password</b></label>
      <input type="password" placeholder="Enter password" id="pass" name="pass"><br>
      <label for="password"><b>Confirm Password</b></label>
      <input type="password" placeholder="Confirm password" onblur="samepwd()" id="cpass" name="cpass" required><br>
      <button type="submit">Submit</button>
	</div>
	</form>

<script type="text/javascript">
	function samepwd()
	{
		var x=document.getElementById("cpass").value;
		var y=document.getElementById("pass").value;
		if(x!=y)
		{
			alert("password doesn't match");
			document.getElementById("cpass").value="";
		}
	}
</script>

</body>
</html>