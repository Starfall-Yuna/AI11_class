using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp03_02_chap05_class
{
    public class Student
    {
        public int Id;
        public string Name;

        //이렇게 매개변수가 있는 생성자를 만들게 되면
        //매개변수가 없는 생성자는 자연스럽게 사라짐
        //원래는... public Student() {} 이렇게 빈 생성자가
        //자동으로 들어감
        //그래서 Product 클래스에서도 public Product(){}이게
        //있는 겁니다.(안 보이지만)
        public Student(int id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
    }
}
