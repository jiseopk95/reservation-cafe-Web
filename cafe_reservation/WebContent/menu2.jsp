<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>



<html>
<head>
   <title>관리자용 MENU</title>
    <link rel="stylesheet" type="text/css" href="DB.css">
</head>
<body>
     <p class='signup'><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %></p>
      
  
     <div id="header-area">
        <a href = "index.html"><img src ="images/logo.PNG"></a>
       <nav>
       
        <ul>
             <li><a href="menu2.jsp">메뉴</a></li>
             <li><a href="Addmenu.jsp">메뉴추가</a></li>
             <li><a href="board.jsp">예약확인</a></li>
             <li><a href="menu2.jsp">메뉴&삭제</a></li>
        </ul>    
      <hr>
       </nav>    
</div>

<%
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
   Statement st = conn.createStatement();

   ResultSet rs = st.executeQuery("SELECT name FROM menu order by time desc");
   
   
   
   out.println("<div class=container-fluid>");
   out.println("<div class=row>");
   out.println("<div><h1>MENU</h1></div>");
   out.println("</div>");

   
   out.println("<div class=row>");   
   
   while(rs.next()) {

      out.println("<div class='image' style='display:inline-block;'><img style=' display:block;'  class='r_ima' src='imgview.jsp?uid=" + rs.getString("name") +"' width=150 height=150   onClick='deletemenu(\""+rs.getString("name")+"\");'>");
      
      out.println("<p>"+rs.getString(1)+"</p>");

      out.println("</div>");

   }

   
   out.println("<br>"); out.println("<br>");
  
   %>
   
   
   
<div id="footer-area"><img src="images/footer.PNG"></div>


<script>
function deletemenu(name){
	
	window.location="deletemenu.jsp?uid="+name;
}
</script>
<% st.close();
rs.close();
conn.close(); %>

</body>
</html>