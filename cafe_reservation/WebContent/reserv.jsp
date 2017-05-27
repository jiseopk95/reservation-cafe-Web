<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>



<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>음료 예약</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
</head>
<body>
<%String userid = (String)session.getAttribute("userid"); %>

<div id="header-area">
      <p class='signup'><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= userid %><p>

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
<form name="form" method="post"  action="reserv2.jsp">
	

<table style='margin-bottom:10%; margin-top:10%;'>

    <tr>
    <td>예상 시간</td>
    <td>
    <select name="selBox" id="select">
			<option value="20">20분 후</option>
			<option value="15">15분 후</option>
			<option value="10">10분 후</option>
			<option value="5">5분 후</option>
	</select> 
	</td>
    </tr>
	
	
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
	
	Statement stmt = conn.createStatement();
		
	String sql = "SELECT name, pnum FROM member WHERE id='" + userid+"'";

	ResultSet rs = stmt.executeQuery(sql);
	
	  
	 if(rs.next())
	 {
		 
	    out.println("<tr>");
		out.println("<td>이름</td>");
		out.println("<td><input type='text' name='name' style= 'width:100%' value='"+rs.getString(1)+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>전화번호</td>");
		out.println("<td><input type='text' name='pnum' id = 'pnum'  style= 'width:100%' value='"+rs.getString(2)+"'></td>");
		out.println("</tr>");
	 }
		%>
	<tr>
	<td>예약 음료</td>
	<td><input type="text" name="drink" placeholder = "정확한 음료 이름"  style= "width:100%"></td>
	</tr>
	<tr>
	<td colspan=2 align="center"><input type="button" value="예약" OnClick="javascript:writeCheck();"></td>
	</tr>
</table>
</form>


<div id="footer-area"><img src="images/footer.PNG"></div>


<script>
function logout(){
	
	location.href="logout.jsp";
}

function writeCheck()
{
 var form = document.form;
 
 if( !form.name.value )   // form 에 있는 name 값이 없을 때
 {
  alert( "이름을 적어주세요" ); // 경고창 띄움
  form.name.focus();   // form 에 있는 name 위치로 이동
  return;
 }
if( !form.pnum.value )
 {
  alert( "전화번호를 적어주세요" );
  form.pnum.focus();
  return;
 }

if( !form.drink.value )
{
 alert( "예약할 음료를 적어주세요" );
 form.drink.focus();
 return;
}

form.submit();
}
 
 
 
</script>
</center>
</body>
</html>