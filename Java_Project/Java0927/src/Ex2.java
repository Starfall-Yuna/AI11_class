import java.util.Scanner;

public class Ex2 {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
//		숫자 n을 입력받고 1부터 n까지의 숫자 중 소수만 추려내어 출력하라.
//		(여기서 소수란, 특정 숫자에 대해 약수가 1과 자기 자신 밖에 없는 숫자를 의미한다.)
//		(ex1) 입력값 :: 9 	>> 2 3 5 7
//		(ex2) 입력값 :: 18	>> 2 3 5 7 11 13 17

		// 1. n 입력받기
		int n=sc.nextInt();
		
		// 1부터 n까지 숫자 탐색
		for(int i=2;i<=n;i++) {	// i는 1부터 n까지 순회
			// 소수 :: 숫자 a에 대해, 약수가 1과 자기 자신(a)만 있는 숫자
			// 		=> 2~(a-1) 범위에선 약수가 없어야한다.
			int count=0;
			for(int j=2;j<i;j++) {
				if(i%j==0) {	// j가 i의 약수일 때,
					// 요기로 들어오면, 소수가 아니게 된다.
					count++;
				}
			}
			
			// count의 값이 0을 유지하지 못한다면, 소수가 아니다.
			// count가 0을 유지하면, 소수라고 할 수 있음
			if(count==0) {
				// 여기 안에 들어오면 소수 -> 소수 출력
				System.out.println(i);
			}
		}
	}
}





