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
	String buttonvalue=request.getParameter("button1");
int f=0;
//Login works here
	if(buttonvalue.equalsIgnoreCase("login"))
	{
		String textbox1=request.getParameter("textbox1");
		String textbox2=request.getParameter("textbox2");
		
		try
		{
			ResultSet result;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			result =smt.executeQuery("select * from adminlogin");
			while(result.next())
			{
				if(result.getString(1).equalsIgnoreCase(textbox1))
				{
					if(result.getString(2).equalsIgnoreCase(textbox2))
					{
						f++;
						break;
					}
				}
			}
			if(f==1)
			{
				out.println("<script>window.open('reset.html')</script>");
			}
			else
			{
				out.println("<script>alert('User Not Found')</script>");
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