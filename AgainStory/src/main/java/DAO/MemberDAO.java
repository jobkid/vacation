package DAO;
import java.sql.*;
import beans.Member;

public class MemberDAO {
	private MemberDAO() {
		
	}//�ٸ� ������ �����ڸ� ���� ���ϰ� ���´�. �̱����� �����ϱ� ����.

	private static MemberDAO instance = new MemberDAO();
	//�����ڴ� �ϳ� �ۿ� ������ ���Ѵ�. �׷��� �����ڸ� ��� �ϱ� ������ static���� ��´�.
	
	public static MemberDAO getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url = "jdbc:mysql://127.0.0.1:3306/againstory";
		String dbid="root";
		String dbpw="iotiot";
		String driver="com.mysql.cj.jdbc.Driver";
		Class.forName(driver);
		conn=DriverManager.getConnection(url, dbid, dbpw);
		return conn;
	}
	
	//ȸ�� ���� ��ȸ
	public Member getMember(String id) {
		Member m=null;
		String sql="select *from members where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setNum(rs.getString("num"));
				m.setName(rs.getString("name"));
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setNickname(rs.getString("nickname"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setBirthday(rs.getString("birthday"));
				m.setPlace(rs.getString("place"));
				m.setJoindate(rs.getString("joindate"));
				m.setAdmin(rs.getString("admin"));
				
			}
		}catch(Exception e) {
			System.out.println("��� ���� ��ȸ �� ���� �߻� : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("������� ��ȸ ���� �� ���� �߻� : "+ex);
			}
		}
		return m;
	}
	
	
	//ȸ�� ����
	
	public int insertMember(Member m) {
		int result=-1;
		String sql="insert into members(name, id, pwd, nickname, email, phone, birthday, place, admin) values (?,?,?,?,?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getId());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getBirthday());
			pstmt.setString(8, m.getPlace());
			pstmt.setString(9, m.getAdmin());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("MemberDAO.insertMember() ���� �� ���� �߻� : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("MemberDAO.insertMember() ���� �� ���� �߻� : "+ex);
			}
		}
		
		return result;
	}
	
	//����� ����ó��(�α���)
	public int userCheck(String id, String pwd) {
		int result=-1;
		String sql="select pwd from members where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//�ش� ���̵� �����ϴ� ���
				if(rs.getString("pwd").equals(pwd)&&rs.getString("pwd")!=null) {
					//���̵� �����ϰ� ��й�ȣ�� ��ġ�ϴ� ���
					result=1;
				}else {//��й�ȣ�� ���ų� ��ġ���� �ʴ� ���
					result=0;
				}
			}else {
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("�α��� �� ���� �߻� : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("�α��� ȸ�� ���� �� ���� �߻� : "+ex);
			}
		}
		
		return result;//���� ����� return;
	}
}
