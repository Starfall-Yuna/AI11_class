package com.javalex.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/Hello")
// 이 서블릿에 접근하기 위해서는, com.javalex.ex/HelloServlet.java 경로대로 들어와야함
// 경로를 간결하기 하기 위해서, url 주소 일부(뒷부분)를 치환
// url 매핑 하는 게 좋음
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 여기에선, 브라우저 상에서 나타나게끔 설정 -> append()
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name=request.getParameter("name");
		response.getWriter().append("<h3>"+name+"님 환영합니다.</h3>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		
		System.out.println(name+"님 환영합니다!!!");
		// POST가 GET 보다 보안에 강화되어있다.
	}

}



