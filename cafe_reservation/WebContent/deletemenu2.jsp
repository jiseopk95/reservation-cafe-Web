<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
	String uid = new String(request.getParameter("uid").getBytes("8859_1"), "UTF-8");
	Statement st = conn.createStatement();
	 
	String sql = "DELETE FROM menu WHERE name='";
	sql += uid + "'";
	 
	int count = st.executeUpdate(sql);
	 
	if (count>0)
	{
	  response.sendRedirect("menu2.jsp");
	}
	else
	{
	  out.println("<script> alert('요청하신 작업이 처리되지 않습니다.'); history.back(); </script>");
	}
	 
	st.close();
	conn.close();
%>