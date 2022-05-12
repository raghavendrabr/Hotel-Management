<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PAYMENTS</title>
</head>
<body>
<%
try{
   

   String cname = request.getParameter("cardname");
   int cardnumber = Integer.parseInt(request.getParameter("cardnumber"));
   String username = request.getParameter("username");
   String paymentdate = request.getParameter("paymentdate");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
   java.util.Date date =sdf.parse(paymentdate);
   java.sql.Date sql_paymentDate = new java.sql.Date(date.getTime());
   
   
     
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","raghu@317");
   
   PreparedStatement ps=con.prepareStatement("insert into payments(cname,cardnumber,username,paymentdate) values (?,?,?,?)");      
   ps.setString(1,cname); 
   ps.setInt(2,cardnumber);
   ps.setString(3,username);
   ps.setDate(4,sql_paymentDate);
   
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("payments Requested Successfully"); 
 out.print("<center><a href='Home.html'>HOME</a>");
 out.print("<center><a href='payments.html'>BACK</a>");
  
  }
  else
	  out.print("payment Request Is Not Successful"); 
}
catch(Exception e){out.print("payments Request Is Not Successful");
out.print("<center><a href='payments.html'>BACK</a>");
out.println(e);}
%>  
</body>
</html>