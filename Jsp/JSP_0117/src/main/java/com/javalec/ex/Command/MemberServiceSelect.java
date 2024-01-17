package com.javalec.ex.Command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.DAO.MemberDAO;
import com.javalec.ex.DTO.MemberDTO;

public class MemberServiceSelect implements MemberService{
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response){
		ArrayList<MemberDTO> result=new ArrayList<MemberDTO> ();
		
		MemberDAO dao=new MemberDAO();
		result=dao.MemberSelect();
		
		request.setAttribute("list", result);
		
		return result;
	}
}





