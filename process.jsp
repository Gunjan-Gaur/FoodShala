<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%> 
<%@page import=" java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//String name=request.getParameter("name");
//String email=request.getParameter("email");
String phone=request.getParameter("phone");
Random rand = new Random();
int otp = rand.nextInt(9000) + 1000;
//session.setAttribute("name",name); 
//session.setAttribute("email",email);
session.setAttribute("phone",phone);
session.setAttribute("otp",otp); 


try {
			// Construct data
			String apiKey = "apikey=" + "48d86466-ad51-11e9-ade6-0200cd936042";
			String message = "&message=" + "This is your message";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "91"+phone;
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("http://2factor.in/API/V1/48d86466-ad51-11e9-ade6-0200cd936042/SMS/"+phone+"/"+otp+"").openConnection();
		//	session.setAttribute("auto",AUTOGEN);
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
            
			//response.sendRedirect("otpprocess.jsp");
			//return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			//return "Error "+e;
		}
%>
</body>
</html>