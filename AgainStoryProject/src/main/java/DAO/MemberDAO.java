package DAO;
import java.sql.*;
import beans.MemberBean;
import java.util.*;

public class MemberDAO {
	private String ADMIN;
	
	private MemberDAO() {
		
	}//다른 곳에서 생성자를 쓰지 못하게 막는다. 싱글톤을 유지하기 위함.

	private static MemberDAO instance = new MemberDAO();
	//생성자는 하나 밖에 만들지 못한다. 그래도 생성자를 써야 하기 때문에 static으로 잡는다.
	
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
	
	//회원 정보 조회
	public MemberBean getMember(String id) {
		MemberBean m=null;
		String sql="select * from members where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new MemberBean();
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
				m.setTribe(rs.getString("tribe"));
			}
		}catch(Exception e) {
			System.out.println("멤버 정보 조회 중 오류 발생 : "+e);
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
	
	//전체 회원 조회
	public ArrayList <MemberBean> getMember() {
		MemberBean member=null;
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		String sql="select * from members";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				member=new MemberBean();
				member.setNum(rs.getString("num"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setNickname(rs.getString("nickname"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setBirthday(rs.getString("birthday"));
				member.setPlace(rs.getString("place"));
				member.setJoindate(rs.getString("joindate"));
				member.setTribe(rs.getString("tribe"));
				memberList.add(member);
			}
		}catch(Exception e) {
			System.out.println("전체 멤버 정보 조회 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("멤버정보 조회 종료 중 오류 발생 : "+ex);
			}
		}
		return memberList;
	}
	
	//검색 회원 조회
	public ArrayList <MemberBean> getMember(String element, String column){
		MemberBean member=null;
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		//String sql= "select * from members where id = ? or name = ? or nickname = ? or email = ? or phone = ? or birthday = ? or place = ? or tribe = ?;";
		String sql= " ";
		sql="select * from members where "+column+"=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, element);
//			pstmt.setString(1, elements[0]);
//			pstmt.setString(2, elements[1]);
//			pstmt.setString(3, elements[2]);
//			pstmt.setString(4, elements[3]);
//			pstmt.setString(5, elements[4]);
//			pstmt.setString(6, elements[5]);
//			pstmt.setString(7, elements[6]);
//			pstmt.setString(8, elements[7]);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				member=new MemberBean();
				member.setNum(rs.getString("num"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setNickname(rs.getString("nickname"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setBirthday(rs.getString("birthday"));
				member.setPlace(rs.getString("place"));
				member.setJoindate(rs.getString("joindate"));
				member.setTribe(rs.getString("tribe"));
				memberList.add(member);
			}
		}catch(Exception e) {
			System.out.println("멤버 정보 검색 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("멤버정보 조회 종료 중 오류 발생 : "+ex);
			}
		}
		return memberList;
	}
	
	
	
	//회원 가입
	public int insertMember(MemberBean m) {
		int result=-1;
		//String sql="insert into members(name, id, pwd, nickname, email, phone, birthday, place) values (?,?,?,?,?,?,?,?)";

		String sql="insert into members(name, id, pwd, nickname, email, phone, birthday, place, tribe) values (?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(9, m.getTribe());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("MemberDAO.insertMember() 실행 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("MemberDAO.insertMember() 종료 중 오류 발생 : "+ex);
			}
		}
		
		return result;
	}
	
	//사용자 인증처리(로그인)
	public int userCheck(String id, String pwd) {
		int result = -1;
		String sql = "select pwd from members where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//해당 아이디가 존재하는 경우
				if(rs.getString("pwd").equals(pwd)&&rs.getString("pwd")!=null) {
					//아이디가 존재하고 비밀번호가 일치하는 경우
					result=1;
				}else {//비밀번호가 없거나 일치하지 않는 경우
					result=0;
				}
			}else {
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("로그인 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("로그인 회선 종료 중 오류 발생 : "+ex);
			}
		}
		return result;//계산된 결과를 return;
	}
}