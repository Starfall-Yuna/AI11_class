using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObserverPattern
{
    //관찰자 = 옵저버 = Observer
    //이 인터페이스를 구현한 클래스들은 모두
    //update라는 메서드를 갖고 있고, 이 것을 호출할 수 있다.
    public interface IObserver
    {
        void update(string value);
    }
}
