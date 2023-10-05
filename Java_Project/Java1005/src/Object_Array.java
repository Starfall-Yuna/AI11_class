import java.util.Scanner;

class Student{
	private String name;
	private String num;
	private int age;
	
	public void Print(String n, String num, int a) {
		this.name=n;
		this.num=num;
		this.age=a;
		
		System.out.println("이름: "+this.name);
		System.out.println("학번: "+this.num);
		System.out.println("나이: "+this.age);
	}
}

public class Object_Array {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		// 객체 배열
		// 배열 선언(크기 지정/할당) -> 객체 선언(공간 자세히 나눔)
		
		// 1. 배열 선언
		// (클래스명) (배열명)[] = new (클래스명) [배열크기];
		Student s[]=new Student [3];	// 3개의 객체 담을 수 있음
		
		// 2. 객체 생성
		// [클래스명] [인스턴스명] = new [클래스명]();
//		s[0]=new Student();
//		s[1]=new Student();
//		s[2]=new Student();
		for(int i=0;i<3;i++) {
			s[i]=new Student();
		}
		
		for(int i=0;i<3;i++) {
			String n=scan.next();
			String num=scan.next();
			int a=scan.nextInt();
			
			s[i].Print(n, num, a);
		}
	}
}
