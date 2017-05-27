<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>
<%
String uid = request.getParameter("id");

if(session.isNew() || session.getAttribute("userid") == null)
{
	session.setAttribute("userid", uid);
	session.setMaxInactiveInterval(600000); 
}

	String sql = "SELECT * FROM member where id = '"+uid+"'";
	session.setAttribute("userid",uid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	boolean flag = false;
	boolean admin = false;
	
	
	if (rs.next())
	{
		String pass = request.getParameter("ps");
		if(pass.equals(rs.getString("password")))
		{
			if(uid.equals("admin"))
			{
				admin = true;
			}
			else
			{
			flag = true;
			}
		}
		else
		{
			out.println("<script> alert('패스워드가 일치하지 않습니다.'); window.location='index.html'; </script>");
			//window.location은 지정된 곳으로 돌아가버리는 것. 입력했던 파라미터는 당연히 다 날라감. 쿠키를 이용해서 이를 보충해야 함.
		}
	}
	else 
	{
		out.println("<script> alert('사용자가 존재하지 않습니다.'); history.back(); </script>");
		//history.back은 자기가 왔던 곳으로 돌아가는 것. 입력했던 파라미터가 그대로 남아있음
	}
	
	st.close();
	rs.close();
	conn.close();
	
	if (admin)
	{
		response.sendRedirect("menu2.jsp");
	}
	
	if (flag)
	{
		response.sendRedirect("menu.jsp");
	}
%>

</body>
</html>