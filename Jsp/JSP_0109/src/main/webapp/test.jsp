<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalec.ex.studentDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" style="text-align:center">
	<tr>
		<th>학번, 이름, 나이, 학년, 전공
	</tr>
<%
	studentDAO st= new studentDAO();
	ArrayList<String> data= st.showAllStudent();
	for(String item: data){
%>
	<tr>
		<td><%=item %></td>
	</tr>
<%} %>
</table>
</body>
</html>