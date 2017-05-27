<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.script.Invocable"%>
<%@ page import="javax.script.ScriptEngine"%>
<%@ page import="javax.script.ScriptEngineManager"%>
<%@ page import="javax.script.ScriptException"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
 
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:smilehouse/1234@localhost:1521:xe");
		
	 Statement st = conn.createStatement();
	
		String sql = "SELECT * FROM reserv where extime < 10 order by time asc";
	
		ResultSet rs = st.executeQuery(sql);
	
	
	String fileName = "C:\\test11.txt" ;
	 
	 
	try{
	     
	    // 파일 객체 생성
	    File file = new File(fileName) ;
	     
	    // true 지정시 파일의 기존 내용에 이어서 작성
	    FileWriter fw = new FileWriter(file, true) ;
	     
	    // 파일안에 문자열 쓰기
	    fw.write("\t\t\t예약자\t\t전화번호\t예상소요시간\t\t예약음료\t\t예약시각\r\n");
	    fw.write("\r\n");
	    fw.write("=================================================================================================================================\r\n");
	    
	    
	 	while(rs.next()){
		 
	
				String name = rs.getString("name");
				String pnum = rs.getString("pnum");
				String extime = rs.getString("extime");
				String drink = rs.getString("drink");
				String time = rs.getString("time");
			
			fw.write("\r\n");
		    fw.write("\t\t\t"+name+"\t\t"+pnum+"\t\t"+extime+"\t\t"+drink+"\t\t"+time+"\r\n");
		   
		    
	 	}
		    fw.flush();
		
		    // 객체 닫기
		    fw.close(); 
		    
	 }
	catch(Exception e){
	    e.printStackTrace();
	}
	response.sendRedirect("board.jsp");
%>

</body>