"<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.*"%>
<% 
    String buttonvalue=request.getParameter("b1");

//Save codes start here
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
        try
        {
       		Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
	        PreparedStatement psmt=conn.prepareStatement("insert into payment_receipt values(?,?,?,?,?,?,?,?,?)");
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
//save code ends here

//update code start here
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
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
        PreparedStatement psmt=conn.prepareStatement("update payment_receipt set customer_id=?,booking_id=?,first_name=?,last_name=?,payment_mode=?,payment_details=?,amount=?,dues=? where payment_id=?");
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
        out.println("<script>alert('Record Updated successfully')</script>");
    }
    catch(Exception e)
    {
        out.println(e.toString());
    }  
    } 
// update code ends here

//Delete code start here
    if(buttonvalue.equalsIgnoreCase("delete"))
    {
        String textbox1=request.getParameter("t1");
        try
        {
        	Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
            PreparedStatement psmt=conn.prepareStatement("delete from payment_receipt where payment_id=?");
            psmt.setString(1,textbox1);
            psmt.executeQuery();
            out.println("<script>alert('Record Deleted Successfully')</script>");
        }
        catch(Exception e)
        {
            out.println(e.toString());
        }
    }
//delete code ends here

//Allsearch code starts here
	if(buttonvalue.equalsIgnoreCase("allsearch"))
	{
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver"); //Connectivity
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hostel","hostel"); //Connectivity to database
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from payment_receipt");
%>
			<link rel="stylesheet" href="allsearch.css">
            <body>
            <center>
				<table border=3>
					<tr>
						<th>Payment Id</th>
						<th>Customer ID</th>
						<th>Booking ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Payment Mode</th>
						<th>Payment Details</th>
						<th>Amount</th>
						<th>Rest Balance</th>
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
					</tr>	
<%
			}
%>
				</table>
				<table><tR><th><input type=button value="Print" onclick="window.print()"></th></tR></table>
			</center>
<%
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
//AllSearch code ends here

// Search code starts here
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
			rs=smt.executeQuery("select * from payment_receipt where"+" "+s+"="+"'"+t10+"'");
%>
			<link rel="stylesheet" href="search.css">
				<body>
            <center>
        <form name="U" method="post" action="updatepayment.jsp">
            <h1><u>Online Hostel Management</u></h1>
    						<h2>Payment Detail</h2>
        <table border="2">
<%
			while(rs.next())
			{
%>
			<tr>
                <th align="left">Payment Id</th>
                <th><input type=text name=t1 value="<%=rs.getString(1)%>" readonly></th>
            </tr>
            <tr>
                <th align="left">Customer Id</th>
                <th><input type=text name=t2 value="<%=rs.getString(2)%>"></th>
            </tr>
            <tr>
                <th align="left">Booking Id</th>
                <th><input type=text name=t3 value="<%=rs.getString(3)%>"></th>
            </tr>
            <tr>
                <th align="left">First Name</th>
                <th><input type=text name=t4 value="<%=rs.getString(4)%>"></th>
            </tr>
            <tr>
                <th align="left">Last Name</th>
                <th><input type=text name=t5 value="<%=rs.getString(5)%>"></th>
            </tr>
            <tr>
                <th align="left">Pay Mode</th>
                <th><input type=text name=t6 value="<%=rs.getString(6)%>"></th>
            </tr>
            <tr>
                <th align="left">Payment Detail</th>
                <th><input type=text name=t7 value="<%=rs.getString(7)%>"></th>
            </tr>
            <tr>
                <th align="left">Amount</th>
                <th><input type=text name=t8 value="<%=rs.getString(8)%>"></th>
            </tr>
            <tr>
                <th align="left">Rest Balance</th>
                <th><input type=text name=t9 value="<%=rs.getString(9)%>"></th>
            </tr>	
<%
			}
%>
				</table>
				<table><tR><th>
				<input type=submit value="Update" name=b1>
				<input type=button value="Print" onclick="window.print()"></th></tR></table>
			</center>
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