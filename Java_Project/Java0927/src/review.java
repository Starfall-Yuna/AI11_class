import java.util.Scanner;

public class review {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
			// scan을 통해서, 입력문 함수 불러올 수 있음
		
		// 출력문 :: 3가지(println, printf, print)
		System.out.println("연휴 전날입니다아ㅏㅏ");
			// "연휴 전날입니다" + "\n"
		System.out.printf("이번 해 추석은 %d월 %d일입니다.\n", 9, 29);
		System.out.print("즐거운 연휴 되세요!!");
			// "즐거운 연휴 되세요!!!"만 출력
		
		// 입력문 :: Scanner 사용
		int i=scan.nextInt();
		double d=scan.nextDouble();
		String s1=scan.next();		// " "을 만나면 실행 종료
		String s2=scan.nextLine();	// "\n(Enter)"을 만나면 실행 종료
		char c=scan.next().charAt(0);
			// scan.next()로 입력받은 것 중, 0번째 문자만 뽑아와서 c에 저장한다.
		
		// 아스키코드 :: 컴퓨터가 문자 정보를 이해할 수 있도록
		//		특정 숫자-문자를 일대일대응 시킨 약속
		// A :: 65, a :: 97, '0' :: 48
		
		// String 관련한 함수 
		// equals() :: 2개의 문자열을 비교하는 함수
		//		(같으면 참 반환, 다르면 거짓 반환)
		// length() :: 문자열 길이 반환
		//		"coffee" => length() 값 :: 6, 인덱스 :: 0~5번
		// charAt(i) :: String형에 대해서, 특정 위치의 문자 접근할 때 사용
		//		"coffee" => "coffee".charAt(1);
		// toCharArray() :: String형 -> char[]형 변환하는 함수
		//		String str="SmartPhone";
		//		char ch[] = str.toCharArray();
		
		// 배열 :: 동일한 타입에 대해 여러 공간을 갖는 변수
		// 배열 선언하는 방법
		// 1. 초기화하면서 선언
		// (자료형) (배열명)[] = {초기화해줄 값};
		int number[]= {11,22,33,44,55};	// 자동으로 크기가 5로 지정
		String st[]= {"Hello", "Java"};	// 크기가 2로 지정
		double dnum[][]= {{11.1, 12,2}, {21.1,22.2,32.2}};
		
		// 2. 크기만 할당하여 선언
		// (자료형) (배열명)[] = new (자료형) [배열크기];
		int n[]=new int [5];
		double dn[][]=new double [2][3];	// 2*3=6개의 원소 최대한 넣을 수 있음
	
		
	}
}





