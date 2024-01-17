package com.javalec.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.MemberDAO;
import com.javalec.ex.DTO.MemberDTO;

public class MemberServiceLogin implements MemberService{
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		ArrayList<MemberDTO> dto=null;
		
		// DAO에 있는 insert 메소드만 수행
		MemberDAO dao=new MemberDAO();
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		boolean tf=dao.MemberLogin(id, pw);
		
		System.out.print("로그인 테스트 결과: ");
		if(tf==true) {
			System.out.println("성공하였습니다.");
		}
		else {
			System.out.println("실패하였습니다.");
		}
		
		return dto;
	}
}
