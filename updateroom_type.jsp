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
%>
</body>
</html>