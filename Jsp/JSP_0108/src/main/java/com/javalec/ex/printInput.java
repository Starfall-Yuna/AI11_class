package com.javalec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class printInput
 */
@WebServlet("/print")
public class printInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public printInput() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String major=request.getParameter("major");
			// 사용자가 선택한 value값 처리
		String hobby[]=request.getParameterValues("hobby");		
			// 사용자가 선택한 복수의 value값들 처리
		String site=request.getParameter("site");
		
		response.setContentType("text/html; charset=UTF-8");	// 파일 형식 정의
		PrintWriter pw=response.getWriter();
		
		pw.println("<p>이름: "+name+"</p>");
		pw.println("<p>나이: "+age+"</p>");
		
		// 전공값 출력 :: 영문으로 전달받은 값을 한글로 전환하여 출력
		switch(major) {
		case "computer": // value값이 computer라면
			major="컴공과";	// major 값 "컴공과"로 변경
			break;
		case "math": // value값이 math라면
			major="수학과";
			break;
		case "teacher": // value값이 teacher라면
			major="교육과";
			break;
		}
		pw.println("<p>전공: "+major+"</p>");
		
		// 취미 출력 :: 영문으로 전달받은 값들을 한글로 전환하여 출력
		pw.println("<p>취미: ");
		if(hobby==null) {	// 사용자가 아무것도 선택하지 않았다면
			pw.println("취미 없음");
		}
		else {	// 사용자가 취미란에 어떤 것이라도 선택을 한 경우
			for(int i=0; i<hobby.length; i++) {
				switch(hobby[i]) {	// 0부터 시작하여, hobby 원소들 한글로 번형
				case "jogging":
					hobby[i]="조깅";	break;
				case "cook":
					hobby[i]="요리";	break;
				case "read":
					hobby[i]="독서";	break;
				case "game":
					hobby[i]="게임";	break;
				}
				
				pw.println(hobby[i]);
				if(i!=hobby.length-1) {	// 마지막 원소의 차례가 아니라면
					pw.println(",");
				}
			}
		}
		pw.println("</p>");
		
		// 사이트명 출력 :: 영문으로 전달받은 값을 한글로 전환하여 출력
		switch(site) {
		case "naver": // value값이 naver라면
			site="네이버";	// site 값 "네이버"로 변경
			break;
		case "daum": // value값이 daum라면
			site="다음";
			break;
		case "google": // value값이 google라면
			site="구글";
			break;
		}
		pw.println("<p>애용하는 사이트: "+site+"</p>");
		
		// \"로 println 수행하면 "로 전송됨
		pw.println("<form action=\"input.html\">");
		pw.println("<input type=\"submit\" value=\"다시 작성하기\"/>");
		pw.println("</form>");
	}

	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
