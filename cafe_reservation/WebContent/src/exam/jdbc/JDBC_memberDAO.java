package exam.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import exam.jdbc.MemberVO;

public class JDBC_memberDAO {

	/**
	 * �ʿ��� property ����
	 */
	Connection con;
	Statement st;
	PreparedStatement ps;
	ResultSet rs;
	
	//MySQL
	String driverName="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/javaking";

	/*
	//ORACLE
	String driverName="oracle.jdbc.driver.OracleDriver";
	String url = " jdbc:oracle:thin:@localhost:1521:ORCL";
	*/
	String id = "scott";
	String pwd ="1234";	
	
    /**
     * �ε�� ������ ���� ������ �ۼ�
     */
    public JDBC_memberDAO(){
       
        try {
            //�ε�
            Class.forName(driverName);
           
            //����
            con = DriverManager.getConnection(url,id,pwd);       
           
        } catch (ClassNotFoundException e) {
           
            System.out.println(e+"=> �ε� ����");
           
        } catch (SQLException e) {
           
            System.out.println(e+"=> ���� ����");
        }
    }//JDBC_memberDAO()
   
    /**
     * DB�ݱ� ��� �޼ҵ� �ۼ�
     */
    public void db_close(){
       
        try {
           
            if (rs != null ) rs.close();
            if (ps != null ) ps.close();       
            if (st != null ) st.close();
       
        } catch (SQLException e) {
            System.out.println(e+"=> �ݱ� ����");
        }      
       
    } //db_close 
   
    /**
     * member���̺� insert�ϴ� �޼ҵ� �ۼ�
     */
    public int memberInsert(MemberVO vo){
        int result = 0;
       
        try{
        //����
            String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";
           
            ps = con.prepareStatement(sql);
            ps.setString(1, vo.getId());
            ps.setString(2, vo.getPwd());
            ps.setString(3, vo.getName());
            ps.setInt(4, vo.getAge());
            ps.setString(5, vo.getAddr());
            ps.setString(6, vo.getJumin1());
            ps.setString(7, vo.getJumin2());
            result = ps.executeUpdate();
           
        }catch (Exception e){
           
            System.out.println(e + "=> memberInsert fail");
           
        }finally{
            db_close();
        }
       
        return result;
    }//memberInsert
   
    /**
     * member���̺��� ��� ���ڵ� �˻���(Select)�� �޼��� �ۼ�
     */
   
    public ArrayList<MemberVO> getMemberlist(){
       
        ArrayList<MemberVO> list = new ArrayList<MemberVO>();
       
        try{//����
            st = con.createStatement();
            rs = st.executeQuery("select * from MEMBER");
           
            while(rs.next()){
                MemberVO vo = new MemberVO();
               
                vo.setId(rs.getString(1));
                vo.setPwd(rs.getString(2));
                vo.setName(rs.getString(3));
                vo.setAge(rs.getInt(4));
                vo.setAddr(rs.getString(5));
                vo.setJumin1(rs.getString(6));
                vo.setJumin2(rs.getString(7));
               
                list.add(vo);
            }
        }catch(Exception e){           
            System.out.println(e+"=> getMemberlist fail");         
        }finally{          
            db_close();
        }      
        return list;
    }//getMemberlist 
	
}
