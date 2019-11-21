<%@ page import="java.util.*"%>
<%@ page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%@page import="javax.mail.internet.MimeMessage"%>
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

String email=request.getParameter("email");
//String password=request.getParameter("password");

//String phone=request.getParameter("phone");
int random =(int)(Math.random() * 9000 + 1000);
String ran=Integer.toString(random);
//session.setAttribute("name",name); 
session.setAttribute("email",email);
session.setAttribute("ran",ran);  
boolean valid=false; 
  
    Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");      
           Session session1=Session.getInstance(props,new javax.mail.Authenticator() { 
       protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication("gnjnagg","Vaishali0");  
           }});    
          try 
      {    
         MimeMessage message = new MimeMessage(session1);    
         message.setFrom(new InternetAddress("gnjnagg@gmail.com"));
         message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
         message.setSubject("One Time password");
         message.setText("your one time password is:"+ran);    
         Transport.send(message);  
                  
                valid= true;
                //out.print("valid");
        //RequestDispatcher rd=req.getRequestDispatcher("index.html");
        //rd.include(req,res);
       
          } 
      catch(MessagingException e) 
      {
        out.print(e);
        

      }    
     // return valid;
      //out.print("valid");


    
  
%>
</body>
</html>