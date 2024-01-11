package com.javalec.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteUser
 */
@WebServlet("/delete")
public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// "어느 계정을 삭제할것인가" -> 지금 활용할 수 있는 건 세션에 있는 "id"값 뿐
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		
		// 세션에 있는 아이디 값은 받은 상태
		// "DB에 접속"해서, id 변수의 값을 아이디 값으로 갖는 "데이터 삭제"
		employeeDAO dao=new employeeDAO();
		dao.deleteUser(id);
		session.invalidate();
		response.sendRedirect("input_login.html");
	}
}






