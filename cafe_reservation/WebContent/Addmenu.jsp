 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<meta charset="UTF-8">

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>SMILE HOUSE 메뉴추가</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
   

  
</head>
<body>

<div id="header-area">
   <h8 align="right"><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %></h8>

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
<h2>메뉴 등록</h2>


<form method="post" action="Addmenu2.jsp" enctype="multipart/form-data">

<table>
   <tr>
      <td align="right">메뉴 이름</td>
      <td><input type="text" name="uid" size=35></td>
   </tr>
   <tr>
      <td align="right">사진</td>
      <td><input type="file" name="image"></td>
   </tr>
   <tr>
      <td colspan=2 align="center">
      <input type="submit" value="확인">
      <input type="reset" value="취소">
      </td>
   </tr>
</table>

</form>


</center>

<div id="footer-area"><img src="images/footer.PNG"></div>

</body>
</html>