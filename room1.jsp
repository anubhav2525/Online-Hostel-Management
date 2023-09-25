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
//save button works here
	if(buttonvalue.equalsIgnoreCase("save"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		String textbox4=request.getParameter("t4");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			PreparedStatement psmt=conn.prepareStatement("insert into room values(?,?,?,?)");
			psmt.setString(1,textbox1);
			psmt.setString(2,textbox2);
			psmt.setString(3,textbox3);
			psmt.setString(4,textbox4);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Save codes start here

//Updates codes start here
	if(buttonvalue.equalsIgnoreCase("update"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		String textbox4=request.getParameter("t4");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("update room set room_image=?,room_description=?,hostel_id=? where room_number=?");
			psmt.setString(1,textbox2);
			psmt.setString(2,textbox3);
			psmt.setString(3,textbox4);
			psmt.setString(4,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Update code ends here

//Delete code starts here
	if(buttonvalue.equalsIgnoreCase("delete"))
	{
		String textbox1=request.getParameter("t1");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			PreparedStatement psmt=conn.prepareStatement("delete from room where room_number=?");
			psmt.setString(1,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Delete Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Delete code ends here

//All Search starts here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from room");
%>
			<link rel="stylesheet" href="allsearch.css">
			<body>		
			<center>
			<table border=2>
				<tr>
					<th>Room Number</th>
					<th>Room Image</th>
					<th>Room Description</th>
					<th>Hostel Id</th>
				</tr>
<%
			while(rs.next())
			{
%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
<%
			}
%>
			</table>
			<table><tr><th><input type=button value="Print" onclick="window.print()"></th></tr></table></center></body>			
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//All Search ends here
%>		
<%
//Search code starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String s=request.getParameter("s");
		String t5=request.getParameter("t5");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from room where"+" "+s+"="+"'"+t5+"'");
%>
			<link rel="stylesheet" href="search.css">
				<body>
			<center>
			 <form name="u" method="post" action="updateroom.jsp">
					<h1><u>Online Hostel Management</u></h1>
    						<h2>Room Detail</h2>
			<table border=2>					
<%
			while(rs.next())
			{
%>
			<tr>
                <th align="left">Room Number</th>
                <th><input type=text name=t1 value="<%=rs.getString(1)%>" readonly></th>
            </tr>
            <tr>
                <th align="left">Room Image</th>
                <th><input type=text name=t2 value="<%=rs.getString(2) %>"></th>
            </tr>
            <tr>
                <th align="left">Room Description</th>
                <th><input type=text name=t3 value="<%=rs.getString(3) %>"></th>
            </tr>
            <tr>
                <th align="left">Hostel Id</th>
                <th><input type=text name=t4 value="<%=rs.getString(4)%>"></th>
            </tr>
<%
			}
%>
				</table>
				<table>
					<tr>
						<th>
							<input type=submit value="Update" name=b1>
							<input type=button value="Print" onclick="window.print()"></th></tr></table>
			</form>
			</center>	
			</body>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Search code ends here
%>					
						
</body>
</html>