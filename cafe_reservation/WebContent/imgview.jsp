<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>



<html>
<head>
   <title>SMILE HOUSE</title>
   

<%
   String name=request.getParameter("uid");

   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
   
   Statement st = conn.createStatement();
   
   ResultSet rs = st.executeQuery("SELECT * FROM menu where name='"+name+"'");
   
   OutputStream output = response.getOutputStream();
   InputStream input=null;
   
   
   byte[] imageData = null;
   if (rs.next()) {
      Blob img = rs.getBlob("image");
      imageData = img.getBytes(1, (int)img.length());
   }
   
   st.close();
   rs.close();
   conn.close();
   
   
   out.clear();
   pageContext.pushBody();
   
   response.setContentType("image/gif");
   OutputStream os = response.getOutputStream();
   os.write(imageData);
   os.flush();
   os.close();
   %>
   
   
