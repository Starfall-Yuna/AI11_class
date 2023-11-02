using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp06
{
    public class Product : IComparable<Product>
    {
        public string Name { get; set; }    
        public int Price { get; set; }

        public int CompareTo(Product other)
        {
            //CompareTo의 결과가 양수 0 음수냐에 따라서 어디로 정렬할 지
            //결정이 된다.
            //Sort 함수에서 내부적으로 CompareTo를 호출함
            //구체적으로 어디서 언제 어떻게 호출하는 지는 모름
            return Price.CompareTo(other.Price);
            //throw new NotImplementedException();
        }


        public override string ToString()
        {
            //return base.ToString(); //Object의 ToString을 호출하는 것
            return "제품명:" + Name + "가격:" + Price;
        }

    }
}
