<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>



<html>
<meta charset="UTF-8">

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>SMILE HOUSE MENU</title>
   <link rel="stylesheet" type="text/css" href="DB.css">
</head>
<body>
<div id="header-area">
   <p class='signup'><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><%= session.getAttribute("userid") %><p>

        <a href = "index.html"><img src ="images/logo.PNG"></a>
        
       <nav>
        <ul>
            <li><a href="menu.jsp">메뉴</a></li>
                <li><a href="reserv.jsp">예약하기</a></li>
                <li><a href="board2.jsp">예약확인</a></li>
                <li><a href="userInfo.jsp">회원정보수정</a></li>
        </ul>    
      <hr>
       </nav>    
</div>


<div id="header-area">
      <%
         String uid = (String)session.getAttribute("userid");
         if (session.isNew() || session.getAttribute("id")==null) {
            session.setAttribute("userid", uid);
         }
         session.setMaxInactiveInterval(3000);
      %>

</div>
     <% 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM menu order by time desc");
   
   
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
   st.close();
   rs.close();
   conn.close();
   %>
   
   
<div id="footer-area"><img src="images/footer.PNG"></div>
</body>
</html>