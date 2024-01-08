<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.ex.Student" %>

<!-- 액션 태그 -->
<!-- usebean :: 특정 자바빈의 내용을 가져옴 -->
<jsp:useBean id="student1"
	class="com.javalec.ex.Student" scope="page"/>
<jsp:useBean id="student2"
	class="com.javalec.ex.Student" scope="page"/>

<!-- setProperty :: 특정 필드의 값을 설정 -->
<jsp:setProperty name="student1" property="name" value="백정윤" />
<jsp:setProperty name="student1" property="age" value="26" />
<jsp:setProperty name="student1" property="number" value="101" />
<jsp:setProperty name="student1" property="gender" value="남성" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- getProperty :: 특정 필드의 값을 반환-->
	student1 이름 :: <jsp:getProperty name="student1" property="name" />		<br>
	student1 나이 :: <jsp:getProperty name="student1" property="age" />세
	<%
		// page 지시어로, 자바빈 파일을 import해야 사용 가능
		Student s1=new Student("이유나", 26, "100", "여성");
		Student s2=new Student();
		s2.setName("이종권");
		s2.setAge(28);
		s2.setNumber("5");
		s2.setGender("남성");
	%>
</body>
</html>










