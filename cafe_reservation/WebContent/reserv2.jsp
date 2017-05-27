<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
	
	Statement stmt = conn.createStatement();
	String sql2 = "select to_char(sysdate, 'yyyy-MM-dd hh:mm') from dual";
	
	ResultSet rs2 = stmt.executeQuery(sql2);

	if(rs2.next()){
	
	String sql = "INSERT INTO reserv(name, pnum, drink, time, extime) VALUES('";
	sql += request.getParameter("name") + "', '";
	sql += request.getParameter("pnum") + "', '";
	sql += request.getParameter("drink")+"','";
	sql += rs2.getString(1) + "','";
	sql += request.getParameter("selBox") + "')";

	ResultSet rs = stmt.executeQuery(sql);
	
	

		conn.close();
		stmt.close();
		rs.close();
		out.println("<script> alert('예약이 완료되었습니다.');</script>");
		response.sendRedirect("board2.jsp");
		
	}
	
%>