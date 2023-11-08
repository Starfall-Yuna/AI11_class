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
    //Observer 관리하는 클래스
    public partial class Form1 : Form, ISubject
    {
        List<IObserver> observers = new List<IObserver>();
        public Form1()
        {
            InitializeComponent();
            //this는 Form1을 의미함
            Form2 frm2 = new Form2(this);
            frm2.TopLevel = false;
            frm2.FormBorderStyle = FormBorderStyle.None;
            panel1.Controls.Add(frm2);
            frm2.Show(); //패널1 위에서 뿌림(Form2 창을)

            Form3 frm3 = new Form3(this);
            frm3.TopLevel = false;
            frm3.FormBorderStyle = FormBorderStyle.None;
            panel2.Controls.Add(frm3);
            frm3.Show(); //패널2 위에서 뿌림(Form3 창을)

            Form4 frm4 = new Form4(this,frm2,frm3);
            frm4.TopLevel = false;
            frm4.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Add(frm4);
            frm4.Show();



            //textBox1의 글자 바뀔 때마다 자동 호출됨
            textBox1.TextChanged += (s, e) =>
            {
                notify((s as TextBox).Text);
            };
        }

        public void notify(string msg)
        {
            //observers에 있는 모든 클래스들의 update를 다 호출
            foreach (IObserver o in observers)
                o.update(msg);
        }

        public void register(IObserver o)
        {
            observers.Add(o);
        }

        public void unregister(IObserver o)
        {
            observers.Remove(o);
        }
    }
}
