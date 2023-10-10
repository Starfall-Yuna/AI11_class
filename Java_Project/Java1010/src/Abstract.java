
// 추상 클래스 :: "추상적인" = "구체적이지 않은"
// 	=> 정의가 덜 된 클래스
//	=> abstract class 키워드 사용해서 구현
//	=> "추상 메소드를 하나 이상은 가지고 있어야한다."

abstract class Shape{	// 도형 클래스
	// 추상 메소드 :: 정의가 덜 된 메소드
	// => abstract 키워드 사용해서 구현
	// => 함수의 선언부만 남고, 정의부는 없는 형태
	abstract public void WhatShape();
	
	// 추상 클래스에선, 기본 생성자조차도 없다.
//	public Shape() {
//		
//	}
}

// 추상 클래스 응용하는 방법 -> 자식 클래스를 통해 "구체화" (오버라이딩)
class Circle extends Shape{
	// 추상 클래스 Shape 상속 -> 추상 메소드 WhatShape() 반드시 구현해야함
	//	=> 오버라이딩
	public void WhatShape() {
		// 부모의 멤버인 추상메소드 WhatShape() 구체화
		System.out.println("해당 객체는 원입니다.");
	}
}
class Rectangle extends Shape{
	public void WhatShape() {
		System.out.println("해당 객체는 사각형입니다.");
	}
}


// 클래스 = 객체를 생성하는 틀
public class Abstract {
	public static void main(String[] args) {
		// Shape s=new Shape();		// 에러O, 추상클래스로 객체 생성X
		
		// 에러X, 둘다 추상클래스는 아니기 때문에, 객체 생성에는 무리가 없음
		Circle c=new Circle();	
		Rectangle r=new Rectangle();
		
		c.WhatShape();
		r.WhatShape();
	}
}





