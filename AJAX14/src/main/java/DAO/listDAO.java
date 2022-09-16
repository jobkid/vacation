package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DTO.listDTO;

public class listDAO {
	private listDAO() {}
	private static listDAO instance=new listDAO();
	public static listDAO getInstance() {
		return instance;
	}
	
	//커넥션 연결 기능 제작
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String id="root";
		String pw="iotiot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");	//D대문자 주의
		conn=DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	//데이터베이스 조회기능
	public List<listDTO> getList(){
		List<listDTO> list=new ArrayList<listDTO>();
		String sql="select * from sortlist order by idx asc";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//return ResultSet	: select문에서 사용
			//pstmt.executeUpdate();	//return int : update나 delete에서 사용
			while(rs.next()) {
				listDTO DTO=new listDTO();
				DTO.setIdx(rs.getInt("idx"));
				DTO.setText(rs.getString("text"));
				list.add(DTO);
			}
		}catch(Exception e) {
			System.out.println("getList()에서 접속 중 오류발생 : "+e);
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("getList()에서 접속 해제 중 오류 발생 : "+ex);
			}
		}
		return list;
	
	}
	
	//데이터베이스 수정기능
	public void updateList(String[] texts) {
		String sql = "update sortlist set idx=? where text=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			for(int i=0; i<texts.length; i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, i+1);
				pstmt.setString(2,  texts[i]);
				System.out.println(pstmt);
				pstmt.executeUpdate();//Resultset문이 없으므로 sql넣지 말자. resultSet있으면 
			}
		}catch(Exception e) {
			System.out.println("updateList() 접속 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				if(rs!=null)rs.close();
			}catch(Exception ex){
				System.out.println("updateList() 접속 해제 중 오류 발생 : "+ex);
			}
		}//updateList().try_catch-finally좋료부문
	}//updateList() 종료부분
}//listDAO종료부분
