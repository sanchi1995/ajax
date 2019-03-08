<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter id");  
}else{  
int id=Integer.parseInt(s);  

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mysqljdbc","root","0000");  
PreparedStatement ps=con.prepareStatement("select * from candidates where id=?");  
ps.setInt(1,id);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
out.print(rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(5)+"  "+rs.getString(6));  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  
</body>
</html>