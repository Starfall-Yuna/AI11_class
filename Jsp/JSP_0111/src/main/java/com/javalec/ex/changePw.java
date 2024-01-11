package com.javalec.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class changePw
 */
@WebServlet("/change")
public class changePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cPw=request.getParameter("change_pw");
		
		// employee 테이블의 특정 계정 비밀번호 변경
		employeeDAO dao=new employeeDAO();
		HttpSession session = request.getSession();
		// 세션에 있는 아이디 값을 불러오기
		String id=session.getAttribute("id").toString();
		
		// 비밀번호 변경 메소드 생성하고 적용하기
		dao.changePw(id, cPw);
		session.invalidate();	// 세션으로 저장된 값들을 무효화시킴 (로그아웃과 유사)
		response.sendRedirect("input_login.html");
	}

}




