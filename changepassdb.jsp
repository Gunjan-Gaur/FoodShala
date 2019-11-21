<%@page import="java.sql.*"%>
<%!
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
		String email=(String)session.getAttribute("email");
		String pass=request.getParameter("pass");
		//String phone=request.getParameter("phone");
		String phone=(String)session.getAttribute("phone");
		//String password=(String)session.getAttribute("password");
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
		ps=con.prepareStatement("update signup set password=? where email=? OR phone=?");
		ps.setString(1,pass);
		ps.setString(2,email);
		ps.setString(3,phone);
		ps.executeUpdate();
		response.sendRedirect("index.jsp");
		}
		catch(Exception e)
		{
			out.println(e);
		}
%>
	

</body>
</html>