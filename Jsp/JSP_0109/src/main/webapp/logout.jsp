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
<!-- 서버에 있는 세션을 제거하면서 로그아웃 수행, html 파일로 돌아가기 -->
<%!
	Enumeration en;
	String key;
%>
<%
	Enumeration en=session.getAttributeNames();
	int size=0;
	while(en.hasMoreElements()){
		key=en.nextElement().toString();
		
		// key값을 통해서, 세션 삭세
		session.removeAttribute(key);
		size++;
	}
	System.out.println(size+"개의 세션이 제거되었습니다.");
	
	// 아이디 비밀번호 입력폼으로 돌아가기
	response.sendRedirect("login_session.html");
%>
</body>
</html>




