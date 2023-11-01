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
        int nowTime = 0; //현재 시간(경과시간)
        public Form3()
        {
            InitializeComponent();
            label1.Text = "";
            label2.Text = "";
        }

        //타이머
        private void timer1_Tick(object sender, EventArgs e)
        {
            nowTime++; //경과 시간 증가
            if(nowTime>limitTime)
            {
                label2.Text = "Game Over!";
                nowTime = 0;
                timer1.Enabled = false;
            }
        }

        //게임 시작 버튼
        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Interval = 1000;
            timer1.Enabled = false; //일단 타이머 멈춤


            //역 for문
            for(int i = Controls.Count-1; i>=0;i--)
            {
                if (Controls[i] is Button)//버튼타입인 것 발견시
                {
                    Button temp = (Button)Controls[i];
                    //버튼 위에 써있는 텍스트를 TryParse해서
                    //결과가 True면 버튼 위에 숫자만 있는거고
                    //결과가 False면 버튼 위에 숫자만 있는 게 아니다.
                    if(int.TryParse(temp.Text, out int tempNum))
                        Controls.RemoveAt(i);
                }
            }


            //textBox1에 숫자가 아닌 다른 값 넣었을 경우
            //if(int.TryParse(textBox1.Text,out limitTime)==false)
            if (!int.TryParse(textBox1.Text,out limitTime))
            {
                MessageBox.Show("제한 시간을 제대로 입력하세요.");
                return;
            }


            label2.Text = "Game Start!";
            answer = new Random().Next(1, 26);
            Console.WriteLine("answer="+answer);
            int count = 1; //순차적으로 버튼 위에 적을 텍스트
            for(int i = 0; i<5; i++)
            {
                for(int j = 0; j<5; j++)
                {
                    Button b = new Button();
                    Point p = new Point();//구조체, 위치값
                    p.X = 15 + 100 * j;
                    p.Y = 15+15 + 25 * i;
                    b.Location = p;
                    b.Click += B_Click;
                    //ctrl + k,c : 주석
                    //ctrl + k,u : 주석해제
                    b.Text = count + "";
                    //b.Text = count.ToString();
                    count++;
                    Controls.Add(b);
                }
            }
            nowTime = 0; //경과시간을 초기화 
            timer1.Enabled = true; //타이머 시작!
        }

        private void B_Click(object sender, EventArgs e)
        {
            //object sender : 이벤트를 발생시킨 주체(=버튼)
            //throw new NotImplementedException();
            Button temp = (Button)sender;
            
            //if(temp.Text==answer.ToString()) { }
            if (temp.Text.Equals(answer.ToString()))
            {
                temp.BackColor = Color.Blue;
                label2.Text = "You Win!";
                nowTime = 0;
                timer1.Enabled = false;
            }
            else
            {
                temp.BackColor = Color.Red;
                label2.Text = "이건 보물이 아닙니다!";
            }
        }
    }
}
