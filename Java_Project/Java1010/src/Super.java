import java.util.Scanner;

class Computer{
	// 멤버 변수 :: name(기종), company(제조회사)
	private String name;
	private String company;
	
	// 생성자 선언부 :: "Computer 생성자 실행" 출력 + 멤버 변수 초기화
	public Computer(String n, String c) {
		System.out.println("Computer 생성자 실행");
		this.name=n;
		this.company=c;
	}
}

// 자식 클래스에서 객체 생성 시,
// 1. 부모 클래스의 생성자를 우선 실행한 뒤
// 2. 자식 클래스 생성자 실행
class NoteBook extends Computer{
	// 멤버 변수 :: name(기종), company(제조회사), weight(무게), angle(꺾이는 각도)
//	private String name;		-> 상속을 함으로써, 복사/붙여넣기된 멤버
//	private String company;
	private double weight;
	private int angle;
	
	// 생성자 선언부	-> 부모 클래스 필수로 불러와야함
	// super() :: 부모 클래스의 생성자 호출
	// "NoteBook 생성자 실행" 출력 + 멤버 변수 초기화
	// super()는 자식 클래스 생성자 정의 시, "반드시 첫번째 줄에 작성해야한다"
	public NoteBook(String n, String c, double w, int a) {
		super(n,c);		
			// 매개변수 n과 c의 정보를 전송하면서, 
			// Computer(String, String)이 수행되고 있음
		this.weight=w;
		this.angle=a;
		System.out.println("NoteBook 생성자 실행");
	}
	
	// this :: "이 객체"
	// super.[부모클래스 멤버명] :: "이 객체의 부모 클래스 멤버 접근"
}

public class Super {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		
		Computer c=new Computer(scan.next(), scan.next());
		NoteBook n=new NoteBook(scan.next(), scan.next(),
				scan.nextDouble(), scan.nextInt());
	}
}






