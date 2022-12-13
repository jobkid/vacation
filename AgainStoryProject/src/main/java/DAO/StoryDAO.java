package DAO;
import java.sql.*;
import java.util.ArrayList;

import beans.StoryBean;

public class StoryDAO {

	private StoryDAO() {
		
	}// 다른 곳에서 생성자를 쓰지 못하게 막는다. 싱글톤을 유지하기 위함
	
	
	private static StoryDAO Instance = new StoryDAO();
	//생성자는 하나 밖에 만들지 못한다. 그래도 생성자를 써야하기 때문에 static으로 잡는다.
	
	public static StoryDAO getInstance() {
		return Instance;
	}
	
	//connection 생성
	public Connection getConnection(){//connection 객체 생성하기
		Connection conn=null;
		String url = "jdbc:mysql://127.0.0.1:3306/againstory";
		String dbid = "root";
		String dbpw = "iotiot";
		String driver = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,dbid, dbpw);
		}catch(Exception e) {
			System.out.println("connection 객체 생성 중 오류 발생"+e);
		}
		return conn;
	}
	
	
	//게시글 삽입
	public int insertStory(StoryBean sb) {
		int result = -1;
		String sql = "insert into shortboard(nickname, pass, title, content) values (?,?,?,?);";
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sb.getNickname());
			pstmt.setString(2, sb.getPass());
			pstmt.setString(3, sb.getTitle());
			pstmt.setString(4, sb.getContent());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("StoryDAO.insertStory() 실행 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("StoryDAOinsertStory() 종료 중 오류 발생 : "+ex);
			}
		}
		return result;
	}
	
	//Again으로 처음 들어갈 때.
	public ArrayList <StoryBean> getStoryList(int currentPage, int recordsPerPage){
		ArrayList <StoryBean> storyList = new ArrayList<StoryBean>();
		int start = currentPage*recordsPerPage-recordsPerPage;
		StoryBean story = null;
		String sql = "select * from shortboard order by num desc limit ?, ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, recordsPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				story = new StoryBean();
				story.setNum(rs.getInt("num"));
				story.setTitle(rs.getString("title"));
				story.setNickname(rs.getString("nickname"));
				story.setWritingdate(rs.getString("writingdate"));
				storyList.add(story);
			}
		}catch(Exception e) {
			System.out.println("글 목록 조회 중 오류 발생" + e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("글 목록 조회 후 오류 발생"+ex);
			}
		}
		return storyList;
	}
	
	//게시글 목록 설정 shortListservlet으로
	public ArrayList <StoryBean> getStoryList(int currentPage, int recordsPerPage, String category, String search){
		ArrayList <StoryBean> storyList = new ArrayList<StoryBean>();;
		int start = currentPage*recordsPerPage-recordsPerPage;
		StoryBean story = null;
		String sql = "select * from shortboard ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(category.equals("num")) {
				sql +="where title like ? or nickname like ? or content like ? order by num desc limit ?, ?;";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setString(3, "%"+search+"%");
				pstmt.setInt(4, start);
				pstmt.setInt(5, recordsPerPage);
			}else if(category.equals("title")){
				sql+="where title like ? order by num desc limit ?, ?";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, recordsPerPage);
			}else if(category.equals("nickname")){
				sql+="where nickname like ? order by num desc limit ?, ?";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, recordsPerPage);
			}else if(category.equals("content")){
				sql+="where title like ? order by num desc limit ?, ?";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, recordsPerPage);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				story = new StoryBean();
				story.setNum(rs.getInt("num"));
				story.setTitle(rs.getString("title"));
				story.setNickname(rs.getString("nickname"));
				story.setWritingdate(rs.getString("writingdate"));
				story.setContent(rs.getString("content"));
				storyList.add(story);
			}
		}catch(Exception e) {
			System.out.println("글 목록 조회 중 오류 발생" + e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("글 목록 조회 후 오류 발생"+ex);
			}
		}
		return storyList;
	}
	
	//회원이 작성한 글 목록
	public ArrayList<StoryBean> getStoryList(int currentPage, int recordsPerPage, String id){
		ArrayList<StoryBean> storyList = new ArrayList<StoryBean>();
		StoryBean story=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int start = currentPage*recordsPerPage-recordsPerPage;
		String sql = "select * from shortboard where nickname in (select nickname from members where id = ?) order by num desc limit ?, ?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, recordsPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				story=new StoryBean();
				story.setNum(rs.getInt("num"));
				story.setTitle(rs.getString("title"));
				story.setNickname(rs.getString("nickname"));
				story.setWritingdate(rs.getString("writingdate"));
				storyList.add(story);
			}
		}catch(Exception e) {
			System.out.println("회원 작성 글 확인 중 오류 발생 : "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("회원 작성 글 확인 후 오류 발생 : "+ex);
			}
			
		}
		return storyList;
	}
	
	//게시글 줄 개수 생성
	public int getNumberOfRows(String category, String search) {
		String sql = "select count(num) from shortboard ";
		int numberOfRows = 0;//몇 개 데이터가 있는지를 저장할 공간
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(category==null) {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				numberOfRows = rs.getInt("count(num)");
			}else if(category=="") {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				numberOfRows = rs.getInt("count(num)");
			}else if(category.equals("num")) {
				sql+="where nickname like ? or title like ? or content like ? ";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setString(3, "%"+search+"%");
				rs = pstmt.executeQuery();
				rs.next();
				numberOfRows = rs.getInt("count(num)");
			}else if(!category.equals("num")&&category!=""&&search!="") {
				sql+= "where num in (select num from shortboard where "+category+" like ?)";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				rs = pstmt.executeQuery();
				rs.next();
				numberOfRows = rs.getInt("count(num)");
			}
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
	
	public int getNumberOfRows(String id) {
		String sql = "select count(num) from shortboard where nickname in (select nickname from members where id = ?)";
		int numberOfRows = 0;//몇 개 데이터가 있는지를 저장할 공간
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
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
	
	//내용 보기
	public StoryBean getContent(int num) {
		StoryBean sb = new StoryBean();;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shortboard where num = ?;";//이부분에서 select 뒤에 *이 아닌 content를 써서 getNum을 찾을 수 없다고 오류가 났었음.
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sb.setNum(rs.getInt("num"));
				sb.setNickname(rs.getString("nickname"));
				sb.setPass(rs.getString("pass"));
				sb.setTitle(rs.getString("title"));
				sb.setWritingdate(rs.getString("writingdate"));
				sb.setContent(rs.getString("content"));
			}
		}catch(Exception e) {
			System.out.println("내용 조회 기능 접속 중 오류 발생"+e);
		}finally {
			try {
				if(rs!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) rs.close();
			}catch(Exception ex) {
				System.out.println("내용 조회 종료 후 오류 발생" +ex);
			}
		}
		return sb;
	}
	
	//게시글 삭제
	public void deleteContent(int num) {
		String sql = "delete from shortboard where num = ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("삭제 중 오류 발생"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("삭제 후 오류 발생"+ex);
			}
		}
	}
	
	//게시글 수정
	public void updateContent(StoryBean sb) {
		String sql = "update shortboard set pass=?, title=?, content=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sb.getPass());
			pstmt.setString(2, sb.getTitle());
			pstmt.setString(3, sb.getContent());
			pstmt.setInt(4, sb.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("수정 중 오류 발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("수정 후 오류 발생");
			}
		}
	}
	
	//댓글 작성
	
}