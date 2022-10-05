package DAO;

import java.sql.*;
import java.util.*;
import DTO.productDTO;

public class productDAO {
	private productDAO() {}
	private static productDAO instance = new productDAO();
	public static productDAO getInstance() {
		return instance;
	}
	
	//커넥션 기능 처리 메서드
	public Connection getConnection() throws Exception{
		Connection conn = null;
		String url = "jdbc:mysql://127.0.0.1:3306/study";
		String id = "root";
		String pw = "iotiot";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	//커넥션 연결해제 처리 메서드
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {//select 해제
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("연결해제 중 오류 발생");
		}
	}
	
	public static void close(Connection conn, Statement stmt) {
		try {//update해제
			stmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("연결 해제 중 오류발생 : "+e);
		}
	}
	
	//데이터베이스 조회 기능
	public List<productDTO> selectAllProducts(){
		List<productDTO> list=new ArrayList<productDTO>();
		String sql = "select * from product order by code desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);//rs가 있으므로 여기서 sql해야 함.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				productDTO p = new productDTO();
				p.setCode(rs.getInt("code"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setPictureurl(rs.getString("pictureurl"));
				p.setDescription(rs.getString("description"));
				list.add(p);
			}
		}catch(Exception e) {
			System.out.println("전체조회 중 오류 발생 : "+e);
		}finally {
			productDAO.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//데이터베이스 입력기능(상품등록) //자바는 세팅이 구할이다.
	public void insertProduct(productDTO p) {
		String sql = "insert into product(name, price, pictureurl, description) values (?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getPictureurl());
			pstmt.setString(4, p.getDescription());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("제품 입력 중 오류 발생 : "+e);
		}finally {
			productDAO.close(conn, pstmt);
		}
	}
	
	//데이터베이스 개별 조회기능(개별상품보기)
	public productDTO selectProduct(String code) {
		productDTO DTO = null;
		String sql = "select * from product where code = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				DTO = new productDTO();
				DTO.setCode(rs.getInt("code"));
				DTO.setName(rs.getString("name"));
				DTO.setPrice(rs.getInt("price"));
				DTO.setPictureurl(rs.getString("pictureurl"));
				DTO.setDescription(rs.getString("description"));
			}
		}catch(Exception e) {
			System.out.println("개별상품 조회 중 오류 발생 : "+e);
		}finally {
			productDAO.close(conn, pstmt, rs);
		}
		return DTO;
	}
	
	//데이터베이스 수정 기능(상품 수정)
	public void updateProduct(productDTO DTO) {
		String sql = "update product set name=?, price=?, pictureurl=?, description=? where code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, DTO.getName());
			pstmt.setInt(2, DTO.getPrice());
			pstmt.setString(3, DTO.getPictureurl());
			pstmt.setString(4,  DTO.getDescription());
			pstmt.setInt(5, DTO.getCode());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("수정 중 오류 발생 : "+e);
		}finally {
			productDAO.close(conn, pstmt);
		}
	}
	
	//데이터베이스 삭제 기능(상품제거)
	public void deleteProduct(String code) {
		String sql = "delete from product where code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();
			//executeUpdate() : return Integer 변경내역이 여러 줄일 경우에 사용/
		}catch(Exception e) {
			System.out.println("상품 삭제 중 오류 발생 : "+e);
		}finally {
			productDAO.close(conn, pstmt);
		}
	}
}
