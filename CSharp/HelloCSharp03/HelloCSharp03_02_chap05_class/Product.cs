using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp03_02_chap05_class
{
    public class Product
    {
        //static이 안 붙은 것들은 인스턴스 변수
        //인스턴스가 선언되고 나서야 메모리에 올라가기 때문
        //Product p = new Product(); //<- 이 코드가 필수임
        //p.name = "감자"; 
        //인스턴스 별로 각자 값이 다를 수 있다.
        public string name;
        public int price;

        //static이 붙은 것들은 클래스 변수
        //인스턴스 선언되기 전 즉 프로그램을 시작하자마자 메모리에 올라감
        //Proudct.companyName = "경북농산";
        //Product 타입 객체들이 모두 공유한다, 공통적으로 접근할 수 있다 
        public static string companyName;
    }
}
