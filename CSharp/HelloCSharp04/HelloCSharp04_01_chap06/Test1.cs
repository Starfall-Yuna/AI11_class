using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp04_01_chap06
{
    //인스턴스 메소드를 만들 것
    public class Test1
    {
        public int Power(int input)
        {
            return input*input;
        }
        public int Power(int input, int count)
        {
            int answer = 1;
            for(int i = 0; i < count; i++) 
            {
                answer *= input;
            }
            return answer;
        }
        public int SumAll(int end)
        {
            int result = 0;
            for(int i = 0; i<=end; i++)
            {
                result += i;
            }
            return result;
        }
        public int SumAll(int start, int end)
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
