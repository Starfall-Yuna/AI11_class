using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Student s = new Student();  
            s.name= "Test";
            s.age = 1;
            MessageBox.Show(s.name+s.age);

            Person p = new Person();
            p.name= "Test2";
            p.age = 2;
            MessageBox.Show(p.name + p.age);
        }
    }
}
