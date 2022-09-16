package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DTO.listDTO;

public class listDAO {
	private listDAO() {}
	private static listDAO instance=new listDAO();
	public static listDAO getInstance() {
		return instance;
	}
	
	//Ŀ�ؼ� ���� ��� ����
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/study";
		String id="root";
		String pw="iotiot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");	//D�빮�� ����
		conn=DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
	//�����ͺ��̽� ��ȸ���
	public List<listDTO> getList(){
		List<listDTO> list=new ArrayList<listDTO>();
		String sql="select * from sortlist order by idx asc";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//return ResultSet	: select������ ���
			//pstmt.executeUpdate();	//return int : update�� delete���� ���
			while(rs.next()) {
				listDTO DTO=new listDTO();
				DTO.setIdx(rs.getInt("idx"));
				DTO.setText(rs.getString("text"));
				list.add(DTO);
			}
		}catch(Exception e) {
			System.out.println("getList()���� ���� �� �����߻� : "+e);
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("getList()���� ���� ���� �� ���� �߻� : "+ex);
			}
		}
		return list;
	
	}
	
	//�����ͺ��̽� �������
	public void updateList(String[] texts) {
		String sql = "update sortlist set idx=? where text=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			for(int i=0; i<texts.length; i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, i+1);
				pstmt.setString(2,  texts[i]);
				System.out.println(pstmt);
				pstmt.executeUpdate();//Resultset���� �����Ƿ� sql���� ����. resultSet������ 
			}
		}catch(Exception e) {
			System.out.println("updateList() ���� �� ���� �߻� : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				if(rs!=null)rs.close();
			}catch(Exception ex){
				System.out.println("updateList() ���� ���� �� ���� �߻� : "+ex);
			}
		}//updateList().try_catch-finally����ι�
	}//updateList() ����κ�
}//listDAO����κ�
