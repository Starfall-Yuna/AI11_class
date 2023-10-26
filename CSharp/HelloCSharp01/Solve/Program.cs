using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Solve
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("몇층?");
            int floor = int.Parse(Console.ReadLine());
            for (int i = 1; i <= floor; i++)
            {
                for (int j = 0; j < floor - i; j++)
                {
                    Console.Write(" ");
                }
                for (int j = 0; j < 2 * i - 1; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

            //int[] numbers = { 10, -1, 5, 20, 3 };
            int[] numbers = new int[5];
            for (int i = 0; i < numbers.Length; i++)
            {
                Console.WriteLine($"{i + 1}번째 값 입력");
                numbers[i] = int.Parse(Console.ReadLine());
            }
            int mx = numbers[0];
            int mn = mx;

            for (int i = 1; i < numbers.Length; i++)
            {
                if (numbers[i] > mx)
                    mx = numbers[i];
                if (numbers[i] < mn)
                    mn = numbers[i];
            }
            Console.WriteLine("최댓값:" + mx);
            Console.WriteLine("최솟값:" + mn);

            string start = "1";
            for (int i = 0; i < 20; i++)
            {
                int count = 0;
                char num = start[0];
                string end = "";
                Console.WriteLine(start);
                for (int j = 0; j < start.Length; j++)
                {
                    if (num != start[j])
                    {
                        end = end + num + count;
                        num = start[j];
                        count = 1;
                    }
                    else
                    {
                        count++;
                    }
                }
                end = end + num + count;
                start = end;

            }

            int[] lotto = new int[6];
            int bns = -1;
            Random r = new Random();
            for (int i = 0; i < 6; i++)
            {
                int n = r.Next(1, 46);
                for (int j = 0; j < i; j++)
                {
                    if (lotto[j] == n)
                    {
                        j = -1;
                        n = r.Next(1, 46);
                    }
                }
                lotto[i] = n;
            }
            for (int i = 0; i < 6; i++)
            {
                bns = r.Next(1, 46);
                for (int j = 0; j < 6; j++)
                {
                    if (bns == lotto[j])
                    {
                        bns = r.Next(1, 46);
                        i = -1;
                        break;
                    }
                }
            }
            Array.Sort(lotto);
            foreach (var item in lotto)
                Console.Write(item + " ");
            Console.WriteLine();
            Console.WriteLine(bns);

            for (int i = 1; i <= floor; i++)
            {
                for (int j = 0; j < floor - i; j++)
                {
                    Console.Write(" ");
                }
                for (int j = 0; j < 2 * i - 1; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }
            for (int i = 1; i < floor; i++)
            {
                for (int j = 0; j < i; j++)
                {
                    Console.Write(" ");
                }
                for (int j = 0; j < 2 * (floor - i) - 1; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

            int year = DateTime.Now.Year;
            string jisin = "";
            switch (year % 10)
            {
                case 0:
                    jisin += "경";
                    break;
                case 1:
                    jisin += "신";
                    break;
                case 2:
                    jisin += "임";
                    break;
                case 3:
                    jisin += "계";
                    break;
                case 4:
                    jisin += "갑";
                    break;
                case 5:
                    jisin += "을";
                    break;
                case 6:
                    jisin += "병";
                    break;
                case 7:
                    jisin += "정";
                    break;
                case 8:
                    jisin += "무";
                    break;
                case 9:
                    jisin += "기";
                    break;
                default:
                    break;
            }
            switch (year % 12)
            {
                case 0:
                    jisin += "신";
                    break;
                case 1:
                    jisin += "유";
                    break;
                case 2:
                    jisin += "술";
                    break;
                case 3:
                    jisin += "해";
                    break;
                case 4:
                    jisin += "자";
                    break;
                case 5:
                    jisin += "축";
                    break;
                case 6:
                    jisin += "인";
                    break;
                case 7:
                    jisin += "묘";
                    break;
                case 8:
                    jisin += "진";
                    break;
                case 9:
                    jisin += "사";
                    break;
                case 10:
                    jisin += "오";
                    break;
                case 11:
                    jisin += "미";
                    break;
                default:
                    break;
            }

            Console.WriteLine(jisin);



        }
    }
}
