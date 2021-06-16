<%@ page import="java.sql.*"%>
<%
String name1=request.getParameter("rname");
String email1=request.getParameter("remail");
String user1=request.getParameter("ruser");
String pass1=request.getParameter("renterpass");
String pass2=request.getParameter("rconpass");

if(pass1.equals(pass2))
	{

		try
			{	
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SYSTEM", "MrRay@k");
				PreparedStatement ps = con.prepareStatement("insert into registration values(?,?,?,?,?)");
				ps.setString(1, name1);
				ps.setString(2, email1);
				ps.setString(3, user1);
				ps.setString(4, pass1);
				ps.setString(5, pass2);
				int x=ps.executeUpdate();
				
				if(x!=0)
				{
					response.sendRedirect("login.html");
				}
				
				else
				{
					out.println("Invalid Password !!!");
					out.println("<br><a href='registration.html'>GO to RegistrationPage<a/>");
				}
			}
		
		catch(Exception e)
			{
				out.print(e);
			}
	
	}



	

%>
