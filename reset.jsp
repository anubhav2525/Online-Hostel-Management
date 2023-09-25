<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String buttonvalue=request.getParameter("b1");
	String textbox1=request.getParameter("textbox1");
	String textbox2=request.getParameter("textbox2");
	String textbox3=request.getParameter("textbox3");
	int textbox4,f=0;
	if(buttonvalue.equalsIgnoreCase("set"))
	{
		textbox4=Integer.parseInt(textbox3);
		try
		{
			ResultSet rs;		
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from login");
			while(rs.next())
			{		
				if(rs.getString(1).equals(textbox1))
				{
					if(rs.getString(2).equals(textbox2))
					{	
						f++;
						PreparedStatement psmt=conn.prepareStatement("update login set counter=? where login_id=? and login_password=?");
						psmt.setInt(1,textbox4);
						psmt.setString(2,textbox1);
						psmt.setString(3,textbox2);
						psmt.executeQuery();
					}
				}
			}
			if(f==1)
			{
				out.println("<script>alert('Login Field Updated Successfully')</script>");
			}
			else
			{
				out.println("<script>alert('Enter correct Client Id or Password')</script>");
			}
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}		
%>
</body>
</html>