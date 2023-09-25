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
	String buttonvalue=request.getParameter("b1");  //Stores the button value in buttonvalue
//save codes starts here
	if(buttonvalue.equalsIgnoreCase("save"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			PreparedStatement psmt=conn.prepareStatement("insert into room_type values(?,?,?)");
			psmt.setString(1,textbox1);
			psmt.setString(2,textbox2);
			psmt.setString(3,textbox3);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
// Save codes ends here

//update codes starts here
if(buttonvalue.equalsIgnoreCase("update"))
{
	String textbox1=request.getParameter("t1");
	String textbox2=request.getParameter("t2");
	String textbox3=request.getParameter("t3");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
		PreparedStatement psmt=conn.prepareStatement("update room_type set room_type=?,room_price=? where room_number=?");
		psmt.setString(1,textbox2);
		psmt.setString(2,textbox3);
		psmt.setString(3,textbox1);
		psmt.executeQuery();
		out.println("<script>alert('Record Update Successfully')</script>");
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}
//Update codes ends here

//Delete code Start here
if(buttonvalue.equalsIgnoreCase("delete"))
{
	String textbox1=request.getParameter("t1");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
		PreparedStatement psmt=conn.prepareStatement("delete from room_type where room_number=?");
		psmt.setString(1,textbox1);
		psmt.executeQuery();
		out.println("<script>alert('Record Deleted Successfully')</script>");
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}
//Delete codes ends here

// All Search starts here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");//Connectivity
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");//Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from room_type");
%>
			<link rel="stylesheet" href="allsearch.css">
			<body>
			<center>
					<h1><u>Online Hostel Management</u></h1>
			<h3><u>Room Type Records</u></h3>
			<table border=2>
				<tr>
					<th>Room Number</th>
					<th>Room Type</th>
					<th>Room Price</th>
	<%
			while(rs.next())
			{
	%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
		<%	} %>
		</table>
		<table>
			<tr><th><input type=button value="Print" onclick="window.print()"></th></tr>
		</table>
		</center>
		</body>
<%		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Allsearch ends here
%>
<%
//search starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String s=request.getParameter("s");
		String t4=request.getParameter("t4");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from room_type where"+" "+s+"="+"'"+t4+"'");
%>
			<link rel="stylesheet" href="search.css">
			<body>
			<center>
			<form name=u method=post action=updateroom_type.jsp>
							<h1><u>Online Hostel Management</u></h1>
    						<h2>Room Type Details Detail</h2>
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
                <th align="left">Room Type</th>
                <th><input type=text name=t2 value="<%=rs.getString(2)%>"></th>
            </tr>
            <tr>
                <th align="left">Room Price</th>
                <th><input type=text name=t3 value="<%=rs.getString(3)%>"></th>
            </tr>
<%
			}
%>	
			</table>
			<table>
				<tr>
					<th>
						<input type=submit value="Update" name=b1>
						<input type=button value="Print" onclick="window.print()"></th></tr>
			</table>
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
//search code ends here
%>
</body>
</html>