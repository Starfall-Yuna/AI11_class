import java.util.Scanner;

public class Ex_introduce {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		// 아래의 입력을 받고 출력을 수행하여라.
		// 이름, 나이, 혈액형(char형), 키(double형), 자기소개
		
		String name=scan.next();  		// 이름 입력받기
		int age=scan.nextInt();  		// 나이 입력받기
		char blood=scan.next().charAt(0);   		// 혈액형 입력받기
		double height=scan.nextDouble();			// 키 입력받기
		scan.nextLine();	// 입력 간 충돌을 위해, 엔터값 먹어주는 입력값 작성
		String intro=scan.nextLine();

		System.out.println("이름: "+name); 				// 이름 출력 
		System.out.println("나이: "+age+"세"); 			// 나이 출력
		System.out.println("혈액형: "+blood+"형");     	// 혈액형 출력
		System.out.println("키: "+height+"cm");		  	// 키 출력
		System.out.println("자기소개: "+intro);			// 자기소개 출력 
	}
}
