package com.javalec.ex;

import java.sql.*;
import java.util.*;

public class studentDAO {
	// DB 서버 url, 아이디, 비밀번호 선언
	private String url="jdbc:mysql://localhost:3306/apidb";
	private String id="root";
	private String passwd="1234";
	
	// DB랑 연결하기 위해 필요한 객체 선언
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	public studentDAO() {
		try {
			// jdbc 드라이버 로드 (lib 폴더 안의 jar 파일 불러옴)
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("드라이버 로드 실패");
		}
	}
	
	public ArrayList<String> showAllStudent() {
		// 메소드 반환값으로 할 연결리스트 선언
		ArrayList<String> result=new ArrayList<String> ();
		
		// DB랑 접속
		try {
			conn=DriverManager.getConnection(url, id, passwd);
			st = conn.createStatement();
			String query="SELECT * FROM student";	// 실행할 쿼리문 작성
			rs = st.executeQuery(query);
			while(rs.next()) {
				String r = "";
				r+=Integer.toString(rs.getInt("hakbun"));
				r+=",";
				r+=rs.getString("name");
				r+=",";
				r+=Integer.toString(rs.getInt("age"));
				r+=",";
				r+=Integer.toString(rs.getInt("grade"));
				r+=",";
				r+=rs.getString("major");
				result.add(r);
			}
		} catch(Exception e) {
			System.out.println("DB 접속 실패");
		} 
		
		// DB 정보들을 result에 하나씩 담아놓기
		
		return result;
	}
}








