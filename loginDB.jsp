<%@page import="java.sql.*"%>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>	
<%
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		boolean valid=false;
	    try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
			ps=con.prepareStatement("select email,password from signup");
			rs= ps.executeQuery();
			while(rs.next())
			{
				if(email.equals(rs.getString("email")) && password.equals(rs.getString("password")))
				{
					valid=true;
					break;
				}
			}
		
			if(valid)
			{
				session.setAttribute("email",email);
			
%>
             <jsp:forward page="Afterlogin.jsp"/>
<%			}
			else
			{
%>			<html>
            <div style="Position:absolute; left:551px; top:214px"; top:400px; left:350px>
			<font color=red><b>*Email or password entered wrong</b></font></div></html>
	
			 <jsp:include page="login.html"/>
<%
			}
		
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>