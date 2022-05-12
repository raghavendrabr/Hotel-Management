<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.text.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOOKING</title>
</head>
<body>
<%
try{
   
   String cin = request.getParameter("checkin");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
   java.util.Date date1 =sdf.parse(cin);
   java.sql.Date sql_checkin = new java.sql.Date(date1.getTime());
   String cout = request.getParameter("checkout");
   java.util.Date date2 =sdf.parse(cout);
   java.sql.Date sql_checkout = new java.sql.Date(date2.getTime());
   String username = request.getParameter("username");
   int num_of_people = Integer.parseInt(request.getParameter("num_of_people"));
   
   
   
  
   
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","raghu@317");
   
   PreparedStatement ps=con.prepareStatement("insert into bookings(checkin,checkout,username,number_of_people) values (?,?,?,?)");  
   ps.setDate(1,sql_checkin);  
   ps.setDate(2,sql_checkout);  
   ps.setString(3,username); 
   ps.setInt(4,num_of_people);
  
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Booking Requested Successfully"); 
 out.print("<center><a href='Home.html'>HOME</a>");
 out.print("<center><a href='booking.html'>BACK</a>");
  
  }
  else
	  out.print("Booking Request Is Not Successful"); 
}
catch(Exception e){out.print("booking Request Is Not Successful");
out.print("<center><a href='booking.html'>BACK</a>");
out.println(e);}
%>  
</body>
</html>