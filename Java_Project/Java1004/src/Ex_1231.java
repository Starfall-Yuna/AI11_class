import java.util.Scanner;

public class Ex_1231 {
	// getDaily 함수 :: 날짜 정보 통해, 연말까지 몇 일 남았는지 "반환"하는 함수
	public static int getDaily(int m, int d) {
		// "365 - (1/1부터 현재 날짜까지의 총 일수)" 반환
		// 1. 1/1 ~ 현재 날짜까지의 일수 측정
		int count=0;
		for(int i=1;i<m;i++) {	// 1월부터 m월 이전까지 루프
			if(i==2) {
				count+=28;
			}
			else if(i==4 || i==6 || i==9 || i==11) {
				count+=30;
			}
			else{
				count+=31;
			}
		}
		count+=d;
		
		return 365-count;
	}
	
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		// 문제 :: 오늘 날짜 입력받고, 연말까지 몇 일이 남았는지 출력하기
		// main에서 입출력 수행하기
		
		// 1. 오늘 날짜(월, 일) 입력받기
		System.out.print("오늘 날짜를 입력해주세요. ");
		int month=sc.nextInt();		// 월 정보
		int day=sc.nextInt();		// 일 정보
		
		// 2. 연말까지 남은 일수 측정 및 출력 -> getDaily 함수 호출
		System.out.println("연말까지 "+getDaily(month, day)+"일 남았습니다.");
	}
}




