<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PICK UP</title>
</head>
<body>
<%
try{
   String pid = request.getParameter("pid");
   String username = request.getParameter("username");
   String bid = request.getParameter("bid");
   String pname = request.getParameter("parcelname");
   String weight = request.getParameter("weight");
   String date = request.getParameter("date");
   String faddress = request.getParameter("fromaddress");
   String taddress = request.getParameter("toaddress");
     
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into pickup values (?,?,?,?,?,?,?,?)");
   ps.setString(1,pid);  
   ps.setString(2,username);  
   ps.setString(3,bid);  
   ps.setString(4,pname); 
   ps.setString(5,weight);
   ps.setString(6,date);
   ps.setString(7,faddress);
   ps.setString(8,taddress);
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Pickup Requested Successfully"); 
 out.print("<center><a href='Home.html'>HOME</a>");
 out.print("<center><a href='Pickup.html'>BACK</a>");
  
  }
  else
	  out.print("Pickup Request Is Not Successful"); 
}
catch(Exception e){out.print("Pickup Request Is Not Successful");
out.print("<center><a href='Pickup.html'>BACK</a>");}
%>  
</body>
</html>