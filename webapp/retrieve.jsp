<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CUSTOMER DETAILS</title>
</head>
<body>
 <% try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","raghu@317");	

String username = request.getParameter("username");
response.setContentType("text/html"); 

PreparedStatement st=con.prepareStatement("select * from customer where username = ?");
st.setString(1,username);
out.println("USER DETAILS:");
out.println("<br/>");
out.println("<br/>");
ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	int customerid = rs.getInt("customerid");
	String username1=rs.getString("username");	
	String email=rs.getString("email");
    String phone=rs.getString("phone");
    	
	out.println("  USERNAME: "+username1+"<br/>");
	out.println("  CUSTOMER ID: "+customerid+"<br/>");
	out.println("  EMAIL: "+email+"<br/>");
	out.println("  PHONE: "+phone+"<br/>");
	out.println("<br/>");  
	out.println("<br/>");
	}

PreparedStatement st1=con.prepareStatement("select paymentid,cardnumber,paymentdate from payments where username = ?");
st1.setString(1,username);

ResultSet rs1=st1.executeQuery();
out.println("PAYMENT DETAILS:");
out.println("<br/>");
out.println("<br/>");
out.println("<br/>");
while(rs1.next())
  
	{
	int paymentid = rs1.getInt("paymentid");
	String cardnumber=rs1.getString("cardnumber");	
	Date paymentdate=rs1.getDate("paymentdate");
    	
	out.print("  PAYMENT ID: "+paymentid+" | \t");
	out.print("  CARD NUMBER: "+cardnumber+" | \t");
	out.print("  PAYMENT DETAILS: "+paymentdate+"\t");
	out.println("<br/>");
	out.println("<br/>");  
	}

PreparedStatement st2=con.prepareStatement("select Bookingid,checkin,checkout from Bookings where username = ?");
st2.setString(1,username);
out.println("BOOKING DETAILS:");
out.println("<br/>");
out.println("<br/>");
out.println("<br/>");
ResultSet rs2=st2.executeQuery();
while(rs2.next())
  
	{
	int Bookingid = rs2.getInt("Bookingid");
	Date checkin=rs2.getDate("checkin");	
	Date checkout=rs2.getDate("checkout");
    	
    out.print("  BOOKING ID: "+Bookingid+" | \t");
	out.print("  CHECK IN DATE: "+checkin+" | \t");
	out.print("  CHECK OUT DATE: "+checkout+"\t");
	out.println("<br/>"); 
	out.println("<br/>"); 
	}
	


out.print("<center><a href='profile.html'>BACK</a>");
 
}
catch(Exception e)
{
out.println(e+"<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>UNABLE TO FETCH!!</h1></center>");

}	%>

</body>
</html>