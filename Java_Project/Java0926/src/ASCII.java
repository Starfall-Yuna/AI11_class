import java.util.Scanner;

public class ASCII {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		// 아스키코드 :: 컴퓨터가 문자 정보를 이해할 수 있게끔
		// 		특정 숫자와 일대일 대응시켜 표현하기로 약속한 표
		char c=scan.next().charAt(0);
		System.out.println((int)c);
		
		// 콘솔 상에서 영문자 또는 숫자를 입력받게끔 하고
		// 그 입력값에 대한 아스키코드 값 출력하면서 종료하기
	}
}
