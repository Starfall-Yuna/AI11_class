import java.util.Scanner;

public class Ex_Clock {
//	getHour(int s) :: 초 정보를 받고, 시 정보를 반환
	public static int getHour(int s) {
		// 1시간 = 3600초, 2시간 = 7200초, ...
		return s/3600;
	}
	
//	getMin(int s) :: 초 정보를 받고, 분 정보를 반환
	public static int getMin(int s) {
		// 이때, 분 정보가 60을 넘어서면 안 된다.
		// 1시간 = 60분 = 3600초
		return (s%3600)/60;
	}
	
//	getSec(int s) :: 분으로 환산 불가능한 초 정보 반환
	public static int getSec(int s) {
		return s%60;
	}
	
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
//		입력값으로 주어지는 Sec(초) 정보를, h시 m분 s초로 출력하게끔 코드를 작성하여라.
		
		// 1. sec 정보 입력받기
		int sec=sc.nextInt();
		
		// 2. sec 정보 -> h시 m분 s초로 출력
		// 단, 86400초 이상의 값에 대해선 오류 메시지 출력
		if(sec>=86400) {
			System.out.println("Error!!!");
		}
		else {
			int h=getHour(sec);
			int m=getMin(sec);
			int s=getSec(sec);
			System.out.println(h+"시 "+m+"분 "+s+"초");
		}
	}
}



