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
	// save code starts here
	if(buttonvalue.equalsIgnoreCase("save"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		String textbox4=request.getParameter("t4");
		String textbox5=request.getParameter("t5");
		String textbox6=request.getParameter("t6");
		String textbox7=request.getParameter("t7");
		String textbox8=request.getParameter("t8");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			PreparedStatement psmt=conn.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?)");
			psmt.setString(1,textbox1);
			psmt.setString(2,textbox2);
			psmt.setString(3,textbox3);
			psmt.setString(4,textbox4);
			psmt.setString(5,textbox5);
			psmt.setString(6,textbox6);
			psmt.setString(7,textbox7);
			psmt.setString(8,textbox8);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//save codes ends here

//Update codes starts here
	if(buttonvalue.equalsIgnoreCase("update"))
	{
		String textbox1=request.getParameter("t1");
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		String textbox4=request.getParameter("t4");
		String textbox5=request.getParameter("t5");
		String textbox6=request.getParameter("t6");
		String textbox7=request.getParameter("t7");
		String textbox8=request.getParameter("t8");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("update booking set customer_id=?,room_number=?,hostel_id=?,booking_date=?,check_in_date=?,check_out_date=?,number_of_night=? where booking_id=?");
			psmt.setString(1,textbox2);
			psmt.setString(2,textbox3);
			psmt.setString(3,textbox4);
			psmt.setString(4,textbox5);
			psmt.setString(5,textbox6);
			psmt.setString(6,textbox7);
			psmt.setString(7,textbox8);
			psmt.setString(8,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Update codes ends here

//delete code start here
	if(buttonvalue.equalsIgnoreCase("delete"))
	{
		String textbox1=request.getParameter("t1");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("delete from booking where booking_id=?");
			psmt.setString(1,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Deleted Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Delete code ends here

//Allsearch code starts here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from booking");
%>
			<link rel="stylesheet" href="allsearch.css">
			<body>
			<center>
				<table border=3>
					<tr>
						<th>Booking ID</th>
						<th>Customer ID</th>
						<th>Room Number</th>
						<th>Hostel Id</th>
						<th>Booking Date</th>
						<th>Check In Date</th>
						<th>Check Out Date</th>
						<th>Number of Nights</th>
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
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
						<td><%=rs.getString(8) %></td>
					</tr>
<%
			}
%>
				</table>
				<table><tr><th><input type=button value="Print" onclick="window.print()"></th></tr></table>
			</center>
			</body>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//allsearch code ends here

//search code starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String s=request.getParameter("s");
		String t9=request.getParameter("t9");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from booking where"+" "+s+"="+"'"+t9+"'");
%>
			<link rel="stylesheet" href="search.css">
				<body>
			<center>
	<form name=u method=post action="updatebooking.jsp">
	<h1><u>Online Hostel Management</u></h1>
    						<h2>Booking Detail</h2>
        <table border=3>
<%
			while(rs.next())
			{
%>
			<tr>
                <th align="left">Booking ID</th>
                <th><input type=text name=t1 value="<%=rs.getString(1)%>" readonly></th>
            </tr>
            <tr>
                <th align="left">Customer Id</th>
                <th><input type=text name=t2 value="<%=rs.getString(2)%>"></th>
            </tr>
            <tr>
                <th align="left">Room Number</th>
                <th><input type=text name=t3 value="<%=rs.getString(3)%>"></th>
            </tr>
            <tr>
                <th align="left">Hostel Id</th>
                <th><input type=text name=t4 value="<%=rs.getString(4)%>"></th>
            </tr>
            <tr>
                <th align="left">Booking Date</th>
                <th><input type=text name=t5 value="<%=rs.getString(5)%>"></th>
            </tr>
            <tr>
                <th align="left">Check In Date</th>
                <th><input type=text name=t6 value="<%=rs.getString(6)%>"></th>
            </tr>
            <tr>
                <th align="left">Check Out Date</th>
                <th><input type=text name=t7 value="<%=rs.getString(7)%>"></th>
            </tr>
            <tr>
                <th align="left">Number of Nights</th>
                <th><input type=text name=t8 value="<%=rs.getString(8)%>"></th>
            </tr>
<%
			}
%>
				</table>
				<table><tr><th>
				<input type=submit value="Update" name=b1>
				<input type=button value="Print" onclick="window.print()"></th></tr></table>
			</center>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Search ends here
%>
</body>
</html>