using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp04_01_chap06
{
    public partial class Form2 : Form
    {
        int number = 0; //정답
        int time = 0; //제한 시간
        public Form2()
        {
            InitializeComponent();
            label1.Text = "제한 시간은 5초입니다.(0~9 중 하나가 정답)";
            label2.Text = "";
            number = new Random().Next(10);
            Console.WriteLine(number);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(int.TryParse(textBox1.Text, out int answer)==false)
            {
                //answer = -1; //answer가 내가 선택한 정답
                MessageBox.Show("값을 제대로 입력하세요.");
                return;
            }
            if(answer>number)
                MessageBox.Show("선택한 숫자가 더 큽니다.");
            else if (answer < number)
                MessageBox.Show("선택한 숫자가 더 작습니다.");
            else
            {
                time = 0;
                MessageBox.Show("정답");
                label2.Text = "Finished";
                number = new Random().Next(10);
                Console.WriteLine(number);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            time++;
            label2.Text = "경과시간 : " + time + "/5 초";
            if(time>5)
            {
                label2.Text = "타임아웃!";
                time = 0;
            }
        }
    }
}
