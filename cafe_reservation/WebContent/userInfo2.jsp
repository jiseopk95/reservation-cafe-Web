<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<meta charset="euc-kr">
<title>SMILE HOUSE</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>
<%



	String pass = request.getParameter("password");
	String pass2 = request.getParameter("ps2");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
	String sql = "UPDATE member SET password='";
	
	if(pass.equals(pass2))
	{	
		sql += request.getParameter("password") + "', pnum='";
		sql += request.getParameter("pnum") + "' where id='";
		sql += session.getAttribute("userid") + "'";
	}
	
	else
	{
		out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
	}
	
	boolean flag = false;

	
	Statement st = conn.createStatement();

	int count = st.executeUpdate(sql);
	
	if (count > 0)
	{
		flag = true;
	}
	
	else
	{
		out.println("<script> alert('요청하신 작업이 제대로 처리되지 않았습니다.'); history.back(); </script>");
	}
	
	st.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("index.html");
	}
	
	else
	{
		out.println("<script> alert('요청하신 작업이 제대로 처리되지 않았습니다.'); history.back(); </script>");
	}
%>
</body>
</html>