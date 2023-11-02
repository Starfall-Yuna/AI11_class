using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp06
{
    //public class IRiderable 
    //public struct IRiderable

    //인터페이스 네이밍 규칙
    //C#은 첫글자 I가 꼭 붙고 뒤는 able이 붙음
    //Java는 뒤에 able이 붙음
    //클래스 네이밍 규칙(Java,C#공통) : 첫 글자가 무조건 대문자
    public interface IRiderable
    {
        void run();
        void stop();
    }
}
