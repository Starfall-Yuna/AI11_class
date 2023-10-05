import java.util.Scanner;

// Account 클래스 구현
class Account{
	// 멤버 변수 :: acc_num(회원번호), id, password
	private String acc_num;
	private String id;
	private String password;
	
	// 메소드 :: get/set 함수
	public String getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
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
	
	// Print() :: 3개 멤버 변수 값 출력
	public void Print() {
		System.out.println("회원 번호: "+this.acc_num);
		System.out.println("ID: "+this.id);
		System.out.println("PassWord: "+this.password);
	}
	
	// changePw(String) :: 매개변수 값으로 password값 변경
	// (다만, 매개변수 값이 5자리를 넘기지 않으면 에러메시지 출력)
	public void changePw(String pw) {
		if(pw.length()<5) {		// 에러메시지 출력
			System.out.println("지정하신 값으로 비밀번호를 설정할 수 없습니다.");
		}
		else {	// 비밀번호 변경 수행
			this.password=pw;
			System.out.println("비밀번호 변경이 완료되었습니다!!!");
		}
	}
	
	// 생성자 :: 메소드(멤버 함수) 중 일부
	// 생성자 :: 1. 회원번호, id, password - "0000", "ex", "0000"으로 초기화 
	// 생성자 오버로딩 적용되고 있다.
	public Account() {
		this.acc_num="0000";
		this.id="ex";
		this.password="0000";
	}
	// 생성자 :: 2. 3개의 멤버 변수, 매개변수 통해 초기화
	public Account(String a, String i, String p) {
		this.acc_num=a;
		this.id=i;
		this.password=p;
	}
}

public class Ex_Account {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		// 1. manager[3] 객체 배열 생성 (임의값으로 설정하는 생성자 실행)
		// 배열 할당 >> 객체 생성
		Account manager[]=new Account [3];
		for(int i=0;i<3;i++) {
			manager[i]=new Account();
		}
		
		// 2. manager[3] id, password 값 코드 상에서 임의로 수정
		manager[0].setId("test1");	manager[0].setPassword("123456");
		manager[1].setId("test2");	manager[1].setPassword("qwer1234");
		manager[2].setId("test3");	manager[2].setPassword("QWER!@#$");
		
		// 3. manager[3] 순차적으로 정보 출력
		for(int i=0;i<3;i++) {
			manager[i].Print();
			System.out.println();
		}
		
		// 4. user 객체 생성 (main에서 입력받아서 초기화)
		String num=scan.next();
		String id=scan.next();
		String pw=scan.next();
		Account user=new Account(num, id, pw);
		
		// 5. user 정보 순차적으로 출력
		user.Print();
		System.out.println();
		
		// 6. user 객체에 대해 chagePw(String) 수행
		System.out.print("수정할 비밀번호를 입력해주세요. ");
		user.changePw(scan.next());
		user.Print();
	}
}










