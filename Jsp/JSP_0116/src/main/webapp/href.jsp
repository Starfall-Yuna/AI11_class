<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="insert.do">insert</a>
<a href="delete.do">delete</a>
<a href="update.do">update</a>
<br>

<a href="http://localhost:8181<%=request.getContextPath()%>/test.do">test.do</a>
<a href="<%=request.getContextPath()%>/test2.do">test2.do</a>
<a href="http://localhost:8181/<%=request.getContextPath()%>/frontController/abc.do">abc.do</a>
</body>
</html>



