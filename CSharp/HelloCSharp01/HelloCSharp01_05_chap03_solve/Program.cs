using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp01_05_chap03_solve
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*
             * 사용자에게 태어난 년도를 입력 받아 그 해의 띠를 출력하는 프로그램을 작성하시오.(if)
             */
            Console.WriteLine("언제 태어났나요?");
            int year = int.Parse(Console.ReadLine());
            year %= 12; //year = year%12

            //비권장
            if(year == 9) Console.WriteLine("뱀띠");
            else if(year == 10) Console.WriteLine("말띠");
            else if( year == 11) Console.WriteLine("양띠");
            else if(year==0)
                Console.WriteLine("원숭이띠");
            else if(year==1) 
            {
                Console.WriteLine("닭띠");
            }
            else if(year == 2) { Console.WriteLine("개띠"); }
            else if(year == 3)
                Console.WriteLine("돼지띠");
            else if(year == 4)
                Console.WriteLine("쥐띠");
            else if(year ==5)
                Console.WriteLine("소띠");
            else if(year==6)
                Console.WriteLine("호랑이띠");
            else if(year==7)
                Console.WriteLine("토끼띠");
            else if(year==8)
                Console.WriteLine("용띠");
            //else
            //{
            //    Console.WriteLine(  "용띠");
            //}

            int myYear = DateTime.Now.Year % 12;
            //myYear %= 12;
            switch(myYear) 
            {
                case 0:
                    Console.WriteLine("원숭이띠");
                    break;
                case 1:
                    Console.WriteLine("닭띠");
                    break;
                case 2:
                    Console.WriteLine("개띠");
                    break;
                case 3:
                    Console.WriteLine("돼지띠");
                    break;
                case 4:
                    Console.WriteLine("쥐띠");
                    break;
                case 5:
                    Console.WriteLine("소띠");
                    break;

                case 6:
                    Console.WriteLine("호랑이띠");
                    break;
                case 7:
                    Console.WriteLine("토끼띠");
                    break;
                case 8:
                    Console.WriteLine("용띠");
                    break;

                case 9:
                    Console.WriteLine("뱀띠");
                    break;
                case 10:
                    Console.WriteLine("말띠");
                    break;
                case 11:
                    Console.WriteLine("양띠");
                    break;
            }

            Console.WriteLine("몇 월에 태어나셨나요?");
            int month = int.Parse(Console.ReadLine());
            if(month==12 || month == 1 || month == 2)
                Console.WriteLine("겨울");
            else if (month == 3 || month == 4 || month == 5)
                Console.WriteLine("봄");
            else if (month >=6 && month <= 8)
                Console.WriteLine("여름");
            else if (month > 8 && month < 12)
                Console.WriteLine("가을");
            else
                Console.WriteLine("잘못된 계절입니다.");

            int myMonth = DateTime.Now.Month;
            switch (myMonth)
            {
                case 12:
                case 1:
                case 2:
                    Console.WriteLine("winter");
                    break;
                case 3:
                case 4:
                case 5:
                    Console.WriteLine("spring");
                    break;
                case 6:
                case 7:
                case 8:
                    Console.WriteLine("summer");
                    break;
                case 9:
                case 10:
                case 11:
                    Console.WriteLine("autumn");
                    break;
                default:
                    Console.WriteLine("잘못된 계절!");
                    break;
            }

            // 배열 선언
            double[] arr2 = { 3.14, 3.1415 };
            int[] alpha2 = new int[26];


        }
    }
}
