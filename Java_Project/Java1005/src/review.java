
// 예제 :: 휴대폰 클래스 생성
// 클래스 구현
// class 클래스명 {
//	 멤버 선언 :: 멤버 변수(필드), 멤버 함수(메소드), 생성자
// }
class Phone{
	// 멤버 변수 선언
	private String os;	// 운영체제
	private int year;	// 출시년도
	private String color;	// 색상
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	// 메소드 선언 (메소드 오버로딩)
	// 오버로딩 :: "매개변수 구성이 다르다면, 함수명이 같아도 함께 사용할 수 있다."
//	[접근제어자] [반환형] [함수명](매개변수구성){
//		명령문	
//	}
	public void Print() {
		System.out.println("운영체제 :: "+this.os);
		System.out.println("출시년도 :: "+this.year+"년");
		System.out.println("색상 :: "+this.color);
	}
	public void Print(String o, int y, String c) {
		// 멤버들의 정보를 갱신
		this.os=o;		// "이 객체의 os 값을 o 값으로 저장한다."
		this.year=y;
		this.color=c;
		
		// 즉시 출력
		this.Print();	// Print(o,y,c)와 Print()는 독립된 함수
	}
}

public class review {
	public static void main(String[] args) {
		// 객체 :: "클래스를 통해 만들어진 실체"
		// 인스턴스 :: "클래스를 통해서 만들어진 것"
		//		"객체가 인스턴스들을 포함하는 개념"
		// 클래스 :: "객체를 찍어내는 틀"
		
		// 객체 생성
		// [클래스명] [인스턴스명] = new [클래스명]();
		Phone p=new Phone();	// p 객체 생성
		
		// 멤버 접근
		// [인스턴스명].[멤버명]
		p.setOs("Android Icecream Sandwich");
		p.setYear(2000);
		p.setColor("Black");
		
//		System.out.println("운영체제 :: "+p.getOs());
//		System.out.println("출시년도 :: "+p.getYear()+"년");
//		System.out.println("색상 :: "+p.getColor());
		p.Print();
		System.out.println();
		p.Print("Android Nuga", 1990, "Red");
	}
}



