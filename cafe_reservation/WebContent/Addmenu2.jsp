<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.util.*" %> 
<%
   request.setCharacterEncoding("UTF-8");
   String userUid = "", userContent = "";
   byte[] userImage = null;

   ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
   sfu.setSizeMax(16 * 1024 * 1024);
   sfu.setHeaderEncoding("UTF-8"); 
   
   List items = sfu.parseRequest(request);
   Iterator iter = items.iterator();
   
   while(iter.hasNext()) {
      FileItem item = (FileItem) iter.next();
      if (!item.isFormField()) 
      {
         if (item.getFieldName().equals("image")) 
         {
            userImage = item.get();
         }
      }
      else {
         if (item.getFieldName().equals("uid")) 
         {
            userUid = item.getString("UTF-8");
         }
         /*else if (item.getFieldName().equals("content")) 
         {
            userContent = item.getString("UTF-8");
         }*/
         out.println(item.getFieldName() + ": " + item.getString("UTF-8") + "<br>");
      }
   }
   
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");

   Statement st = conn.createStatement();

   ResultSet rs = st.executeQuery("select to_char(sysdate, 'yyyy-MM-dd hh:mm') from dual");
	
   if(rs.next()){
	   
   PreparedStatement pstmt = conn.prepareStatement("INSERT INTO menu VALUES(?, ?, ?)");
   
   pstmt.setString(1, userUid);
   pstmt.setBytes(2, userImage);
   pstmt.setString(3, rs.getString(1));

   
   int count = pstmt.executeUpdate();
   
   if (count > 0) 
   {
      response.sendRedirect("menu2.jsp");   
   }
   else
   {
      out.println("<script> alert('요청하신 작업이 처리되지 않습니다.'); history.back(); </script>");
   }
	
   st.close();
   rs.close();
   pstmt.close();
   conn.close();
	}
%>