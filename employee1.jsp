<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
</head>
<body>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.*"%>
<%
	String buttonvalue=request.getParameter("b1");//store button value in btnval after clicking on button save,update,delete,allsearch,search
//save button works here 
	if(buttonvalue.equalsIgnoreCase("save")) 
	{
		String textbox1=request.getParameter("t1");  //store the textbox t1-t18 in textbox1-textbox14 
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
		String textbox12=request.getParameter("t12");
		String textbox13=request.getParameter("t13");
		String textbox14=request.getParameter("t14");
		String textbox15=request.getParameter("t15");
		String textbox16=request.getParameter("t16");
		String textbox17=request.getParameter("t17");
		String textbox18=request.getParameter("t18");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");// oracle Query
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
			psmt.setString(12,textbox12);
			psmt.setString(13,textbox13);
			psmt.setString(14,textbox14);
			psmt.setString(15,textbox15);
			psmt.setString(16,textbox16);
			psmt.setString(17,textbox17);
			psmt.setString(18,textbox18);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved Successfully')</script>");
		}
		catch(Exception e){
			out.println(e.toString());
		}
	}
// End of save button

// Update Codes Start Here
	if(buttonvalue.equalsIgnoreCase("update"))
	{
		String textbox1=request.getParameter("t1");  //store the textbox t1-t18 in textbox1-textbox14 
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
		String textbox12=request.getParameter("t12");
		String textbox13=request.getParameter("t13");
		String textbox14=request.getParameter("t14");
		String textbox15=request.getParameter("t15");
		String textbox16=request.getParameter("t16");
		String textbox17=request.getParameter("t17");
		String textbox18=request.getParameter("t18");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			PreparedStatement psmt=conn.prepareStatement("update employee set email_id=?,first_name=?,last_name=?,fathers_name=?,Gender=?,age=?,dob=?,phone=?,address=?,state=?,city=?,pincode=?,description=?,status=?,start_date=?,end_date=?,job_title=? where staff_id=?");
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
			psmt.setString(11,textbox12);
			psmt.setString(12,textbox13);
			psmt.setString(13,textbox14);
			psmt.setString(14,textbox15);
			psmt.setString(15,textbox16);
			psmt.setString(16,textbox17);
			psmt.setString(17,textbox18);
			psmt.setString(18,textbox1);
			psmt.executeQuery();
			out.println("<script>alert('Record Updated Successfully')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//End of update button

// Delete button codes start Here
if(buttonvalue.equalsIgnoreCase("delete"))
{
	String textbox1=request.getParameter("t1");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
		PreparedStatement psmt=conn.prepareStatement("delete from employee where staff_id=?");
		psmt.setString(1,textbox1);
		psmt.executeQuery();
		out.println("<script>alert('Record Deleted Successfully')</script>");
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}
//Delete codes end here

//All search codes start here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from employee");
%>
		<link rel="stylesheet" href="allsearch.css">
		<body>
		<center>
			<link rel="stylesheet" href="employeeAllsearch.css">
			<h1><u>Online Hostel Management</u></h1>
			<h3><u>Employee Records</u></h3>
			<table border=2>
				<tr>
					<th>Staff Id</th>
					<th>Email Address</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Father's Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Date of Birth</th>
					<th>Phone Number</th>
					<th>Address</th>
					<th>State</th>
					<th>City</th>
					<th>Pincode</th>
					<th>Description</th>
					<th>Status</th>
					<th>Joining Date</th>
					<th>Ending Date</th>
					<th>Job Title</th>
				</tr>
<%
			while(rs.next())
			{
%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4) %></td>	
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6) %></td>	
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8) %></td>	
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10) %></td>	
					<td><%=rs.getString(11)%></td>
					<td><%=rs.getString(12) %></td>	
					<td><%=rs.getString(13)%></td>
					<td><%=rs.getString(14) %></td>	
					<td><%=rs.getString(15)%></td>
					<td><%=rs.getString(16) %></td>	
					<td><%=rs.getString(17)%></td>
					<td><%=rs.getString(18) %></td>	
				</tr>
<%
			}
%>
			</table>
			<input type=button value="Print" onclick="window.print()">
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
// Search button code starts here
	if(buttonvalue.equalsIgnoreCase("search"))
	{
		String s=request.getParameter("s"); 
		String t19=request.getParameter("t19");
		try
		{	
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from employee where" + " "+ s +"=" +"'" + t19 + "'");			
%>	
				<link rel="stylesheet" href="search.css">
				<body>
				<center><form name=r method=post action="updateemployee.jsp">
							<h1><u>Online Hostel Management</u></h1>
    						<h2>Employee Detail</h2>
	<table border=2>
<%			while(rs.next())
			{
%>     
	<tr>
		<th align="left">Staff Id</th>
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
		<th align="left">Fathers Name</th>
		<th><input type=text name=t5 value="<%=rs.getString(5)%>"></th>
	</tr>
	<tr>
		<th align="left">Gender</th>
		<th><input type=text name=t6 value="<%=rs.getString(6)%>"></th>
	</tr>
	<tr>
		<th align="left">Age</th>
		<th><input type=text name=t7 value="<%=rs.getString(7)%>"></th>
	</tr>
	<tr>
		<th align="left">Date of Birth</th>
		<th><input type=text name=t8 value="<%=rs.getString(8)%>"></th>
	</tr>
	<tr>
		<th align="left">Phone Number</th>
		<th><input type=text name=t9 value="<%=rs.getString(9)%>"></th>
	</tr>
	<tr>
		<th align="left">Address</th>
		<th><input type=text name=t10 value="<%=rs.getString(10)%>"></th>
	</tr>
	<tr>
		<th align="left">State</th>
		<th><input type=text name=t11 value="<%=rs.getString(11)%>"></th>
	</tr>
	<tr>
		<th align="left">City</th>
		<th><input type=text name=t12 value="<%=rs.getString(12)%>"></th>
	</tr>
	<tr>
		<th align="left">Pincode</th>
		<th><input type=text name=t13 value="<%=rs.getString(13)%>"></th>
	</tr>
	<tr>
		<th align="left">Description</th>
		<th><input type=text name=t14 value="<%=rs.getString(14)%>"></th>
	</tr>
	<tr>
		<th align="left">Status</th>
		<th><input type=text name=t15 value="<%=rs.getString(15)%>"></th>
	</tr>
	<tr>
		<th align="left">Joining Date</th>
		<th><input type=text name=t16 value="<%=rs.getString(16)%>"></th>
	</tr>
	<tr>
		<th align="left">Ending Date</th>
		<th><input type=text name=t17 value="<%=rs.getString(17)%>"></th>
	</tr>
	<tr>
		<th align="left">Job Title</th>
		<th><input type=text name=t18 value="<%=rs.getString(18)%>"></th>
	</tr>
<%
			}
%>
		</table>
		<table>
			<tr>
				<th><input type="submit" value="Update" name="b1">
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
%>					
</body>
</html>