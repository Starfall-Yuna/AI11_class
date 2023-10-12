
// 추상클래스 발전 -> 인터페이스 개념
// 원칙적으로 자바에선 다중 상속 (여러 클래스를 상속) 지원
// 	=> 인터페이스를 통해서는 다중 상속을 지원
//	=> 추상 클래스보다는 제약사항이 좀 있음

// class가 아닌 interface 키워드 통해서 선언
// interface 클래스명{
//	 멤버 선언 ...
// }

// 인터페이스 통해서 객체 생성X
// 인터페이스를 상속받아서, 다른 클래스에서 재정의/구체화를 진행
interface ani{
	// 필드 :: "상수"의 형태로 선언 (변수 선언X)
	//		상수 -> 선언과 동시에 반드시 초기화, 값 변경X
	// 멤버 함수(메소드) :: 추상 메소드로만 구성
	// "모든 멤버들의 접근제어자가 반드시 public이어야 한다."
	
	// public static final [타입명] [상수명] = [상수값];
	// public static final String species;	-> 에러O, 변수 선언X
	
	// abstract 키워드 생략
	// => 기본적으로 추상메소드로 취급, 정의부 작성X
	public void Print();
	abstract public void cry();
}

// implements :: 인터페이스 상속받을 때 사용하는 키워드
class Puppy implements ani{
	// 인터페이스 animal에 있는, Print() 및 cry() 필수로 구현
	
	public void Print() {
		System.out.println("강아지입니다.");
	}
	public void cry() {
		System.out.println("월월유ㅝㄹㄹ");
	}
}

public class Interface {
	public static void main(String[] args) {
		// "인터페이스 통해서는 객체 생성X"
		// ani a=new ani();		-> 에러O, 인터페이스로 객체 생성 시도
	
		Puppy p = new Puppy();
		p.Print();
		p.cry();
	}
}









