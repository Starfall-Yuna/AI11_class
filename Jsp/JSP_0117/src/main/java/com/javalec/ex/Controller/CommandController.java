package com.javalec.ex.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.Command.MemberService;
import com.javalec.ex.Command.MemberServiceDelete;
import com.javalec.ex.Command.MemberServiceInsert;
import com.javalec.ex.Command.MemberServiceLogin;

/**
 * Servlet implementation class CommandController
 */
@WebServlet("*.do")
public class CommandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
			// 사용자가 불러온 링크를 반환		(ex) /JSP_0117/insert.do
		String conPath=request.getContextPath();	// 프로젝트명 반환
		String command=uri.substring(conPath.length());
			// insert.do, delete.do ... 형식으로 command에 저장
		
		// View(jsp), Controller(프론트컨트롤러, 커멘드)
		MemberService mService=null;		// 객체 생성X, 타입 구성만 한 것
		
		if(command.equals("/insert.do")) {	
			// "회원 추가" 수행을 요청할 시
			System.out.println("<회원 추가>를 수행합니다.");
			mService = new MemberServiceInsert();
		}
		else if(command.equals("/delete.do")){
			System.out.println("<회원 제거>를 수행합니다.");
			mService = new MemberServiceDelete();
		}
		else if(command.equals("/login.do")){
			System.out.println("<로그인 테스트>를 수행합니다.");
			mService = new MemberServiceLogin();
		}
		
		mService.execute(request, response);
		
		response.sendRedirect("admin_page.html");
	}
}






