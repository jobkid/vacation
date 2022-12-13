package DAO;
import beans.CommentBean;
import java.sql.*;
import java.util.*;

public class CommentDAO {

	CommentDAO(){
		
	}
	private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() {
		return instance;
	}
	public Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://127.0.0.1:3306/againstory";
		String id= "root";
		String pw= "iotiot";
		String driver = "com.mysql.cj.jdbc.Driver";
		try {	
			Class.forName(driver);
			conn=DriverManager.getConnection(url, id, pw);
		}catch(Exception e) {
			System.out.println("connection ��ü ���� �� ���� �߻�"+e);
		}
		return conn;
	}
	
	//��� ����
	public int insertComment(CommentBean cb) {
		int result = -1;
		String sql = "insert into comment(nickname, comment, title) values (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {	
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cb.getNickname());
			pstmt.setString(2, cb.getComment());
			pstmt.setString(3, cb.getTitle());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("CommentDAO.insertComment() ���� �� ���� �߻� : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("CommentDAO.insertComment() ���� �� ���� �߻�");
			}
		}
		return result;
	}
	
	//��� ����
	public ArrayList<CommentBean> readComment(int num, int currentPage, int recordsPerPage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int start = currentPage*recordsPerPage-recordsPerPage;
		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
		CommentBean comment = null;
		String sql = "select * from comment where title = (select title from shortboard where num=?) order by num desc limit ?, ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, recordsPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new CommentBean();
				comment.setNum(rs.getInt("num"));
				comment.setNickname(rs.getString("nickname"));
				comment.setComment(rs.getString("comment"));
				comment.setTitle(rs.getString("title"));
				comment.setCommenttime(rs.getString("commenttime"));
				commentList.add(comment);
			}
		}catch(Exception e) {
			System.out.println("��� ��ȸ �� ���� �߻�"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("��� ��ȸ ���� �� ���� �߻�"+ex);
			}
		}
		return commentList;
	}
	
	public int getNumberOfRows() {
		String sql = "select count(num) from comment";
		int numberOfRows = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			numberOfRows = rs.getInt("count(num)");
		}catch(Exception e) {
			System.out.println("��� �� ���� �� ���� �߻� : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("��� �� ���� �� ���� �߻� : "+ex);
			}
		}
			return numberOfRows;
	}
}
