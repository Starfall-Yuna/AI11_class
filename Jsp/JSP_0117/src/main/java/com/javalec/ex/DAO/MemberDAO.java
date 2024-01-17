package com.javalec.ex.DAO;

import java.sql.*;
import javax.sql.DataSource;

import com.javalec.ex.DTO.MemberDTO;

import java.util.*;
import javax.naming.*;

public class MemberDAO {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;
	
	private DataSource ds=null;
	
	public MemberDAO() {
		try {
			// jdbc 드라이버 로드
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e) {
			System.out.println("MemberDAO 생성자 에러");
			e.printStackTrace();
		}
	}
	
	public void MemberInsert(String id, String pw, String name) {
		conn=null;
		ps=null;
		// ds는 초기화하면 DB 접속에 문제가 생김...
		try {
			// DB 접속
			conn=ds.getConnection();
			
			// INSERT 구문 수행
			String query="INSERT INTO member VALUES (?,?,?)";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			}catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	public void MemberDelete(String id) {
		conn=null;
		ps=null;
		
		try {
			conn=ds.getConnection();
			
			String query="DELETE FROM member WHERE id=?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Delete 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			}catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	public boolean MemberLogin(String id, String pw) {
		conn=null;
		ps=null;
		rs=null;
		
		try {
			conn=ds.getConnection();
			
			String query="SELECT * FROM member WHERE id=? AND passwd=?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			if(rs.next()) {return true;}
			else {return false;}
			
		}catch(Exception e) {
			System.out.println("Login 테스트 실패");
			e.printStackTrace();
			return false;
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			}catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<MemberDTO> MemberSelect(){
		ArrayList<MemberDTO> result=new ArrayList<MemberDTO> ();
		conn=null;
		st=null;
		rs=null;
		
		try {
			conn=ds.getConnection();
			
			String query="SELECT * FROM Member";
			st=conn.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next()) {
				MemberDTO element=new MemberDTO();
				element.setId(rs.getString("id"));
				element.setPw(rs.getString("passwd"));
				element.setName(rs.getString("name"));
				// element 객체에 데이터 한 묶음씩 저장하기
				result.add(element);
			}
		} catch (Exception e) {
			System.out.println("SELECT 쿼리 수행 실패");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				st.close();
				rs.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
		
		return result;
	}
}





