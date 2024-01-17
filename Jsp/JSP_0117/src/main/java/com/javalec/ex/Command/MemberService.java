package com.javalec.ex.Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import com.javalec.ex.DTO.MemberDTO;

public interface MemberService {
	// 인터페이스 :: 필드는 모두 상수, "메소드는 모두 추상메소드"
	
	// Execute 추상 메소드 만들기
	// Insert, Delete, "Select", login-test 기능
	public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response);
}
