using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp06
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //사번이 문자열일 경우
            Sawon<string> dj = new Sawon<string>();
            dj.Number = textBox1.Text;
            label1.Text = "사번은 " + dj.Number +" 입니다.";
        }
 
        private void button2_Click(object sender, EventArgs e)
        {
            //사번이 숫자일 경우
            Sawon<int> sh = new Sawon<int>();
            if(int.TryParse(textBox2.Text, out int num))
            {
                sh.Number= num;
                label2.Text = "사번은 " + sh.Number + " 입니다.";
            }

        }

        //비행기 움직이는 함수
        //이 함수가 실행되면서
        //out 키워드가 붙은 건
        //함수 바깥에 있는 변수인 데, 그 것의 값이 바뀐다
        //마치 C 언어의 포인터나 C#의 ref랑 마찬가지로 말이다.
        //ref : 참조자, 함수에서 값이 바뀌면 바깥에서도 바뀜
        //out : 참조자, 함수에서 값이 바뀌면 바깥에서도 바뀜, 반드시 대입문이 필요함
        //즉 여기선 rx=0; ry=0; 이런 거라도 넣어줘야 된다.
        //할당이 의무!!! (=)
        void NextPosition(int x, int y, int vx, int vy, out int rx, out int ry)
        {
            //다음 위치 = 현재 위치 + 현재 속도
            rx = x + vx;
            ry = y + vy;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //Environment.NewLine = \n이랑 똑같음(윈도우 기준)
            int x=0 ,y = 0; //x와 y 모두 0
            string nowPos = $"현재 위치 : ({x},{y})"+Environment.NewLine;
            int movePos = int.Parse(textBox3.Text); //속도에 영향 주는 변수
            NextPosition(x, y, movePos+10, movePos+20, out x, out y);
            nowPos += $"이동 후 위치 : ({x},{y})" + Environment.NewLine;
            label3.Text = nowPos;
        }

        List<Product> products = new List<Product>();
        //제품 추가 및 출력 버튼
        private void button4_Click(object sender, EventArgs e)
        {
            products.Add(new Product() { Name=textBox4.Text});
            products.Last().Price = int.Parse(textBox5.Text);
            //products[0].Price = int.Parse(textBox5.Text);

            string prices = "";
            foreach (var item in products)
                prices += item+"\n"; //ToString 오버라이드 해야 쓸 수 있음

            label4.Text = prices;

        }

        //제품을 가격순으로 출력할 버튼
        private void button5_Click(object sender, EventArgs e)
        {
            label4.Text = "";
            products.Sort(); //Product에 IComparable의 CompareTo가
                                       //구현되어 있어야 된다.
            foreach (var item in products)
                label4.Text += item + "\n";

            //인터페이스도 다형성을 적용받음
            //추상클래스와 마찬가지로 단독으로 인스턴스 생성 불가능
            //IComparable ic = new IComparable();
            IComparable<Product> i = new Product();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Fighter f = new Fighter();
            GameCharacter g = new Fighter(); //다형성 적용됨
            //GameCharacter gg = new GameCharacter();
            f.fight();
            g.fight();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            //Fighter f = new Fighter();
            //f.Die();
            string msg = new Fighter().Die();
            MessageBox.Show(msg);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Fighter f = new Fighter();
            f.Id = textBox6.Text;
            f.Lv = int.Parse(textBox7.Text);
            MessageBox.Show(f.SayHello());
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Fighter f = new Fighter();
            f.Id = textBox6.Text;
            f.Lv = int.Parse(textBox7.Text);
            new Form2(f.SayHello()).Show();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("https://naver.com");
        }
    }
}
