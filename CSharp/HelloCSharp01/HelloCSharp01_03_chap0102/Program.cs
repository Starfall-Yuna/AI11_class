using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp01_03_chap0102
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //java로 치면 .charAt(0) 한 거랑 똑같음
            Console.WriteLine("안녕하세요"[0]);
           // Console.WriteLine("안녕하세요"[5]);
            Console.WriteLine("안녕하세요."[5]);

            Console.WriteLine("몇 인치인가요?(1번 문제)");
            int input = int.Parse(Console.ReadLine());
            Console.WriteLine(input*2.54);
            Console.WriteLine(input*2.54+"cm");
            Console.WriteLine($"{input}inch = {input*2.54}cm");

            Console.WriteLine("몇 kg인가요?(2번 문제)");
            string num = Console.ReadLine();
            input = int.Parse(num);
            Console.WriteLine($"{input}kg={input*2.20462262}pound");

            // int.Parse : 공백을 비롯하여 숫자를 입력하지 않으면 튕김
            //이를 보안한 것이 int.TryParse
            //엉뚱한 값을 입력해도 튕기지 않고 0을 집어넣음
            Console.WriteLine("원의 반지름을 입력해주세요.");

            //상수
            const double PI = 3.14;//java의 final이랑 똑같은 것

            //int.TryParse(Console.ReadLine(), out input);
            int.TryParse(Console.ReadLine(), out int r);

            Console.WriteLine($"둘레={2*PI*r}");
            Console.WriteLine($"넓이={r*PI*r}");

        }
    }
}
