<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<title>SMILE HOUSE</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>
<%
	String name = request.getParameter("id");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		
	Statement st = conn.createStatement();
	
	String sql1 ="delete from reserv where name='" + name+"'";
		
	ResultSet rs = st.executeQuery(sql1);
	
	if(rs.next())
	{
		response.sendRedirect("board.jsp");
		
	}


	st.close();
	rs.close();
	conn.close();
	

%>
</div>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>