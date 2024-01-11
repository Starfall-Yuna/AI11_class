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
	
	// DB 접속 메소드
	public Boolean Connect() {
		conn=null;
		try {
			conn=DriverManager.getConnection(url, id, pw);
			return true;
		} catch (Exception e) {
			// 위 구문 실패하면, 이쪽으로 넘어오니까 false 반환
			System.out.println("DB 접속 실패");
			return false;
		} 
	}
	
	// 입력받은 id, pw와 일치한 계정 찾기
	public ResultSet SearchUser(String id, String pw) {
		this.Connect();		// DB 연결
		
		// conn 같은 경우에는 Connect()의 값을 유지해서 사용해야하기 때문에
		// null값으로 초기화하면 안됨
		ps=null;
		ResultSet result=null;
		try {
			String query= "SELECT * FROM employee WHERE id = ? && passwd = ?";
			ps=conn.prepareStatement(query);	// ps 객체 초기화 (+사용할 쿼리문 미리 적용)
			ps.setString(1, id);	// 첫번째 ?에 input_id값을 삽입
			ps.setString(2, pw);
			result=ps.executeQuery();
		} catch(Exception e) {
			System.out.println("계정 탐색 중 에러");
		}
		
		return result;
	}
	
	// employee DB :: 아이디, 비밀번호, 이름
	// 예상할 수 있는 필요한 기능 :: 
	//	DB에 저장된 아이디 비번 중, 입력으로 받은 아이디 비번이 있는지
	public Boolean check_Account(String input_id, String input_pw) {
		// DB 내용은 DAO 자체에서 접근 가능
		// html에서 입력받은 값은, 매개변수로 받아올 필요가 있겠죠
		rs=null;
		try {
			rs=this.SearchUser(input_id, input_pw);
			
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
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			}catch(Exception e2) {
				System.out.println("getName() 객체 닫기 실패");
			}
		}
	}
	
	// 로그인을 시도하는 계정의 사용자 이름을 반환
	public String getName(String input_id, String input_pw) {
		rs=null;
		try {
			rs=this.SearchUser(input_id, input_pw);
			
			// 반환할 값을 저장할 변수 name 선언 (임의의 값으로 초기화)
			String name="none";
			if(rs.next()) {		// rs에 데이터가 있다면, 
				name=rs.getString("name");		// 해당 데이터의 이름값 갖고옴
			}
			
			return name;
			
		} catch(Exception e) {
			System.out.println("getName 메소드 에러");
			return "error";
		} finally {
			try {
				conn.close();
				ps.close();
				rs.close();
			}catch(Exception e2) {
				System.out.println("getName() 객체 닫기 실패");
			}
		}
	}

	public void changePw(String id, String cPw) {
		// id :: 비밀번호 변경할 계정을 찾기 위해 필요함
		// cPw :: 변경할 비밀번호 값
		try {
			this.Connect();		// DB 접속
			
			// employee 테이블에서,
			// 비밀번호를 변경하고자 하는 계정을 찾고 (WHERE id=?)
			// 입력받은 값으로 비밀번호를 변경하라. (SET passwd=?)
			String query="UPDATE employee SET passwd=? WHERE id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, cPw);
			ps.setString(2, id);
			ps.executeUpdate();		// 데이터 변경을 할 때엔 이걸 사용
		} catch (Exception e) {
			System.out.println("changePw 메소드 에러");
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println("changePw 객체 닫기 실패");
			}
		}
	}
	
	// 특정 회원정보 삭제하는 메소드
	public void deleteUser(String id) {
		// DB 데이터(회원계정) 삭제를 수행 -> "그래서 무슨 계정을 삭제할 것인가"
		// id값을 매개변수로 받아서, 삭제할 데이터 선택
		this.Connect();		// DB에 접속
		
		try {
			// id값을 통해 선택된 데이터 삭제하는 쿼리문 string형으로 우선 작성
			String query="DELETE FROM employee WHERE id = ?";
			ps=conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
			// executeQuery() :: SELECT문(데이터 조회)
			// executeUpdate() :: UPDATE문(데이터 수정), DELETE문, INSERT문
		} catch(Exception e) {
			System.out.println("회원정보 삭제 중 오류");
		}
	}
}







