<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
//String name=(String)session.getAttribute("name");
//String email=(String)session.getAttribute("email");
String phone=(String)session.getAttribute("phone");
//int phone=Integer.parseInt("ph");
int otp = (Integer)session.getAttribute("otp");

int otpvalue=Integer.parseInt(request.getParameter("otpvalue"));
//int enterOtp=Integer.parseInt(otpvalue);
//session.setAttribute("otp",otp);
if(otp==otpvalue)
{
   	out.print("1");
}
else
{
out.print("0");
}
%>