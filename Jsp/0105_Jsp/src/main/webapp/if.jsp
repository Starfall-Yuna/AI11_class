<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp 파일 3개 필요 :: kid.jsp, adult.jsp, if.jsp-->
<!-- 나이의 값에 따라, 어느 페이지로 이동할건지를 여기서 결정 -->
<%
	int age=Integer.parseInt(request.getParameter("age"));

	if(age<20){	// kid.jsp로 이동
		// sendRedirect() :: form의 action 역할 (response 객체)
		response.sendRedirect("kid.jsp");
	}
	else{	// adult.jsp로 이동
		response.sendRedirect("adult.jsp");
	}
%>
</body>
</html>





