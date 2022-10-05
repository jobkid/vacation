package DAO;
import java.sql.*;
import java.util.*;
import beans.DTOShortStory;

public class ShortStoryDAO {
	private ShortStoryDAO(){
		
	}
	private static ShortStoryDAO instance= new ShortStoryDAO();
	
	public static ShortStoryDAO getInstance() {
		return instance;
	}
	
	//Ŀ�ؼ� ��� ó��
	public Connection getConnection() {
		Connection conn = null;
		String url="jdbc:mysql://127.0.0.1:3306/againstory";
		String id="root";
		String pw="iotiot";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url, id, pw);
		}catch(Exception e) {
			System.out.println("Ŀ�ؼ� ���� �� �����߻�"+e);
		}
		return conn;
	}
	
	//�������� ���� ����ó��
	//���� �������� ��� �������� ���� �ִ���, �� �������� � �ڷḦ ������� �ϴ���
	//�ش� �з����͸� �Ű������� ���޹޵��� ����
	/*
	public List<DTOShortStory> findList(int CurrentPage, int recordsPerPage){
		List<DTOShortStory> List = new ArrayList<DTOShortStory>();
		return List;
	}*/
	
	//�� �Է�
	public int insertStory(DTOShortStory S) {
		int result=-1;
		String sql="insert into shortstory(title, content, nickname, password) values (?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, S.getTitle());
			pstmt.setString(2, S.getContent());
			pstmt.setString(3, S.getNickname());
			pstmt.setString(4, S.getPassword());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("ShortStoryDAO.insertStory() ���� �� ���� �߻�"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("ShortStory.insertStory() ���� �� ���� �߻� : "+ex);
			}
		}
		return result;
	}
	
	//�г��� ��ȸ
	//public DTOShortStory getNickname(String nickname) {}
		
	
	
}
