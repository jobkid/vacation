package DAO;
import java.sql.*;
import beans.Member;

public class MemberDao {
	private MemberDao(){
		
	}//다른 곳에서 생성자를 쓰지 못하게 막는다.//싱글톤을 유지하기 위함.
	private static MemberDao instance = new MemberDao();
	//생성자는 하나 밖에 만들지 못한다. 그래도 생성자를 써야하기 때문에 static으로 잡는다.
	
	public static MemberDao getInstance() {
		return instance;
	}
	//케넥션
	public Connection getConnection() throws Exception {
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String db_id="root";
		String db_pw="iotiot";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url, db_id, db_pw);
		
		return conn;
	}
	
	//사용자 인증처리(로그인)
	public int userCheck(String userid, String pwd) {
		int result=-1;
		String sql="select pwd from member where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {//해당 아이디가 존재하는 경우
				if(rs.getString("pwd").equals(pwd)&&rs.getString("pwd")!=null) {
					//아이디가 존재하고 비밀번호가 일치하는 경우
					result=1;
				}else {//비밀번호가 없거나 일치하지 않는경우
					result=0;
				}
			}else {//해당 아이디가 존재하지 않는 경우
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("로그인 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("로그인 회선 종료 중 오류 발생 :"+ex);
			}
		}
		
		return result;//계산된 결과를 return
	}
	//사용자 정보 조회
	public Member getMember(String userid) {
		Member m=null;
		String sql="select * from member where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setNum(rs.getString("num"));
				m.setName(rs.getString("name"));
				m.setUserid(rs.getString("userid"));
				m.setPwd(rs.getString("pwd"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAdmin(rs.getString("admin"));
			}
		}catch(Exception e) {
			System.out.println("멤버정보 조회 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("멤버정보 조회 종료 중 오류 발생 : "+ex);
			}
		}
		return m;
	}
	//아이디 중복체크 처리를 진행할 메서드
	public int confirmID(String userid) {
		int result=1;
		String sql="select userid from member where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=1;
			}else {
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("MemberDao.confirmID()에서 접속 중 오류발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("MemberDao.confirm()에서 접속 후");
			}
			
		}
		return result;
	}
	//회원가입을 실행할 메서드
	public int insertMember(Member m) {
		int result=-1;
		String sql="insert into member(name, userid, pwd, email, phone, admin) values (?,?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setString(2,  m.getUserid());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4,  m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6,  m.getAdmin());
			result=pstmt.executeUpdate();//변경된 row수가 return값이므로 insert문은 항상 1을 반환
		}catch(Exception e) {
			System.out.println("MemberDao.insertMember() 샐행 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("MemberDao.insertMember() 종료 중 오류 발생 : "+ex);
			}
		}
		return result;
	}
	
	//회원정보 변경 기능
	public int updateMember(Member m) {
		int result=-1;
		String sql="update member set pwd=?, email=?, phone=?, admin=? where userid=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAdmin());
			pstmt.setString(5, m.getUserid());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("Dao.updateMember() 수행 중 접속 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("Dao.updateMember() 수행 중 접속 종료 오류 발생 : "+ex);
			}
		}	
		return result;
	}
}
