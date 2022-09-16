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
	
	//Ŀ�ؼ� ��� ó��
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String id="root";
		String pw="iotiot";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	//��� ����� ���� ����ó��
	//���� �������� ��� �������� ���� �ִ���, �� �������� ��� �ڷḦ ������� �ϴ���
	// �ش� �з����͸� �Ű������� ���޹޵��� ����
	public List<pageDTO> findList(int currentPage, int recordsPerPage){
		List<pageDTO> List=new ArrayList<pageDTO>();
		int start=currentPage*recordsPerPage-recordsPerPage;
		//���� ������ ������ ������ �ڷ� ���� ���� �ڿ� ������ �� �ڷ� ���� ���ָ� �������� Ư���� �� �ִ�.
		//1������ 1~10
		//2������ 11~20
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
			System.out.println("PageDAO.findList() ���� �� ���� �߻� : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("PageDAO.findList() ���� ���� �� �����߻� : "+ex);
			}
		}
		
		
		return List;
	}
	//��ü �ڷ��� ������ �������� ����
	public int getNumberOfRows() {
		String sql="select count(num) from page;";
		int numberOfRows=0;//� �����Ͱ� �ִ����� ������ ����
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
			System.out.println("pDAO.getNumberOfRows ���� �� �����߻� : "+e);
		}finally {
			
		}try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		}catch(Exception ex) {
			System.out.println("pDAO.getNumberOfRows ���� ���� �� �����߻� : "+ex);
		}	
		return numberOfRows;
	}	
}