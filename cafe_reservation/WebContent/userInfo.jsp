<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<meta charset="UTF-8">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>SMILE HOUSE 회원정보수정</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   

  
</head>
<body>
<center>
<div id="header-area">
<h8 align="right"><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %></h8>

        <a href = "index.html"><img src ="images/logo.PNG"></a>
</div>
<%
	String idx = (String)session.getAttribute("userid");

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
    
	Statement st = conn.createStatement();
	
	String sql = "SELECT * FROM member where id ='";
	
	sql += session.getAttribute("userid") + "'";
	
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next()){
	String rname = rs.getString("name");
	String rid = rs.getString("id");
	String rpnum = rs.getString("pnum");
	
%>
<div id="mobileselect-section2" style= "margin:5%">
<center>
<h2>회원 정보 수정</h2>
<form method="post" name = "form" action="userInfo2.jsp">
<table>
<hr>
<br>
<tr>
<td>이름</td>
	<td><%=rname%></td>
</tr>
<tr>
<td>아이디</td>
	<td><%=rid%></td><td></td>
</tr>
<tr>
<td>새 패스워드</td>
   <td><input type="password" name="password" id="user_pass" style= "width:100%" required='required'></td>
   <td></td>
</tr>
<tr>
   <td>새 패스워드(확인)</td>
   <td><input type="password" name="ps2" id="chpass" style= "width:100%" required='required'></td>
   <td><font name="check" size="2" color="red"></font></td>
   
</tr>
<tr>
	<td>연락처</td>
	<td><input type="text" name="pnum" id="pnum" onkeyup="autoHypenPhone(str);" value=<%=rpnum%> style="width:100%" maxlength="13"></td>
</tr>


<tr>
	<td colspan=2 align="center">
	<br>
		<input type="submit" value="확인" OnClick="javascript:writeCheck();">
		<input type="reset" value="취소">
	</td>
</tr>
</table>
</form>
</div>
<%} 
	
	
%>
<div id="footer-area"><img src="images/footer.PNG"></div>

</center>
</body>
<script>

$(function(){
	  $('#user_pass').keyup(function(){
	   $('font[name=check]').text('');
	  }); //#user_pass.keyup

	  $('#chpass').keyup(function(){
	   if($('#user_pass').val()!=$('#chpass').val()){
	    $('font[name=check]').text('');
	    $('font[name=check]').html("암호틀림");
	   }else{
	    $('font[name=check]').text('');
	    $('font[name=check]').html("암호맞음");
	   }
	  }); //#chpass.keyup
	 });


function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var pnum = document.getElementById('pnum');
pnum.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}
</script>
</html>