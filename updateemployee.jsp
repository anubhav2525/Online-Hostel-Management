<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
		String buttonvalue=request.getParameter("b1");//store button value in btnval after clicking on button save,update,delete,allsearch,search
//Update button works here
		
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
%>
</body>
</html>