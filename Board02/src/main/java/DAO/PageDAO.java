package DAO;
import java.sql.*;
import java.util.*;

import DTO.pageDTO;

public class PageDAO {
	private PageDAO() {
		
	}
	private static PageDAO instance=new PageDAO();
	
	public static PageDAO getInstance() {
		return instance;
	}
	
	//커넥션 기능 처리
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String id="root";
		String pw="iotiot";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	//목록 출력을 위한 정보처리
	//현재 페이지가 몇번 페이지를 보고 있는지, 한 페이지에 몇개의 자료를 보여줘야 하는지
	// 해당 패러미터를 매개변수로 전달받도록 수정
	public List<pageDTO> findList(int currentPage, int recordsPerPage){
		List<pageDTO> List=new ArrayList<pageDTO>();
		int start=currentPage*recordsPerPage-recordsPerPage;
		//현재 페이지 값에서 보여줄 자료 양을 곱한 뒤에 페이지 당 자료 양을 빼주면 시작점을 특정할 수 있다.
		//1페이지 1~10
		//2페이지 11~20
		//currentPage=1, recordsPerPage :: 0,5
		//currentPage=1, recordsPerPage :: 5,5
		//currentPage=1, recordsPerPage :: 10,5
		
		String sql="select * from page limit ?, ?;";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,  start);
			pstmt.setInt(2,  recordsPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				pageDTO p =new pageDTO();
				p.setNum(rs.getInt("num"));
				p.setTitle(rs.getString("title"));
				p.setContent(rs.getString("content"));
				List.add(p);
			}
		}catch(Exception e) {
			System.out.println("PageDAO.findList() 접속 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("PageDAO.findList() 접속 종료 중 오류발생 : "+ex);
			}
		}
		
		
		return List;
	}
	//전체 자료의 갯수를 가져오는 동작
	public int getNumberOfRows() {
		String sql="select count(num) from page;";
		int numberOfRows=0;//몇개 데이터가 있는지를 저장할 공간
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			numberOfRows=Integer.parseInt(rs.getString(1));
			
		}catch(Exception e) {
			System.out.println("pDAO.getNumberOfRows 접속 중 오류발생 : "+e);
		}finally {
			
		}try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		}catch(Exception ex) {
			System.out.println("pDAO.getNumberOfRows 접속 종료 후 오류발생 : "+ex);
		}	
		return numberOfRows;
	}	
}