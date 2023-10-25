using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp01_02_WinForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //mbox 적고 tab tab
            MessageBox.Show(textBox1.Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
            MessageBox.Show("두 값의 합 : " + (num1+num2));
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
            MessageBox.Show("두 값의 차 : " + (num1 - num2));
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
            MessageBox.Show("두 값의 곱 : " + (num1 * num2));
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
            MessageBox.Show("두 값의 나누기 : " + (num1 / num2));
        }

        private void button6_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
            MessageBox.Show("두 값을 나눈 나머지 : " + (num1 % num2));
        }

        private void button7_Click(object sender, EventArgs e)
        {
            int num1 = int.Parse(textBox2.Text);
            //ctrl + d 누르면 줄 복사 됨
            int num2 = int.Parse(textBox3.Text);
                         
            MessageBox.Show("두 값의 합("+num1+"+"+num2+"):"+(num1+num2));
            MessageBox.Show(string.Format("두 값의 합({0}+{1}):{2}",
                num1,num2,num1+num2));
            MessageBox.Show($"두 값의 합({num1}+{num2}):{num1+num2}");

        }
    }
}
