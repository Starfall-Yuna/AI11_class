using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ObserverPattern
{
    //Form2는 Form을 상속받고 IObserver를 구현한 클래스 중 하나
    public partial class Form2 : Form, IObserver
    {
        public Form2()
        {
            InitializeComponent();
        }
        //Form2를 생성할 때 매개변수로
        //ISubject 인터페이스를 구현한 클래스를 매개변수로 받음
        public Form2(ISubject sub)
        {
            InitializeComponent();
            sub.register(this);//그 안에 있는 register를 호출함
            //this의 의미 : Form2 자신을 의미함
        }
        public void update(string value)
        {
            label1.Text = value;
        }
    }
}
