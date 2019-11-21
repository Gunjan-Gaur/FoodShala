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
String firstname=(String)request.getParameter("firstname");
String lastname=(String)request.getParameter("lastname");
String country=(String)request.getParameter("country");
String state=(String)request.getParameter("state");
String city=(String)request.getParameter("city");
String bday=(String)request.getParameter("bday");
String password=(String)request.getParameter("password");
String gender=(String)request.getParameter("gender");
String phone=(String)session.getAttribute("phone");
String status = (String)request.getParameter("status");
//int otpvalue=Integer.parseInt(request.getParameter("otpvalue"));
//int enterOtp=Integer.parseInt(otpvalue);
//session.setAttribute("otp",otp);
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
    	con=DriverManager.getConnection("jdbc:mysql:///pehchan","root","root");
		ps=con.prepareStatement("insert into signup values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,email);
		ps.setString(2,firstname);
		ps.setString(3,lastname);
		ps.setString(4,country);
		ps.setString(5,state);
		ps.setString(6,city);
		ps.setString(7,bday);
		ps.setString(8,password);
		ps.setString(9,gender);
		ps.setString(10,phone);
		ps.setString(11,status);
		ps.executeUpdate();
			
        out.println("Thank you for register.!");
    } 
    catch(Exception e)
       {
          out.print(e);
       }

//out.println("new page");
%>