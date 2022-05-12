<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTER</title>
<style type="text/css">
body{background-image:url(courier9.jpg);
	font-size:25px;
	font-family:courier;
	background-size:cover;
	background-repeat:no-repeat;}</style>
</head>
<body>
<%
try{
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   String email = request.getParameter("email");
   String phone = request.getParameter("phone");
   
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","raghu@317");
   
   PreparedStatement ps=con.prepareStatement("insert into customer (username,password,email,phone)values (?,?,?,?)");
   ps.setString(1,username);  
   ps.setString(2,password);
   ps.setString(3,email);  
   ps.setString(4,phone); 
   
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("You are successfully registered..."); 
 out.print("<center><a href='login.html'>LOGIN</a>");

  
  }
  else
	  out.print("You are NOT successfully registered..."); 
  	  out.print("<center><a href='Register.html'>BACK</a>");
}
catch(Exception e){out.print("You are NOT successfully registered...");
out.print(e);
out.print("<center><a href='Register.html'>BACK</a>");}
%>   
</body>
</html>