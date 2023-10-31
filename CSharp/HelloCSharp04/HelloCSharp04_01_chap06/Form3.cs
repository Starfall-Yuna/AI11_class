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
    public partial class Form3 : Form
    {
        int limitTime = 0; //제한 시간
        int answer = 0; //정답
        public Form3()
        {
            InitializeComponent();
            label1.Text = "";
            label2.Text = "";
        }

        //타이머
        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        //게임 시작 버튼
        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Interval = 1000;
            timer1.Enabled = true; //타이머가 시작 됨
            label2.Text = "Game Start!";
            answer = new Random().Next(1, 26);
            Console.WriteLine("answer="+answer);
            int count = 1; //순차적으로 버튼 위에 적을 텍스트
            for(int i = 0; i<5; i++)
            {
                for(int j = 0; j<5; j++)
                {
                    Button b = new Button();
                    Point p = new Point();
                    p.X = 15 + 100 * j;
                    p.Y = 15+15 + 25 * i;
                    b.Location = p;
                    b.Click += B_Click;
                    b.Text = count + "";
                    count++;
                    Controls.Add(b);
                }
            }
        }

        private void B_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}
