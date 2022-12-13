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
	public int getNumberOfRows(String category, String search) {
		String sql = "select count(num) from members ";
		int numberOfRows = 0;//몇 개 데이터가 있는지를 저장할 공간
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(category.equals("num")&&search==null) {
				sql += "where num in (select num from members where num)";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}else if(search!=null){
				sql += "where num in (select num from members where "+category+" like ?)";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				rs = pstmt.executeQuery();			
			}
			rs.next();
			numberOfRows = rs.getInt("count(num)");
		}catch(Exception e) {
			System.out.println("게시글 줄 개수 생성 중 오류 발생"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("게시글 줄 개수 생성 후 오류 발생 : "+ex);
			}
		}		
		return numberOfRows;
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
				m.setNum(rs.getInt("num"));
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
	public ArrayList <MemberBean> getMember(int currentPage, int recordsPerPage) {
		MemberBean member=null;
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		int start=currentPage*recordsPerPage-recordsPerPage;
		String sql="select * from members limit ?, ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, recordsPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				member=new MemberBean();
				member.setNum(rs.getInt("num"));
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
		public ArrayList <MemberBean> getMember(String element, String column, int currentPage, int recordsPerPage){
			MemberBean member=null;
			ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
			//String sql= "select * from members where id = ? or name = ? or nickname = ? or email = ? or phone = ? or birthday = ? or place = ? or tribe = ?;";
			String sql ="select * from members ";
			int start=currentPage*recordsPerPage-recordsPerPage;
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				conn=getConnection();
				if(column.equals("num")){
					sql+="where name like ? or id like ? or nickname like ? or "+
						"email like ? or phone like ? or birthday like ? or "+
						"place like ? or tribe like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setString(2, "%"+element+"%");
					pstmt.setString(3, "%"+element+"%");
					pstmt.setString(4, "%"+element+"%");
					pstmt.setString(5, "%"+element+"%");
					pstmt.setString(6, "%"+element+"%");
					pstmt.setString(7, "%"+element+"%");
					pstmt.setString(8, "%"+element+"%");
					pstmt.setInt(9, start);
					pstmt.setInt(10, recordsPerPage);
				}else if(column.equals("name")) {
					sql+="where name like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("id")) {
					sql+="where id like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("nickname")) {
					sql+="where nickname like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("email")) {
					sql+="where email like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("phone")) {
					sql+="where phone like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("birthday")) {
					sql+="where birthday like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("place")) {
					sql+="where place like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}else if(column.equals("tribe")) {
					sql+="where tribe like ? limit ?, ?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+element+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, recordsPerPage);
				}
				rs=pstmt.executeQuery();	
				while(rs.next()) {
					member=new MemberBean();
					member.setNum(rs.getInt("num"));
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
	
	public void updateMember(MemberBean member) {
		String sql = "update members set name = ?, id = ?, pwd = ?, nickname = ?, email = ?, phone = ?, place = ?, tribe = ? where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getPlace());
			pstmt.setString(8, member.getTribe());
			pstmt.setInt(9, member.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원 정보 수정 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("회원 정보 수정 후 오류 발생 : "+ex);
			}
		}
	}
	
	public void deleteMember(int num) {
		String sql = "delete from members where num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원 삭제 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("회원 삭제 후 오류 발생 : "+ex);
			}
		}
		
	}
}