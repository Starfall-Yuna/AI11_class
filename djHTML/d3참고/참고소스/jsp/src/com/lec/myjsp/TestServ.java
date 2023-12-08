package com.lec.myjsp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServ
 */
@WebServlet({ "*.do", "*.Do" })
public class TestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		String viewPage= "printD3Chart.jsp";
		request.setCharacterEncoding("utf-8");
		
		Vo v1 = new Vo();
		v1.setName("a1");
		v1.setValue(11);
		Vo v2 = new Vo();
		v2.setName("b1");
		v2.setValue(22);
		Vo v3 = new Vo();
		v3.setName("c1");
		v3.setValue(33);
		Vo v4 = new Vo();
		v4.setName("d1");
		v4.setValue(44);
		
		ArrayList<Vo> vs = new ArrayList<Vo>();
		vs.add(v1);
		vs.add(v2);
		vs.add(v3);
		vs.add(v4);
		
		request.setAttribute("datas", vs);
		
		//spring이라면 map 객체에 실어서 보내든
		//하여튼... 책 목록 띄우는 코드 부분 참고해서...
		//db에서 데이터 읽어온 다음
		//그 list를 jsp로 보냄
		//ModelAndView mav = new ModelAndView();
		//mav.addObject("data",list);
		
		RequestDispatcher dispatcher =
				request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
