using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp01_06_chap04
{
    internal class Program
    {
        static void Main(string[] args)
        {

            int sum = 0;
            for (int i = 1; i <= 100; i++)
                sum += i;
            Console.WriteLine(sum);

            for(char i = '가'; i<='힣'; i++)
                Console.Write(i);

            int[] numbers = { 10, 20, 30, 40, 50 };
            Console.WriteLine("for문 결과");
            for (int i = 0; i< numbers.Length; i++)
            {
                Console.WriteLine(i);
                Console.WriteLine(numbers[i]);
            }
            Console.WriteLine("foreach문 결과");
            //i = numbers 안에 있는 값들 각각을 의미함
            //java의 for(int item : numbers) 
            /*
             * 		for (int item : numbers) {
			System.out.println(item);
		}
             */
            //var 대신에 int를 넣어도 됨
            //var item = 100; item은 정수
            //var item = "이동준"; item은 문자열
            foreach (var item in numbers)
                Console.WriteLine(item);


        }
    }
}
