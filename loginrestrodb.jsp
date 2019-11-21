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
			ps=con.prepareStatement("select email,password from restrosignup");
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
             <jsp:forward page="restropanel.jsp"/>
<%			}
			else
			{
%>			<html>
            <div style="Position:absolute; left:551px; top:325px"; top:500px; left:350px>
			<font color=red><b>*Email or password entered wrong</b></font></div></html>
	
			 <jsp:include page="adminlogin.html"/>
<%
			}
		
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>