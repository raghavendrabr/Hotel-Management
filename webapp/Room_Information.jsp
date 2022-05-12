<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room_Information</title>
</head>
<body>
<%
try{
   String rid = request.getParameter("Roomid");
   String price = request.getParameter("Price");
   String descriptions = request.getParameter("Descriptions");
   
     
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","raghu@317");
   
   PreparedStatement ps=con.prepareStatement("insert into pickup values (?,?,?)");
   ps.setString(1,rid);  
   ps.setString(2,price);  
   ps.setString(3,descriptions);  
   
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Room_Information Requested Successfully"); 
 out.print("<center><a href='Home.html'>HOME</a>");
 out.print("<center><a href='Room_Information.html'>BACK</a>");
  
  }
  else
	  out.print("Room_Information Request Is Not Successful"); 
}
catch(Exception e){out.print("Room_Information Request Is Not Successful");
out.print("<center><a href='Room_Information.html'>BACK</a>");}
%>  
</body>
</html>