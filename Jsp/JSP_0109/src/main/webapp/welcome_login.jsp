<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>환영합니다!!!</h3>
<%!	
	String key, value;
	Enumeration en;
%>
<%
	// Enumeration :: 연결 리스트에 가깝
	// array[0], array[1], ...
	// en["name"], en["age"], ...
	
	// Enumeration 통해서, 세션에 저장되어있는 값들 불러오기
	en = session.getAttributeNames();
	
	// en을 하나하나 탐색 -> 다음 요소가 있다면 계속 실행
	// en의 마지막 요소에 도달하면 실행 종료
	int size=0;
	while(en.hasMoreElements()){
		// key, value값을 각각 구하는 방법
		
		// key값 구하기 :: en의 다음 요소 키 값을 String으로 변환하여 저장
		key=en.nextElement().toString();
		value=session.getAttribute(key).toString();
		if(value.equals("admin")){
			// 브라우저 출력을 위한 출력 스트림
			out.println(value+"님!");
		}
		size++;
	}
	
	// 시스템 콘솔 상 출력을 위한 출력문
	// 위에 있는 out.pritln()과는 완전히 다른 메소드
	System.out.println("서버에 저장된 세션 개수:: "+size);
%>
<br>
<br>
<a href="logout.jsp">로그아웃</a>
</body>
</html>




