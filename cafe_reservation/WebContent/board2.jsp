<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.script.Invocable"%>
<%@ page import="javax.script.ScriptEngine"%>
<%@ page import="javax.script.ScriptEngineManager"%>
<%@ page import="javax.script.ScriptException"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>SMILE HOUSE 예약확인</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
</head>
<body >
<div id="header-area">
   <p class='signup'><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %></p>

        <a href = "index.html"><img src ="images/logo.PNG"></a>
        
       <nav>
        <ul>
             <li><a href="menu.jsp">메뉴</a></li>
             <li><a href="reserv.jsp">예약하기</a></li>
             <li><a href="userInfo.jsp">회원정보수정</a></li> 
        </ul>    
      <hr>
       </nav>    
</div>

<center>

<%
	out.println("<table style= 'margin:5%'><center>");
	out.println("<tr align=center style='color:black'><td>이름</td>");
	out.println("<td>연락처</td>");
	out.println("<td>소요시간</td>");
	out.println("<td>예약 시각</td>");
	out.println("<td>예약음료</td>");
	out.println("<td></td></tr>");


	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		
	Statement st = conn.createStatement();

    String sql = "SELECT * FROM reserv order by time asc";
		
    ResultSet rs = st.executeQuery(sql);
		
	while(rs.next())
	{
	
		out.println("<tr align=center>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getString("pnum") + "</td>");
		out.println("<td>" + rs.getString("extime") + "분</td>");
		out.println("<td>" + rs.getString("time") + "</td>");
		out.println("<td>" + rs.getString("drink") + "</td>");
		out.println("</tr>");
	}

	out.println("<tr><td colspan=5 width=700 align=center></tr>");
	out.println("</table>");
	out.println("</center>");
	
	
	st.close();
	rs.close();
	conn.close();
%>
</div>

<div id="footer-area"><img src="images/footer.PNG"></div>

</center>
</body>


