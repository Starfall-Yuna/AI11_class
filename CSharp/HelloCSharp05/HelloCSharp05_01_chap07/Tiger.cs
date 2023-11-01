using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp05_01_chap07
{
    public class Tiger : Cat
    {
        public override void Eat()
        {
            Console.WriteLine("떡하나 주면 안 잡아먹지");
        }

        public override void grooming()
        {
            Console.WriteLine("무늬를 잘 다듬어요");
        }

        public override void hunt()
        {
            Console.WriteLine("호랑이답게 사냥해요");
        }

        public override void Sleep()
        {
            Console.WriteLine("호랑이의 이름 : " + Name);
            Console.WriteLine("이 녀석은 잠을 잘 자요");
            Console.WriteLine(Age+"살 답게 잘 잡니다");
        }
    }
}
