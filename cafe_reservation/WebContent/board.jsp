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
   <title>SMILE HOUSE 관리자용 예약확인</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
</head>
<body >
<div id="header-area">
   <p class='signup'><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %></p>

       <a href = "index.html"><img src ="images/logo.PNG"></a>
        
       <nav>
        <ul>
                <li><a href="menu2.jsp">메뉴</a></li>
                <li><a href="Addmenu.jsp">메뉴추가</a></li>
                <li><a href="reserv.jsp">예약확인</a></li>
                <li><a href="menu2.jsp">메뉴&삭제</a></li>
                
        </ul>    
      <hr>
       </nav>    
</div>

<center>

<%
	
	out.println("<table style= 'margin:5%'><center>");
	out.println("<tr align=center style='color:black'><th>이름</th>");
	out.println("<th>연락처</th>");
	out.println("<th>소요시간</th>");
	out.println("<th>예약 시각</th>");
	out.println("<th>예약음료</th>");
	out.println("<th>제조상황</th>");
	out.println("<th></th></tr><tr><td></td></tr>");


	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		
	Statement st = conn.createStatement();

    String sql = "SELECT * FROM reserv order by time asc";

	ResultSet rs = st.executeQuery(sql);

		
	while(rs.next())
	{
		
		out.println("<td><tr align=center>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getString("pnum") + "</td>");
		out.println("<td>" + rs.getString("extime") + "분</td>");
		out.println("<td>" + rs.getString("time") + "</td>");
		out.println("<td>" + rs.getString("drink") + "</td>");
		out.println("<td>제조중</td>");
		out.println("<td><a href='boardmodechan.jsp?id=" + rs.getString("name") + "'>완료</a></td>");
		out.println("</tr>");

	}

	out.println("<tr><td colspan=5 width=700 align=center></tr>");
	out.println("</table>");
	out.println("</center>");
	
	out.println("<p align=right><input type='button' value='전송' onclick='submit();'></p>");
	
	st.close();
	rs.close();
	conn.close();
%>
</div>

<div id="footer-area"><img src="images/footer.PNG"></div>

</center>
</body>

<script type="text/javascript">
function submit(){
	location.href="text.jsp";

}
</script>
