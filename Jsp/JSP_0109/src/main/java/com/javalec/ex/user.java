// 자바 빈 :: 클래스
package com.javalec.ex;

public class user {
	// 멤버 변수 선언부
	private String nickname;
	private String name;
	private String id;
	private String password;
	
	// 생성자 선언부
	public user() {
		this.nickname="no nickname";
		this.name="no name";
		this.id="no id";
		this.password="no password";
	}
	public user(String nick, String n, String i, String p) {
		this.nickname=nick;
		this.name=n;
		this.id=i;
		this.password=p;
	}
	
	// get, set 함수
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
