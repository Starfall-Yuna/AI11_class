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
<%
	// 서버에 저장되어있는 세션을 불러와서, 사용자 이름을 브라우저 출력
	Enumeration e = session.getAttributeNames();
	while(e.hasMoreElements()){
		String key = e.nextElement().toString();	// 세션의 키값(인덱스값)
		String value = session.getAttribute(key).toString();
		// value에 사용자 이름이 담겨져있는 상태
		
		out.println(value+"님!");
	}
%>
<p>환영합니다~~~</p>
<br>
<a href="changePw.html">비밀번호 변경</a>
<a href="delete">회원탈퇴</a>
</body>
</html>







