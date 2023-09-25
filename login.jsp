<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String buttonvalue=request.getParameter("b1");
	int counter,f=0,count=0,timer=0;
	String id,pwd;
	if(buttonvalue.equalsIgnoreCase("login"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
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
						counter=Integer.parseInt(rs.getString(3));
						if(counter>0)
						{
							id=rs.getString(1);
							pwd=rs.getString(2);							
							counter--;
							PreparedStatement psmt=conn.prepareStatement("update login set counter="+counter+" where login_id="+"'"+id+"'"+" and login_password="+"'"+pwd+"'");
							psmt.executeQuery();
							f=1;
							break;
						}
						if(counter==0)
						{
							timer++;
						}
					}
				}
			}
			if(f==1)
			{
				out.println("<script>window.open('Menu.html','_self')</script>");
			}
			else if(timer==1)
			{
				out.println("<script>alert('Time Out')</script>");
			}
			else
			{
				out.println("<script>alert('Access Denied Wrong ID or Password')</script>");
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