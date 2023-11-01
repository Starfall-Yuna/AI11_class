using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp05
{
    public class Cat : Animal
    {
        public Cat() { Born(); } //Animal을 상속받았으므로 호출 가능
        public void Meow() { Console.WriteLine("야옹");}

        public override void Wash()
        {
            //base.Wash(); //Animal에 있는 Wash 그대로 호출
            Console.WriteLine("물이 싫어서 씻기기 힘들다");
        }
    }
}
