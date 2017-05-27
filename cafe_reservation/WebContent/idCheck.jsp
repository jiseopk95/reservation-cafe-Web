<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.sql.*,java.sql.*,javax.naming.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복체크</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String f_id = (String)request.getParameter("id");
int check = -1;


Connection conn = null;
Statement st = null;
ResultSet rs = null;

	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		
		String q1 = "select id from member where id = '"+f_id+"'";
		st = conn.createStatement();
		st.executeQuery(q1);
		rs=st.executeQuery(q1);
		if(rs.next())
		{
			check = 1;
		}
		else
		{
			check = 0;
		}
	}finally{
		if(rs != null)try {rs.close();} catch(SQLException err){}
		if(st != null)try {st.close();} catch(SQLException err){}
		if(conn != null)try {conn.close();} catch(SQLException err){}
	}
	
	
	
if(check==1)
{
	
%>
<b><font color='red'><%=f_id %></font>는 이미 사용중인 아이디입니다.</b>
<form name="checkFrom" method="post" action="idCheck.jsp">
<b>다른 아이디를 선택하세요</b> <br/><br/>
<input type="text" name="id"/>
<input type="submit" value="ID중복확인"/>
</form>
<%
}
else
{
%>
<center>
<b>입력하신<front color="red"><%=f_id %></front>는<br/>
사용하실 수 있는 ID입니다.</b>
<input type="button" value="닫기" onclick="setid()">
</center>


<%
}
%>

<script>
function setid()
{
	opener.form.id.value='<%=f_id%>';
	window.self.close();
}
</script>
</body>
</html>
