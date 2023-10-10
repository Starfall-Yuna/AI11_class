import java.util.Scanner;
// (멤버 변수의 구성을 확인하고, 상속 관계를 적절히 설정해보아라.)

// * Character 클래스
class Character{
	// - 멤버 변수 :: name(이름), hp(체력)
	private String name;
	private int hp;
	public String getName() {
		return name;
	}
	public int getHp() {
		return hp;
	}

	public Character(String n, int h) {
		this.name=n;
		this.hp=h;
	}
	
	// Status() 함수 -> 각 멤버 변수 자유롭게 출력
	public void Status() {
		System.out.println("캐릭터명: "+this.name);
		System.out.println("현재 hp: "+this.hp);
	}
	// isOkay() 함수 -> "구체화가 필요한 함수입니다." 출력
	public void isOkay() {
		System.out.println("구체화가 필요한 함수입니다.");
	}
}

// * npc 클래스
class Npc extends Character{
	// - 멤버 변수 :: name(이름), hp(체력), role(역할)
	private String role;
	
	// 생성자 선언부
	public Npc(String n, int h, String r) {
		super(n,h);
		this.role=r; 
	}
	
	// Status() 함수 -> 각 멤버 변수 자유롭게 출력
	public void Status() {
		System.out.println("캐릭터명: "+this.getName());
		System.out.println("현재 hp: "+this.getHp());
		System.out.println("역할: "+this.role);
	}
	// isOkay() 함수
	public void isOkay() {
		// hp값이 0이라면, "[npc 이름]의 hp가 0입니다. 퀘스트를 실패하였습니다." 출력
		if(this.getHp()==0) {
			System.out.println(this.getName()+"의 hp가 0입니다. 퀘스트를 실패하였습니다ㅠㅜ");
		}
		// hp값이 0 초과라면, "[npc 이름]을 잘 지켜내었습니다. 퀘스트를 성공하였습니다." 출력
		else {
			System.out.println(this.getName()+"을(를) 잘 지켜내었습니다. 퀘스트를 성공하였습니다.");
		}
	}
}

// * user 클래스
class User extends Character{
	// - 멤버 변수 :: name(이름), hp(체력), mp(마나), weapon(무기)
	private int mp;
	private String weapon;
	
	// 생성자 선언부
	public User(String n, int h, int m, String w) {
		super(n,h);
		this.mp=m;
		this.weapon=w;
	}
	
	// Status() -> 각 멤버 변수 자유롭게 출력
	public void Status() {
		System.out.println("캐릭터명: "+this.getName());
		System.out.println("현재 hp: "+this.getHp());
		System.out.println("현재 mp: "+this.mp);
		System.out.println("장착한 무기: "+this.weapon);
	}
	// isOkay() 
	public void isOkay() {
		// hp가 50 이상이라면, "hp 양호합니다." 출력
		if(this.getHp()>=50) {
			System.out.println("hp가 양호합니다.");
		}
		else if(this.getHp()==0) {
			System.out.println("hp가 0이 되었습니다. 근처 마을로 귀환합니다.");
		}
		else {		// hp 값이 1~49인 경우
			System.out.println("hp 관리가 필요합니다. 보유중인 포션이 있다면 섭취하시길 바랍니다.");
		}
	}
}


public class Ex_hero {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		
		// user 클래스에 대해 hero 객체 생성 (입력받아서 각 멤버변수 초기화)
		System.out.print("User 객체 hero의 값을 입력하시오.(이름, hp, mp, 무기 순으로)");
		User hero=new User(scan.next(), scan.nextInt(),
				scan.nextInt(), scan.next());
		
		// npc 클래스에 대해 철수, 영희 객체 생성 (입력받아서 각 멤버변수 초기화)
		System.out.print("Npc 객체 <철수>의 값을 입력하시오.(이름, hp, 역할)");
		Npc 철수=new Npc(scan.next(), scan.nextInt(), scan.next());
		System.out.print("Npc 객체 <영희>의 값을 입력하시오.(이름, hp, 역할)");
		Npc 영희=new Npc(scan.next(), scan.nextInt(), scan.next());
		
		// 각 객체에 대해, Status() 및 isOkay() 함수 호출하기
		hero.Status();
		hero.isOkay();
		System.out.println();
		철수.Status();
		철수.isOkay();
		System.out.println();
		영희.Status();
		영희.isOkay();
	}
}




