using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp05_01_chap07
{
    public class DomesticCat : Cat
    {
        public string masterName { get; set; }
        public override void Eat()
        {
            Console.WriteLine(masterName+"한테 얻어먹어요.");
        }
        public override void grooming()
        {
            Console.WriteLine(masterName + "가 빗겨줘요");
        }
        public override void hunt()
        {

            Console.WriteLine(masterName + "가 주는 거만 먹어요");
        }
        public override void Sleep()
        {
            Console.WriteLine(masterName + "가 재워줍니다.");
        }
    }
}
