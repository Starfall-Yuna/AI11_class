<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%		
	// 톰캣 서버의 해당 프로젝트 파일 안에서 myupload 폴더 찾는 경로
	String path=application.getRealPath("myupload");
System.out.println(path);
	int size=1024*1024*10;	// 10MB
	
	try{
		// 파일 업로드를 위한 MultipartRequest 객체 생성 ::
			//업로드할 파일, 업로드할 경로, 최대 사이즈, 인코딩 방식, 파일 이름 충돌 방지 정책
		MultipartRequest multi=
			new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		// 사용자가 입력한 파일 받기
		Enumeration files=multi.getFileNames();
		String name=files.nextElement().toString();	// 1개의 파일명 저장
		
		// 파일 이름 충돌이 발생할 시를 대비하여, 2개의 메소드 모두 사용
		// 이름 충돌이 발생하지 않으면, file값 = ori값
		String file=multi.getFilesystemName(name);	// (ex) "새 폴더 (2)" 저장
		String ori=multi.getOriginalFileName(name);	// (ex) "새 폴더" 저장
	
		out.println("업로드를 성공하였습니다.");
	} catch (Exception e){
		System.out.println("파일 업로드 에러");
		e.printStackTrace();	// 실질적인 에러 이름 출력
	}
%>
</body>
</html>



