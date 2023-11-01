using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp05_01_chap07
{
    //나이랑 이름 정보가 있고
    //먹고 자고 털정리하고 사냥하는 기능이 있는 객체
    public class Lion : Cat
    {
        public override void Eat()
        {
            Console.WriteLine("어흥냠냠");
        }

        public override void grooming()
        {
            //return;
            Console.WriteLine("귀찮아서안함");
        }

        public override void hunt()
        {
            Console.WriteLine("달려가서 사냥");
        }

        public override void Sleep()
        {
            Console.WriteLine("계속 잠만 잠");
        }
    }
}
