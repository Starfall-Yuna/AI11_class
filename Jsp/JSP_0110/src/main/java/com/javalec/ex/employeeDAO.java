package com.javalec.ex;

import java.sql.*;

public class employeeDAO {
	// DB 접속에 필요한 정보
	private String url="jdbc:mysql://localhost:3306/apidb";
	private String id="root";
	private String pw="1234";
	
	// DB 연동에 필요한 4가지 불러오기
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;		// 동적 SQL문 작성에 필요한 객체
	
	// 생성자 :: JDBC 드라이버 로드
	public employeeDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("JDBC 드라이버 로드 실패");
		}
	}
	
	// employee DB :: 아이디, 비밀번호, 이름
	// 예상할 수 있는 필요한 기능 :: 
	//	DB에 저장된 아이디 비번 중, 입력으로 받은 아이디 비번이 있는지
	public Boolean check_Account(String input_id, String input_pw) {
		// DB 내용은 DAO 자체에서 접근 가능
		// html에서 입력받은 값은, 매개변수로 받아올 필요가 있겠죠
		
		try {
			// 1. DB 접속 (Connection)
			conn=DriverManager.getConnection(url, id, pw);
			
			// 2. SQL문 실행
			// "DB에 있는 id-passwd 쌍 중에서"
			// "input_id-input_pw 쌍과 동일한 데이터 조회"
			String query= "SELECT * FROM employee WHERE id = ? && passwd = ?";
			ps=conn.prepareStatement(query);	// ps 객체 초기화 (+사용할 쿼리문 미리 적용)
			ps.setString(1, input_id);	// 첫번째 ?에 input_id값을 삽입
			ps.setString(2, input_pw);
			rs=ps.executeQuery();	// SQL문 실행 결과 담기
			
			// 로그인에 성공했다면, rs에 값이 있을 것
			// 		-> rs.next()로 값 조회 가능
			// 로그인에 실패를 했다면, rs에 값이 없을 것	
			//		-> rs.next()로 값 조회X (적절한 값이 없음)
			if(rs.next()) {		// rs에 값이 있다면,
				return true;
			}
			else {
				return false;		// DB에 회원정보가 없을 때
			}
		} catch(Exception e) {
			System.out.println("check_Account 메소드 에러");
			return false;		// 반환형이 있기 때문에, return문 작성은 해야함
		}
	}
	
	// 로그인을 시도하는 계정의 사용자 이름을 반환
	public String getName(String input_id, String input_pw) {
		try {
			// DB 접근
			conn=DriverManager.getConnection(url, id, pw);
			
			// DB에 있는 데이터 중,
			// html 파일에서 입력한 id와 pw가 같은 데이터의 이름 빼오기
			String query="SELECT * FROM employee WHERE id = ? AND passwd = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, input_id);
			ps.setString(2, input_pw);
			rs = ps.executeQuery();
			
			// 반환할 값을 저장할 변수 name 선언 (임의의 값으로 초기화)
			String name="none";
			if(rs.next()) {		// rs에 데이터가 있다면, 
				name=rs.getString("name");		// 해당 데이터의 이름값 갖고옴
			}
			
			return name;
			
		} catch(Exception e) {
			System.out.println("getName 메소드 에러");
			return "error";
		}
	}
}







