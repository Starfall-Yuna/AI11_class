package com.javalec.ex;

import java.sql.*;
import java.util.*;

public class studentDAO {
	// DB 서버 url, 아이디, 비밀번호 선언
	private String url="jdbc:mysql://localhost:3306/apidb";
	private String id="root";
	private String passwd="1234";
		
	// DB랑 연결하기 위해 필요한 객체 선언
	private Connection conn=null;		// DB 연결 객체
	private Statement st=null;		// SQL문 실행을 위한 객체
	private ResultSet rs=null;		// SQL문 실행 결과를 담는 객체
	
	public studentDAO() {
		try {	// "시도를 해봄"
			// JDBC 드라이버 불러오기
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {		// try문 실행하다 에러 발생하면
			// 실행을 중단하고 catch문으로 이동
			System.out.println("JDBC 드라이버 로드 실패");
		}
	}
	
	public ArrayList<String> showAllStudent() {
		// 메소드 반환값으로 할 배열 선언
		ArrayList<String> result=new ArrayList<String> ();
		
		try {
			// DB랑 접속
			conn=DriverManager.getConnection(url, id, passwd);
			
			String query="SELECT * FROM student";	// 실행할 쿼리문 작성
			st = conn.createStatement();	// statement 객체 실행 준비
			rs = st.executeQuery(query);	// SQL문 실행 및 결과 담기
			
			while(rs.next()) {
				// 테이블 한칸에 한 묶음의 5가지 칼럼 데이터의 정보가 모두 들어가기 때문에
				// 아예 문자열 하나에 5가지 정보 모두 넣어서, arrayList에 하나씩 추가
				String r = "";
				r+=rs.getInt("hakbun");
				r+=",";
				r+=rs.getString("name");
				r+=",";
				r+=rs.getInt("age");
				r+=",";
				r+=rs.getInt("grade");
				r+=",";
				r+=rs.getString("major");
				result.add(r);
			}
		} catch(Exception e) {
			System.out.println("showAllStudent 메소드 에러");
		} 
		
		// DB 정보들을 result에 하나씩 담아놓기
		
		return result;
	}
}
