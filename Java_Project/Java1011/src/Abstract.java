
// 클래스, 메소드		=> 지금까지는, "완전하게" "구체적으로" 작성해왔음

// "추상적인", "분명하지 않은" <=> "구체적인"		
// 추상 클래스 :: 정의가 덜 된 클래스 
// 추상 메소드 :: 정의가 덜 된 메소드(멤버 함수)

// abstract 키워드 사용해서 추상 클래스/메소드 선언
// "추상 클래스에는 추상 메소드를 하나 이상은 가지고 있어야한다."		-> 권장사항

abstract class Animal{
	public String species;
	
	// 늘 작성하던 방식인, "구체적으로 정의한 함수"
	//		=> 선언부 + 정의부
	public void Print() {	// 이 동물의 종에 대해 출력
		System.out.println("이 동물은 "+this.species+"입니다.");
	}
	
	// 추상메소드 :: abstract + 선언부만 작성하여 선언 ({} 부분의 정의부 없음)
	abstract public void cry();
}

class Dog extends Animal{
	// 1. 생성자 통해서, species 값을 "강아지"로 초기화
	public Dog() {
		this.species="강아지";
	}
	
	// 추상 클래스를 상속받으면, 그 안에 있는 추상메소드에 대해 오버라이딩
	// 2. cry() 함수 "오버라이딩 하여 재정의"		=> 필수사항
	public void cry() {
		System.out.println("월월월월요일");
	}
	
	// Animal 클래스의 Print() 함수도 있습니다---
}

class Bird extends Animal{
	public Bird() {
		this.species="새";
	}
	
	public void cry() {
		System.out.println("짹짹짹짹");
	}
}

// 클래스 :: 객체/인스턴스를 생성하는 틀
// "추상적인 틀...?"	=> "추상클래스 통해서는 객체 생성X"
//				=> 추상 클래스에는 기본 생성자마저도 없기 때문

// 추상클래스 + 상속 + 오버라이딩 => 추상 클래스를 다른 클래스에서 상속받아서 "구체화"
public class Abstract {
	public static void main(String[] args) {
		// Animal a=new Animal();		=> 에러O, 추상 클래스로 객체 생성 시도
		Dog d=new Dog();
		d.Print();
		d.cry();
		System.out.println();
		
		Bird b=new Bird();
		b.Print();
		b.cry();
	}
}



