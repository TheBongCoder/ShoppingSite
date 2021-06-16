<%@ page import= "java.sql.*" %>
<%@ page session="true" %>
<% 

String user=request.getParameter("username");
String pass=request.getParameter("password");

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","MrRay@k");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from registration ");

while(rs.next())
{
if(user.equals(rs.getString("user1")) && pass.equals(rs.getString("pass1")))
{
session.setAttribute("userid",user);
out.println("login successfully");
response.sendRedirect("website1.html");
}

} 
out.println("RE-ENTER USERNAME AND PASSWORD");
out.println("<br><a href='login.html'>GO to LoginPage<a/>");

} 
catch(Exception e)
{
	out.println(e);
	
}


%>
