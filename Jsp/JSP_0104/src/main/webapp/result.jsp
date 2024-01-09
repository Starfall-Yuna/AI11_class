<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 여기에서 자바 코드 작성 가능
		// form.html(입력칸 있는 파일)에서 request(요청)을 보냈고
		// 응답을 여기에서 처리하고 있음
		
		// getParameter() ::
		// 		name 속성값으로 선택된 요소의 파라미터 당겨옴
		String name=request.getParameter("name");
	%>
	<h2>환영합니다 <%=name %>님</h2>
</body>
</html>


