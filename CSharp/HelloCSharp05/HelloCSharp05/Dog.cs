using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp05
{
    public class Dog : Animal
    {
        public Dog() { Born(); }
        public string Color { get; set; }
        public void Bark() { Console.WriteLine("멍멍");}
    }
}
