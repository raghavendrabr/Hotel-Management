<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.text.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REPORTS</title>
</head>
<body>
<%
try{
   
   String date_of_reports = request.getParameter("date_of_report");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
   java.util.Date date =sdf.parse(date_of_reports);
   java.sql.Date sql_dor = new java.sql.Date(date.getTime());
   String info = request.getParameter("Information");
   int pid = Integer.parseInt(request.getParameter("paymentid"));
   int phno = Integer.parseInt(request.getParameter("phone_num"));
   
   
     
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","raghu@317");
   
   PreparedStatement ps=con.prepareStatement("insert into reports(date_of_report,information,paymentid,phone_num) values (?,?,?,?)");
    
   ps.setDate(1,sql_dor);  
   ps.setString(2,info);  
   ps.setInt(3,pid); 
   ps.setInt(4,phno); 
   
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Reportrs Requested Successfully"); 
 out.print("<center><a href='Home.html'>HOME</a>");
 out.print("<center><a href='Reports.html'>BACK</a>");
  
  }
  else
	  out.print("Reports Request Is Not Successful"); 
}
catch(Exception e){out.print("Reports Request Is Not Successful");
out.print("<center><a href='Reports.html'>BACK</a>");
out.println(e);}
%>  
</body>
</html>>