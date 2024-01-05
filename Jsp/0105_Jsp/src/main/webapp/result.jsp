<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		input.html에서 제출 버튼 눌렀을때,
		전송받은 값들이, num1 num2 op
	-->
	<%
		// request 객체 :: 서버에 요청을 보낼 때 사용하는 객체
		// 여기 안에서는 자바 코드 삽입 가능
		String oper=request.getParameter("op");	// 연산자 파라미터 전달
		int n1=Integer.parseInt(request.getParameter("num1"));
		int n2=Integer.parseInt(request.getParameter("num2"));
		
		int result=0;
		switch(oper){
		case "+":
			result=n1+n2;
			break;
		case "-":
			result=n1-n2;
			break;
		case "*":
			result=n1*n2;
			break;
		case "/":
			result=n1/n2;
			break;
		case "%":
			result=n1%n2;
			break;
		}
	%>
	
	<h3>결과값: <%=result %></h3>
</body>
</html>




