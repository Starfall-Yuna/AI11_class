<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
	<c:forEach items="${list}" var="value">
		<%-- DTO의 멤버이름으로 값을 불러와야함 --%>
		<tr>
			<td>${value.id}</td>
			<td>${value.pw}</td>
			<td>${value.name}</td>
		</tr>
	</c:forEach>
</table>

<a href="admin_page.html">뒤로가기</a>
</body>
</html>




