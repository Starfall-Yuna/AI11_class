using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp04_01_chap06
{
    public class Test2
    {
        public static int Power(int input)
        {
            return input * input;
        }
        public static int Power(int input, int count)
        {
            int answer = 1;
            for (int i = 0; i < count; i++)
            {
                answer *= input;
            }
            return answer;
        }
        public static int SumAll(int end)
        {
            int result = 0;
            for (int i = 0; i <= end; i++)
            {
                result += i;
            }
            return result;
        }
        public static int SumAll(int start, int end)
        {
            int result = 0;
            for (int i = start; i <= end; i++)
            {
                result += i;
            }
            return result;
        }
    }
}
