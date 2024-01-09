<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 데이터베이스 연동과 관련한 객체 선언
	Connection conn = null;		// JDBC 연결을 담당
	Statement stmt = null;		// SQL문 작성에 필요
	ResultSet rs = null;		// SQL문 실행 결과 저장
	
	String url="jdbc:mysql://localhost:3306/apidb";		
		// 어떤 DB 서버를 불러오는지 정의
	String dbId = "root";
	String dbPwd = "1234";
		// 해당 DB 서버의 아이디와 비밀번호 주입
		
	try{ 	// "시도하다."
		// jdbc 드라이버 불러오기
		Class.forName("com.mysql.jdbc.Driver");
		// DB 서버 연결 시도
		conn=DriverManager.getConnection(url, dbId, dbPwd);
		System.out.println("연결 성공");		// 연결 성공했을 때에만 뜨게끔 할 예정
	
		// 쿼리문 작성
		String query = "SELECT * FROM student";
		stmt = conn.createStatement();		// Statement 객체 생성
		rs = stmt.executeQuery(query);		// rs에는 sql문 실행 결과 담겨지게 된다.
	}
	catch (Exception error){
		// DB 서버로 접속이 실패한다면, try문을 계속 실행하지 않고 catch문으로 이동
		out.println("연결에 실패하였습니다.");
	}
%>

	<h2>학생 정보 조회</h2>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>나이</th>
			<th>학년</th>
			<th>전공</th>
		</tr>
		<%while(rs.next()){		// select구문 결과가 있다면 계속 실행 %>
		<tr>
			<td><%= rs.getInt("hakbun") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getInt("age") %></td>
			<td><%= rs.getInt("grade") %></td>
			<td><%= rs.getString("major") %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>



