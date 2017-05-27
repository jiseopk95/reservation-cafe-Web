<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>
<%

	String pass = request.getParameter("password");
	String pass2 = request.getParameter("ps2");
	String pnum = request.getParameter("pnum");
	String name = request.getParameter("name");
	
	
	
	if(pass.equals(pass2))
	{	

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		Statement st = conn.createStatement();
		
		
		String sql = "INSERT INTO member VALUES('";
		
		sql += request.getParameter("id") + "', '";
		sql += request.getParameter("password") + "', '";
		sql += request.getParameter("name") + "', '";
		sql += request.getParameter("pnum") + "')";
		
		int count = st.executeUpdate(sql);
		
		response.sendRedirect("index.html");
		
		st.close();
		conn.close();
		}
	
	else
	{
		out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
	}

	
%>
</body>
</html>