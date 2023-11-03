using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp07
{
    public partial class Form1 : Form
    {
        delegate void TestDelegate();
        List<Product> products = new List<Product>();
        public Form1()
        {
            InitializeComponent();
            products.Add(new Product());
            products[0].Name = "감자";
            products[0].Id = 2;
            products[0].Price = 500;
            products.Add(new Product());
            products[1].Name = "고구마";
            products[1].Id = 3;
            products[1].Price = 5000;
            products.Add(new Product());
            products[2].Name = "귤";
            products[2].Id = 1;
            products[2].Price = 100;

            label1.Text = "";
            label2.Text = "";
            button2.Text = "가격 오름차순";
            button3.Text = "Id 내림차순";
            //막간 질문 : AutoSize=true 옵션은 권장사항일까?
            button2.AutoSize = true;//글자 길어지면 버튼 길이 늘어남
            button3.AutoSize = true;


            Button b = new Button();
            b.Click += myEvent;
            b.Click += delegate (object s, EventArgs e)
            {
                SayMsg();
            };
            b.Click += (s, e) =>
            {
                MessageBox.Show("하이루 하이루");
            };
            b.Location = new Point(100, 100);
            b.Text = "테스트";
            //버튼 1개에 3개의 이벤트(=메서드)가 들어간 거임
            b.Click -= myEvent; //메서드에 이름이 있으면
            //해당 메서드는 이벤트에서 제외 가능
            Controls.Add(b);



        }

        private void myEvent(object s, EventArgs eventArgs)
        {
            MessageBox.Show("방가방가");
        }

        void SayMsg()
        {
            MessageBox.Show("안녕하세요");
        }

        void LoopFunc(TestDelegate a, int count)
        {
            for(int i = 0; i < count; i++) 
            {
                a();
            }
        }


        private void button1_Click(object sender, EventArgs e)
        {

            TestDelegate t = SayMsg;
            t();

            SayMsg(); //한 번 호출

            LoopFunc(SayMsg, 3);//SayMsg를 세 번 호출

            //무명 델리게이트 : 메서드이긴 한 데
            //한 번만 쓰이는 메서드이며 이름이 없는 메서드
            LoopFunc(delegate () { MessageBox.Show("Test"); }, 2);

            //람다 : 무명 델리게이트를 축약한 형태
            LoopFunc(() => { MessageBox.Show("lambda"); }, 3);
        }

        int compare(Product a, Product b)
        {
            return a.Price.CompareTo(b.Price);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            products.Sort(compare);
            foreach (var item in products)
                label1.Text += item;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //무명 델리게이트
            //products.Sort(
            //    delegate (Product a, Product b)
            //    {
            //        return b.Id.CompareTo(a.Id);
            //    }
            //);
            //람다1(매개변수의 타입이랑 return키워드도 생략했음)
            //products.Sort((a,b)=>b.Id.CompareTo(a.Id));
            //람다2
            products.Sort((a,b)=> { return b.Id.CompareTo(a.Id); });
            //참고: String도 CompareTo로 정렬됨

            foreach (var item in products)
                label2.Text += item;
        }


        void printA()
        {
            for (int i = 0; i < 100; i++)
                Console.Write('A');
        }
        private void button4_Click(object sender, EventArgs e)
        {
            Thread t1 = new Thread(printA);
            Thread t2 = new Thread(()=>
            { 
                for (int i = 0; i < 100; i++) 
                    Console.Write('B');
            }
            );
            Thread t3 = new Thread(delegate ()
            {
                {
                    for (int i = 0; i < 100; i++)
                        Console.Write('C');
                }
            });
            //시분할 시스템
            //비동기화 = (동기화는 누군가의 영향을 받는 것)
            t1.Start();
            t2.Start();
            t3.Start();
            new Thread(
                () =>

                {
                    for (int i = 0; i < 100; i++)
                        Console.Write('D');
                }).Start();
            //※ C#에서는 Thread관련된 이슈가 하나 있음
            //CrossThread 이슈
            //Thread가 GUI쪽을 건드리게 되면 튕기는 오류
            //이 부분을 따로 처리해주는 방법들이 있으니 참고할 것
        }
    }
}
