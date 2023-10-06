// 오버로딩 :: "매개변수 구성이 다르면, 함수명이 같아도 함께 사용할 수 있다."
// 오버라이딩 :: "부모 클래스에 정의되어있는 메소드를 자식 클래스에서 재정의/덮어쓰기"

// Clock 클래스
class Clock{
	// 멤버 변수 :: hour, minute, second
	private int hour;
	private int minute;
	private int second;
	
	// get, set 함수
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMinute() {
		return minute;
	}
	public void setMinute(int minute) {
		this.minute = minute;
	}
	public int getSecond() {
		return second;
	}
	public void setSecond(int second) {
		this.second = second;
	}

	// 멤버 함수 :: Setting(int, int, int) -> 시간 설정
	public void Setting(int h, int m, int s) {
		this.hour=h;
		this.minute=m;
		this.second=s;
	}
	
	// Clock 객체 멤버 값들 출력하는 함수
	public void Print() {
		System.out.println("현재 시각은 "+this.hour+"시 "+this.minute+"분 "+this.second+"초입니다.");
	}
}

// Watch 클래스
class Watch extends Clock{	// hour, minute, second 멤버 상속
	// "Clock 클래스는 부모 클래스, Watch 클래스는 자식 클래스"
	// 멤버 변수 :: hour, minute, second, StrapColor
	private String StrapColor;
	
	// get, set 함수
	public String getStrapColor() {
		return StrapColor;
	}
	public void setStrapColor(String strapColor) {
		StrapColor = strapColor;
	}
	
	// 멤버 함수 :: Setting(int, int, int) -> 시간 설정, StrapColor="Black"
	public void Setting(int h, int m, int s) {
		// 부모인 Clock 클래스의 Setting(int, int, int)에 대해 오버라이딩 수행
		// "부모 멤버의 내용 무시하고, 자기 자신(자식)이 정의한 내용을 우선시함"
		this.setHour(h);
		this.setMinute(m);
		this.setSecond(s);
		this.StrapColor="Black";
	}
	// Setting(int, int, int, String) :: 시간 및 시계줄 색상 설정
	public void Setting(int h, int m, int s, String st) {
//		this.setHour(h);
//		this.setMinute(m);
//		this.setSecond(s);
		this.Setting(h, m, s);		// 자기 자신이 갖고 있는 함수 호출
		this.StrapColor=st;
	}
	
	// Watch 객체 멤버 값들 출력하는 함수
	// 이 또한 오버라이딩 일어나고 있음
	public void Print() {
		System.out.println("현재 시각은 "+this.getHour()+"시 "+this.getMinute()+"분 "+this.getSecond()+"초입니다.");
		System.out.println("시계줄 색상: "+this.StrapColor);
	}
}

// SmartWatch 클래스
class SmartWatch extends Watch{
	// "Watch 클래스는 부모 클래스, SmartWatch 클래스는 자식 클래스"
	// 멤버 변수 :: hour, minute, second, StrapColor, os
	private String os;
	
	// 멤버 함수 :: Setting(int, int, int) -> 시간 설정, StrapColor="Black", os="null"
	public void Setting(int h, int m, int s) {
		// 부모인 Watch 클래스의 Setting(int, int, int) 함수에 대해 오버라이딩 적용
		this.setHour(h);
		this.setMinute(m);
		this.setSecond(s);
		this.setStrapColor("Black");
		this.os="null";
	}
	// Setting(int, int, int, String) :: 시간 및 시계줄 색상 설정, os="null"
	public void Setting(int h, int m, int s, String st) {
		// 부모인 Watch 클래스의 Setting(int, int, int, String) 함수에 대해 오버라이딩 적용 
//		this.setHour(h);
//		this.setMinute(m);
//		this.setSecond(s);
//		this.setStrapColor(st);
//		this.os="null";
		this.Setting(h, m, s);		// 자기 자신이 갖고 있는 함수 호출
		this.setStrapColor(st);
	}
	// Setting(int, int, int, String, String) :: 시간 및 시계줄 색상, os 설정
	public void Setting(int h, int m, int s, String st, String o) {
//		this.setHour(h);
//		this.setMinute(m);
//		this.setSecond(s);
//		this.setStrapColor(st);
//		this.os=o;
		this.Setting(h, m, s, st);		// 자기 자신이 갖고 있는 함수 호출
		this.os=o;
	}
	
	// SmartWatch 객체 멤버 값들 출력하는 함수
	// 이 또한 오버라이딩 일어나고 있음
	public void Print() {
		System.out.println("현재 시각은 "+this.getHour()+"시 "+this.getMinute()+"분 "+this.getSecond()+"초입니다.");
		System.out.println("시계줄 색상: "+this.getStrapColor());
		System.out.println("운영체제 버전: "+this.os);
	}
}

public class Overriding {
	public static void main(String[] args) {
		// 객체 생성
		Clock c= new Clock();
		Watch w=new Watch();
		SmartWatch sw=new SmartWatch();
		
		// 아래부터는 Setting 함수 실행에 대한 테스트 출력문입니다.
		// 필요한 구문 이외에는 주석 처리하고, 콘솔 창으로 결과를 확인하시면 되겠습니다.
		
		// 1. Clock c - Setting(int, int, int) 수행 결과
		System.out.println("1. Clock c - Setting(15,25,30) 수행 결과");
		c.Setting(15,25,30);
		c.Print();
		System.out.println();
		
		// 2. Watch w - Setting(int, int, int) 수행 결과
		System.out.println("2. Watch w - Setting(16,40,20) 수행 결과");
		w.Setting(16,40,20);
		w.Print();
		System.out.println();
		
		// 3. Watch w - Setting(int, int, int, String) 수행 결과
		System.out.println("3. Watch w - Setting(18,0,0,\"Orange\") 수행 결과");
		w.Setting(18,0,0,"Orange");
		w.Print();
		System.out.println();
		
		// 4. SmartWatch sw - Setting(int, int, int) 수행 결과
		System.out.println("4. SmartWatch sw - Setting(9,20,45) 수행 결과");
		sw.Setting(9,20,45);
		sw.Print();
		System.out.println();
		
		// 5. SmartWatch sw - Setting(int, int, int, String) 수행 결과
		System.out.println("5. SmartWatch sw - Setting(10,30,33,\"Navy\") 수행 결과");
		sw.Setting(10,30,33,"Navy");
		sw.Print();
		System.out.println();
		
		// 6. SmartWatch sw - Setting(int, int, int, String, String) 수행 결과
		System.out.println("6. SmartWatch sw - Setting(14,2,5,\"Red\", \"Android Nuga\") 수행 결과");
		sw.Setting(14,2,5,"Red","Android Nuga");
		sw.Print();
	}
}
