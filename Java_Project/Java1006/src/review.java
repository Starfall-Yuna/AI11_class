
// 클래스 :: 객체/인스턴스를 찍어내는 틀
class Americano{
	// 멤버 변수 :: 물의 양, 원액 양, 얼음 유무
	private int water;
	private int coffee;
	private String ice;		// 얼음 유무
	
	// 생성자 :: "객체를 생성하는 메소드", 메소드 중 일부
	// 일반 메소드와의 차이점 :: 1. 반환형X
	//						2. 생성자명 = 클래스명
	public Americano() {
		// 3개의 멤버 변수 값 초기화
		// 객체를 생성했음을 알림
		this.water=500;
		this.coffee=250;
		this.ice="있음";
//		System.out.println("객체가 성공적으로 생성되었습니다!!!");
	}
//	생성자 :: 3개의 매개변수 값으로 멤버 초기화
	public Americano(int w, int c, String i) {
		this.water=w;
		this.coffee=c;
		this.ice=i;
	}
	
	// 1. GoodAme() -> 비율이 맞는지를 출력
	public void GoodAme() {
		// 물:커피=2:1	=> 황금비율 출력
		// 2커피 = 1물
		if(this.coffee*2 == this.water) {
			System.out.println("황금비율의 아메리카노입니다!!!");
		}
		else if(this.coffee*2 > this.water) {
			System.out.println("진한 아메리카노입니다...");
		}
		else {
			System.out.println("연한 아메리카노입니다ㅠㅜ");
		}
	}
	// 2. Amount() :: 아메리카노 양이 적절한지에 대해 출력
	public void Amount() {
		int ame=this.water+this.coffee;
		if(ame==750) {
			System.out.println("양이 딱 적당합니다!!!");
		}
		else if(ame>750) {
			System.out.println("양이 좀 많습니다ㄷㄷ");
		}
		else {
			System.out.println("양이 좀 적습니다ㅠㅠ");
		}
	}
}

public class review {
	public static void main(String[] args) {
		// 객체 배열
		// 1. 배열로 공간 할당 -> 2. 객체 생성
		Americano ame[]=new Americano [2];
//		for(int i=0;i<2;i++) {
//			// [객체명] = new [생성자 호출];
//			ame[i]=new Americano();
//		}
		
		ame[0]=new Americano();		// 비율이 딱 맞고 양이 적당
		ame[1]=new Americano(1000, 10, "있음");	// 연하고 양이 많음
		
		for(int i=0;i<2;i++) {
			ame[i].Amount();
			ame[i].GoodAme();
			System.out.println();
		}
	}
}




