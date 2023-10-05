import java.util.Scanner;

public class Overloading {
	public static int sum() {	// 매개변수 없음
		return 1+1;
	}
	public static int sum(int a) {	// 매개변수 1개 있음
		return a+1;
	}
	public static int sum(int a, int b) {	// 매개변수 2개 있음
		return a+b;
	}
	
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		// 오버로딩 :: (함수에 적용되는 개념)
		// "매개변수 구성이 다르다면, 함수명을 같게 하여도 "함께 사용"할 수 있다."
		
		int num=sc.nextInt();
		System.out.println("sum() 결과: "+sum());
		System.out.println("sum(num) 결과: "+sum(num));
		System.out.println("sum(num, num) 결과: "+sum(num, num));
	}
}



