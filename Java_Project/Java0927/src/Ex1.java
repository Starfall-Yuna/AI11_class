import java.util.Scanner;

public class Ex1 {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		
//		숫자 n을 입력받고
//		1부터 n까지의 숫자 중 "짝수"만 추려내어 출력하고
//		짝수들끼리의 합을 마지막에 출력하도록 하여라.
		
		// 1. n 입력받기
		int n=scan.nextInt();
		
		// 2. 1부터 n까지의 숫자 순회 -> 짝수 추려내기
		int sum=0;
		for(int i=1;i<=n;i++) {		// i는 1~n까지 순회
			if(i%2==0) {	// 2로 나누었을 때 나누어 떨어지면, -> 짝수
				System.out.println(i);
				sum+=i;
			}
		}
		
		System.out.println("짝수들의 합: "+sum);
	}
}
