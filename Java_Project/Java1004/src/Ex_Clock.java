import java.util.Scanner;

// Clock 클래스 구현
class Clock{
	// 멤버 변수 :: hour=0, minute=0, second=0 	(private으로 선언)
	// 이렇게 설정하면, Clock에 대한 객체 생성함과 동시에
	// 3개의 멤버 변수들이 모두 0으로 초기화한다.
	private int hour=0;
	private int min=0;
	private int sec=0;
	
	// getter, setter 함수
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getSec() {
		return sec;
	}
	public void setSec(int sec) {
		this.sec = sec;
	}
	
	// 멤버 함수 선언
	// PrintTime() :: 현재 시간 출력
	public void printTime() {
		// 00:00:00 출력할 것이라면, printf()로 작성 권장
		System.out.println("현재 시각은 "+this.hour+"시 "+this.min+"분 "+this.sec+"초입니다.");
	}
	// AmPm() :: 현재 오전인지 오후인지 출력
//	public void AmPm() {
//		// 오전 :: 0시~11시
//		// 오후 :: 12시~23시
//		if(this.hour>=0&&this.hour<12) {
//			System.out.println("현재는 오전입니다.");
//		}
//		else {
//			System.out.println("현재는 오후입니다.");
//		}
//	}
	public String AmPm() {
		if(this.hour>=0&&this.hour<12) {	// 오전인 경우
			return "오전";
		}
		else {	// 오후인 경우
			return "오후";
		}
	}
}

public class Ex_Clock {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		// Clock 클래스를 통해 c1, c2 객체 각각 생성
		Clock c1=new Clock();
		Clock c2=new Clock();
		
		// 3개의 입력을 받아 c2 객체 필드 초기화
		System.out.print("현재 시각을 입력하세요.(hour, minute, second) ");
		c2.setHour(scan.nextInt());		// int형 입력 -> 함수 실행
		c2.setMin(scan.nextInt());
		c2.setSec(scan.nextInt());
		
		// c1, c2 객체에 대한, PrintTime() 및 AmPm() 실행
		c1.printTime();
		System.out.println("현재는 "+c1.AmPm()+"입니다.");	// "오전" 또는 "오후" 반환
		c2.printTime();
		System.out.println("현재는 "+c2.AmPm()+"입니다.");
	}
}



