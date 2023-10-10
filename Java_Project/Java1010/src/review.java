
// 상속 :: "부모가 자식에게 물려준다."
// 	=> 상속을 통해, 부모 클래스의 멤버를 자식 클래스에 복사/붙여넣기

class Coffee{
	// 멤버 변수 :: name, ml
	private String name;	// 커피 이름
	private int ml;			// 커피 정량
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMl() {
		return ml;
	}
	public void setMl(int ml) {
		this.ml = ml;
	}
	
	// Coffee 클래스에 대한 Print() 함수
	public void Print() {
		System.out.println("Coffee 클래스에 대한 Print() 수행");
		System.out.println("커피 이름: "+this.name);
		System.out.println("커피 정량: "+this.ml+"ml");
	}
	
//	생성자를 따로 정의하지 않아서, 아래의 기본 생성자 생략되어있음
//	public Coffee() {
//		
//	}
}

class Latte extends Coffee{
	// 멤버 변수 :: name, ml, milk
	// private String name;		-> 상속을 하면서 생략된 구문
	// private int ml;
	private int milk;	// 우유 투입량
	public int getMilk() {
		return milk;
	}
	public void setMilk(int milk) {
		this.milk = milk;
	}
//	상속을 통해, 아래 메소드가 복사/붙여넣기 됌
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public int getMl() {
//		return ml;
//	}
//	public void setMl(int ml) {
//		this.ml = ml;
//	}
	
	// 오버라이딩 :: 부모 클래스에 있는 함수 내용을, 자식 클래스에서 재정의(덮어쓰기)
	// Latte 객체의 Print() 호출 시, Coffee 클래스의 Print() 내용 수행X
	//			자기 자신의 클래스에서 재정의한 내용 수행
	public void Print() {
		System.out.println("Latte 클래스에 대한 Print() 수행");
		System.out.println("커피 이름: "+this.getName());
		System.out.println("커피 정량: "+this.getMl()+"ml");
		System.out.println("우유 투입량: "+this.milk+"ml");
	}
	
//	생성자를 따로 정의하지 않아서, 아래의 기본 생성자 생략되어있음
//	public Latte() {
//		
//	}
}

public class review {
	public static void main(String[] args) {
		Coffee c=new Coffee();
		Latte l=new Latte();
		
		// c 객체에 대해서 멤버 변수값 설정 -> set 함수 수행
		c.setName("아메리카노");
		c.setMl(500);
		// l 객체에 대해서 멤버 변수값 설정
		l.setName("카페라떼");
		l.setMl(500);
		l.setMilk(250);
		
		c.Print();
		System.out.println();
		l.Print();
	}
}



