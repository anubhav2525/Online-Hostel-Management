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
%>
</body>
</html>