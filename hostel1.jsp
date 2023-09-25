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
	String buttonvalue=request.getParameter("b1"); //Stores the value of button b1 in buttovalue save,update,delete,allsearch,search
//save codes starts here
	if(buttonvalue.equalsIgnoreCase("save"))
	{
		String textbox1=request.getParameter("t1");//textbox1-textbox8 carry the t1-t8 text by textbox
		String textbox2=request.getParameter("t2");
		String textbox3=request.getParameter("t3");
		String textbox4=request.getParameter("t4");
		String textbox5=request.getParameter("t5");
		String textbox6=request.getParameter("t6");
		String textbox7=request.getParameter("t7");
		String textbox8=request.getParameter("t8");
		String textbox9=request.getParameter("t9");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("insert into hostel values(?,?,?,?,?,?,?,?,?)");
			psmt.setString(1,textbox1);
			psmt.setString(2,textbox2);
			psmt.setString(3,textbox3);
			psmt.setString(4,textbox4);
			psmt.setString(5,textbox5);
			psmt.setString(6,textbox6);
			psmt.setString(7,textbox7);
			psmt.setString(8,textbox8);
			psmt.setString(9,textbox9);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//save codes ends here

// Update Codes Start here
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
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
		PreparedStatement psmt=conn.prepareStatement("update hostel set hostel_name=?,address=?,city=?,state=?,pincode=?,phone=?,manager_id=?,number_employee=? where hostel_id=?");
		psmt.setString(1,textbox2);
		psmt.setString(2,textbox3);
		psmt.setString(3,textbox4);
		psmt.setString(4,textbox5);
		psmt.setString(5,textbox6);
		psmt.setString(6,textbox7);
		psmt.setString(7,textbox8);
		psmt.setString(8,textbox9);
		psmt.setString(9,textbox1);
		psmt.executeQuery();
		out.println("<script>alert('Record Updated Successfully')</script>");
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}
//Update code ends here

//Delete code Starts Here
if(buttonvalue.equalsIgnoreCase("delete"))
{
	String textbox1=request.getParameter("t1");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
		PreparedStatement psmt=conn.prepareStatement("delete from hostel where hostel_id=?");
		psmt.setString(1,textbox1);
		psmt.executeQuery();
		out.println("<script>alert('Record Deleted Successfully')</script>");
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}//Delete codes ends here

//All search codes start here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from hostel");
%>
		<link rel="stylesheet" href="allsearch.css">
		<body>
		<center>
			<h1><u>Online Hostel Management</u></h1>
			<h3><u>Hostel Records</u></h3>
			<table border=2>
				<tr>
					<th>Hostel Id</th>
					<th>Hostel Name</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Pincode</th>
					<th>Phone Number</th>
					<th>Manager Id</th>
					<th>Number of Employees</th>
				</tr>
<%
			while(rs.next())
			{
%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>	
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>	
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>	
					<td><%=rs.getString(9)%></td>	
				</tr>
<%
			}
%>
			</table>
			<table>
				<tr>
					<th><input type=button value="Print" onclick="window.print()"></th>
				</tr>
			</table>
		</center>
		</body>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//All Search button ends here

//Search button code starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String s=request.getParameter("s");
		String t10=request.getParameter("t10");
		try
		{	
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from hostel where" + " "+ s +"=" +"'" + t10 + "'");		
%>	
			<link rel="stylesheet" href="search.css">
			<body>
				<center>
        <form name="u" method="post" action="updatehostel.jsp">
			<h1><u>Online Hostel Managenemt</u></h1>
			<h2>Hostel Details</h2>
        <table border=3>
<%			while(rs.next())
			{
%>
			<tr>
                <th align=left>Hostel Id</th>
                <th><input type=text name=t1 value="<%=rs.getString(1)%>"></th>
            </tr>
            <tr>
                <th align="left">Hostel Name</th>
                <th><input type=text name=t2 value="<%=rs.getString(2)%>"></th>
            </tr>
            <tr>
                <th align=left>Address</th>
                <th><input type=text name=t3 value="<%=rs.getString(3)%>"></th>
            </tr>
            <tr>
                <th align=left>City</th>
                <th><input type=text name=t4 value="<%=rs.getString(4)%>"></th>
            </tr>
            <tr>
                <th align="left">State</th>
                <th><input type=text name=t5 value="<%=rs.getString(5)%>"></th>
            </tr>
            <tr>
                <th align="left">Pincode</th>
                <th><input type=text name=t6 value="<%=rs.getString(6)%>"></th>
            </tr>
            <tr>
                <th align="left">Phone Number</th>
                <th><input type=text name=t7 value="<%=rs.getString(7)%>"></th>
            </tr>
            <tr>
                <th align="left">Manager Id</th>
                <th><input type=text name=t8 value="<%=rs.getString(8)%>"></th>
            </tr>
            <tr>
                <th align="left">Number of Employees</th>
                <th><input type=text name=t9 value="<%=rs.getString(9)%>"></th>
            </tr>

<%
			}
%>
		</table>
		<table>
			<tr>
				<th>
					<input type=submit value="Update" name=b1>
					<input type=button value="Print" onclick="window.print()">
				</th>
			</tr>
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
//Search code ends here
%>

</body>
</html>