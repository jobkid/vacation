package DAO;
import Beans.NoticeBean;
import java.sql.*;
import java.util.ArrayList;

public class NoticeDAO {
	
	String url = "jdbc:mysql://127.0.0.1:3306/dobong1";
	private final String URL = "jdbc:mysql://127.0.0.1:3306/dobong1";
	private final String ID = "root";
	private final String PASS = "iotiot";
	private final String DRIVER="com.mysql.cj.jdbc.Driver";
	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance() {
		return instance;
	}
	
	//connection ��ȯ
	public Connection getConnection() throws Exception {
		Class.forName(DRIVER);
		Connection conn = null;
		conn = DriverManager.getConnection(URL, ID, PASS);
		return conn;
	}
	// �Խñ� ��� ��ȸ
	public ArrayList <NoticeBean> getNotice() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		String Query = "select * from notice";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query);
			while(rs.next()) {
				NoticeBean notice = new NoticeBean();
				notice.setNumber(rs.getInt(notice.getNumber()+1));
				notice.setNickname(rs.getString("nickname"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setFile(rs.getString("file"));
				notice.setWritingtime(rs.getString("writingtime"));
				notice.setChangetime(rs.getString("changetime"));
				noticeList.add(notice);
			}
		}catch(Exception e) {
			System.out.println("�Խ��� ���� ��ȸ �� ���� �߻�"+e);
		}finally{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("�Խ��� ���� ��ȸ ���� �� ���� �߻�"+ex);
			}
				
		}
		return noticeList;
	}
	//�Խñ� ���� ��ȸ
	
	public NoticeBean getPost(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice where number=?";
		NoticeBean nb = new NoticeBean();
		//=number
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nb.setNumber(rs.getInt("number"));
				nb.setNickname(rs.getString("nickname"));
				nb.setTitle(rs.getString("title"));
				nb.setContent(rs.getString("content"));
				nb.setWritingtime(rs.getString("writingtime"));
			}
		}catch(Exception e) {
			System.out.println("�Խù� ��ȸ �� ���� �߻�"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("�Խù� ���� ��ȸ ���� �� ���� �߻�"+ex);
			}
		}
		return nb;
	}
	
	/*
	public void getPost(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *from notice where number=?;";
		NoticeBean nb = new NoticeBean();
		//=number
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nb.setNumber(rs.getInt("number"));
				nb.setNickname(rs.getString("nickname"));
				nb.setTitle(rs.getString("title"));
				nb.setContent(rs.getString("content"));
				nb.setWritingtime(rs.getString("writingtime"));
			}
		}catch(Exception e) {
			System.out.println("�Խù� ��ȸ �� ���� �߻�"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("�Խù� ���� ��ȸ ���� �� ���� �߻�"+ex);
			}
		}
	}*/
	
	//�Խ��� �Է�
	public int insertNotice(NoticeBean nb) {
		int flag = -1;
		String sql = "insert into notice(nickname, title, content) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nb.getNickname());
			pstmt.setString(2, nb.getTitle());
			pstmt.setString(3, nb.getContent());
			flag = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("indertNotice ���� �� ���� �߻�"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("insertNotice() ���� �� ���� �߻� : "+ex);
			}
		}
		return flag;
	}
	
	//��ȣ�� ���� ����
	public int getNum() throws Exception {
		getConnection();
		
		int num;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		NoticeBean notice = new NoticeBean();
		getNotice().listIterator(notice.getNumber()+1);
		String Query = "select number from notice";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query);
			if(rs.next()) {
				
				notice.setNumber(rs.getInt(notice.getNumber()+1));
			}
			
		}catch(Exception e) {
			System.out.println("�Խ��� ���� ��ȸ �� ���� �߻�"+e);
		}finally{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("�Խ��� ���� ��ȸ ���� �� ���� �߻�"+ex);
			}
				
		}
		num=notice.getNumber();
		return num;
	}
	
}