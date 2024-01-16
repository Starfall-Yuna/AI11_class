<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 정보 출력</h3>
<p>
	이름: ${param.name }	<br>
	나이: ${param.age }		<br>
</p>

<jsp:useBean id="user1" class="com.javalec.ex.UserDTO" scope="page" />
<jsp:setProperty name="user1" property="name" value="${param.name }" />
<jsp:setProperty name="user1" property="age" value="${param.age }" />
<!-- EL 태그를 활용하면, 자동으로 형변환 -->

<h3>DTO 활용해서 출력</h3>
<p>
	이름: <jsp:getProperty name="user1" property="name" />	<br>
	나이: <jsp:getProperty name="user1" property="age" />		<br>
</p>
</body>
</html>









