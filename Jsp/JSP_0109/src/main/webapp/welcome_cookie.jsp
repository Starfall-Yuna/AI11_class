<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>안녕하세요!</h3>
<%
	// 응답으로 전달받은 쿠키 객체를, 쿠키 타입의 배열에 저장
	Cookie[] cookies=request.getCookies();
	for(int i=0; i<cookies.length; i++){
		// 쿠키 객체에서 value만 빼와서 저장
		String value=cookies[i].getValue();
		if(value.equals("admin")){
			out.println(value+"님!");
		}
	}
	
	System.out.println("존재하는 쿠키 객체 개수:: "+cookies.length);
%>
</body>
</html>


