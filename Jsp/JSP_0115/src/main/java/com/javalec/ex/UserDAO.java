package com.javalec.ex;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.Context;

public class UserDAO {
	private Connection conn=null;
	private Statement st=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	// DAO 생성자에서 드라이버 로드 -> Class.forName()
	// 각 메소드에서 url, id, pw과 conn을 통해서, DB 접속
	// => DB 접속에 시간 많이 걸림
	
	// 시간 절약을 위해서, DataSource 객체 사용
	private DataSource ds=null;
	
	public UserDAO() {
		// jdbc 드라이버 로드
		try {
			// 해당 프로젝트의 컨텍스트 내용 찾음 (리소스 찾음)
			Context ctx=new InitialContext();
			// 위 리소스로, DataSource 객체 초기화
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		}catch(Exception e) {
			System.out.println("UserDAO 생성자 에러");
			e.printStackTrace();
		}
	}
	
	public void insertUser(String id, String pw, String name, int age, String gender) {
		conn=null;
		ps=null;
		try {
			// DataSource 객체 통해서 DB 접속
			// (서버에 있는 리소스로 즉시 접속 시도)
			conn=ds.getConnection();
			
			String query="INSERT INTO user VALUES (?,?,?,?,?)";
			ps=conn.prepareStatement(query);
			// Insert 구문에서 칼럼 순서를 명시하지 않으면
			// 테이블 생성시 칼럼 선언한 순서대로 삽입
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setInt(4, age);
			ps.setString(5, gender);
			ps.executeUpdate();
			
			System.out.println("회원가입이 성공적으로 완료되었습니다.");
		} catch(Exception e) {
			System.out.println("insertUser 메소드 에러");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch(Exception e2) {
				System.out.println("객체 닫기 실패");
				e2.printStackTrace();
			}
		}
	}
 }









