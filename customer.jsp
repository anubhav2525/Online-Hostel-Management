<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.*" %>
<%
	String buttonvalue=request.getParameter("b1");
//save code start here
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
		String textbox9=request.getParameter("t9");
		String textbox10=request.getParameter("t10");
		String textbox11=request.getParameter("t11");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			PreparedStatement psmt=conn.prepareStatement("insert into customer_details values(?,?,?,?,?,?,?,?,?,?,?)");
			psmt.setString(1,textbox1);
			psmt.setString(2,textbox2);
			psmt.setString(3,textbox3);
			psmt.setString(4,textbox4);
			psmt.setString(5,textbox5);
			psmt.setString(6,textbox6);
			psmt.setString(7,textbox7);
			psmt.setString(8,textbox8);
			psmt.setString(9,textbox9);
			psmt.setString(10,textbox10);
			psmt.setString(11,textbox11);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Save code starts here

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
		String textbox9=request.getParameter("t9");
		String textbox10=request.getParameter("t10");
		String textbox11=request.getParameter("t11");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("update customer_details set email_id=?,first_name=?,last_name=?,gender=?,age=?,address=?,city=?,state=?,pincode=?,phone=? where customer_id=?");
			psmt.setString(1,textbox2);
			psmt.setString(2,textbox3);
			psmt.setString(3,textbox4);
			psmt.setString(4,textbox5);
			psmt.setString(5,textbox6);
			psmt.setString(6,textbox7);
			psmt.setString(7,textbox8);
			psmt.setString(8,textbox9);
			psmt.setString(9,textbox10);
			psmt.setString(10,textbox11);
			psmt.setString(11,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated Successfully')</script>");		
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Update code ends here

//Delete code start here
	if(buttonvalue.equalsIgnoreCase("delete"))
	{
		String textbox1=request.getParameter("t1");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("delete from customer_details where customer_id=?");
			psmt.setString(1,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Deleted Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
// Delete codes ends here

//Allsearch code starts here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from customer_details");
%>
			<link rel="stylesheet" href="allsearch.css">
			<body>
			<center>
				<table border=3>
					<tr>
						<th>Customer Id</th>
						<th>Email Address</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Address</th>
						<th>City</th>
						<th>State</th>
						<th>Pincode</th>
						<th>Phone Number</th>
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
					<td><%=rs.getString(9) %></td>
					<td><%=rs.getString(10) %></td>
					<td><%=rs.getString(11) %></td>
				</tr>
<%
			}
%>
				</table>
				<table><tr><TH><input type=button value="Print" onclick="window.print()"></TH></tr></table>
				</center>
				</body>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//Allsearch code ends here
%>
<%
//search code starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String t12=request.getParameter("t12");
		String s=request.getParameter("s");
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel");
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from customer_details where"+" "+s+"="+"'"+t12+"'");
%>
			<link rel="stylesheet" href="search.css">
				<body>
			<center>
        <form name="u" method="post" action="updatecustomer.jsp">
			<h1><u>Online Hostel Management</u></h1>
    						<h2>Employee Detail</h2>
        <table border=2>
					
<%
			while(rs.next())
			{
%>
            <tr>
                <th align="left">Customer Id</th>
                <th><input type=text name=t1 value="<%=rs.getString(1)%>" readonly></th>
            </tr>
            <tr>
                <th align="left">Email Address</th>
                <th><input type=text name=t2 value="<%=rs.getString(2)%>"></th>
            </tr>
            <tr>
                <th align="left">First Name</th>
                <th><input type=text name=t3 value="<%=rs.getString(3)%>"></th>
            </tr>
            <tr>
                <th align="left">Last Name</th>
                <th><input type=text name=t4 value="<%=rs.getString(4)%>"></th>
            </tr>
            <tr>
                <th align="left">Gender</th>
                <th><input type=text name=t5 value="<%=rs.getString(5)%>"></th>
            </tr>
            <tr>
                <th align="left">Age</th>
                <th><input type=text name=t6 value="<%=rs.getString(6)%>"></th>
            </tr>
            <tr>
                <th align="left">Address</th>
                <th><input type=text name=t7 value="<%=rs.getString(7)%>"></th>
            </tr>
            <tr>
                <th align="left">City</th>
                <th><input type=text name=t8 value="<%=rs.getString(8)%>"></th>
            </tr>
            <tr>
                <th align="left">State</th>
                <th><input type=text name=t9 value="<%=rs.getString(9)%>"></th>
            </tr>
            <tr>
                <th align="left">Pincode</th>
                <th><input type=text name=t10 value="<%=rs.getString(10)%>"></th>
            </tr>
            <tr>
                <th align="left">Phone Number</th>
                <th><input type=text name=t11 value="<%=rs.getString(11)%>"></th>
            </tr>
            
<%
			}
%>
				</table>
				<table><tr><TH>
				<input type=submit value="Update" name=b1>
				<input type=button value="Print" onclick="window.print()"></TH></tr></table>
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