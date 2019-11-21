<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>
<%
//String email=(String)session.getAttribute("email");

String email=request.getParameter("email");
String rname=request.getParameter("rname");
String state=(String)request.getParameter("state");
String city=(String)request.getParameter("city");

String password=(String)request.getParameter("password");

String phone=(String)session.getAttribute("phone");

//int otpvalue=Integer.parseInt(request.getParameter("otpvalue"));
//int enterOtp=Integer.parseInt(otpvalue);
//session.setAttribute("otp",otp);
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
    	con=DriverManager.getConnection("jdbc:mysql:///foodshala","root","root");
		ps=con.prepareStatement("insert into restrosignup values(?,?,?,?,?,?)");
		ps.setString(1,email);
		ps.setString(2,rname);
		ps.setString(3,city);
		ps.setString(4,state);
		ps.setString(5,phone);
		ps.setString(6,password);
		ps.executeUpdate();
			
        out.println("Thank you for Registering Restaurant .!");
    } 
    catch(Exception e)
       {
          out.print(e);
       }

//out.println("new page");
%>