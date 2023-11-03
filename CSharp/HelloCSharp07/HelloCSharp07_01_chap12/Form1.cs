using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace HelloCSharp07_01_chap12
{
    public partial class Form1 : Form
    {
        List<int> numbers = new List<int>() { 1,2,3,4,5,6,7,8,9,10 };
        int[] nums = new int[] { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
        public Form1()
        {
            InitializeComponent();
            //label인 것들만 Text를 ""으로 만들어보기
            foreach(var item in Controls)
            {
                if (item is Label)
                    (item as Label).Text = "";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            label1.Text = "";
            label1.Text += "1~10까지의 제곱\n";
            var output = from item in numbers select item * item;
            foreach(var item in output)
                label1.Text += item.ToString()+"\n";
            label1.Text += "10~100까지의 제곱\n";
            var output2 = from item in nums select item * item; 
            foreach (var item in output2)
                label1.Text += item.ToString() + "\n";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label2.Text = "";
            label2.Text += "1~10중 짝수만\n";
            var output = from item in numbers where item%2==0 select item;
            foreach(var item in output)
                label2.Text += item.ToString()+"\n";
            label2.Text += "10~100중 10의 자리가 짝수인 것만\n";
            var output2 = from item in nums where (item/10)%2==0 select item;
            foreach (var item in output2)
                label2.Text += item.ToString() + "\n";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            label3.Text = "";
            IEnumerable<int> output = 
                from item in numbers where item%2==0 select item*item;
            label3.Text += "1~10까지의 짝수를 제곱한 것\n";
            foreach(var item in output)
                label3.Text += item+"\n";
            output = from item in nums where (item/10)%2==0 
                     select item*item;
            label3.Text += "10~100 중 10의 자리가 짝수인 걸 제곱한 것\n";
            foreach(var item in output)
                label3.Text += item+"\n";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var output = from item in numbers 
                         orderby item descending 
                         select item;
            label4.Text = "1~10을 역순 출력\n";
            foreach(var item in output)
                label4.Text += item+"\n";
            output = from item in nums orderby item descending select item;
            label4.Text += "10~100을 역순 출력\n";
            foreach (var item in output)
                label4.Text += item + "\n";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //익명 객체
            //select란, 배열이나 리스트에 있는 구성요소를
            //내가 원하는 형태로 출력함
            var output = from item in numbers
                         select new
                         {
                             Original = item,
                             Square = item * item,
                             Cubed = item * item * item,
                         };
            foreach(var item in output)
            {
                label5.Text += "원본:" + item.Original + "\n";
                label5.Text += "제곱:" + item.Square + "\n";
                label5.Text += "세제곱:" + item.Cubed + "\n";
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            List<Product> products = new List<Product>();
            products.Add(new Product() { Name = "깨", Price =100});
            products.Add(new Product() { Name = "무", Price =500});
            products.Add(new Product() { Name = "김", Price =250});
            products.Add(new Product() { Name = "콩", Price =50});
            products.Add(new Product() { Name = "잣", Price =700});
            products.Add(new Product() { Name = "쌀", Price =10});
            products.Add(new Product() { Name = "톳", Price =70});

            //가격 저렴한 순(오름차순)
            //ascending 없고 descending도 없으면 자동으로 오름차순
            //SQL에도 똑같이 적용됨(SQL에선 asc, desc라고 씀)
            //var output = from item in products orderby item.Price select item;
            var output = from item in products
                         orderby item.Price ascending
                         select item;
            //가격 비싼 순(내림 차순)
            //내림 차순은 descending을 꼭 써야 함
            //var output = from item in products 
            //             orderby item.Price descending
            //             select item;
            foreach (var item in output)
                label6.Text += item+"\n";

        }

        private void button7_Click(object sender, EventArgs e)
        {
            string url = "https://www.weather.go.kr/w/rss/dfs/hr1-forecast.do?zone=2714051000";
            XElement xe = XElement.Load(url);//xml형식으로 불러옴
            var xmlQuery = from item in xe.Descendants("data") select item;
            foreach(var item in xmlQuery)
                Console.WriteLine(item);
            foreach(var item in xmlQuery)
                Console.WriteLine(item.Element("wfKor").Value);
            //Console.WriteLine(item.Element("wfKor"));
            var xmlQuery2 = from item in xe.Descendants("data") 
                       select new 
                       {
                           Hour = item.Element("hour").Value,
                           Day = item.Element("day").Value,
                           WfKor = item.Element("wfKor").Value
                       };
            foreach(var item in xmlQuery2)
            {
                Console.WriteLine(item.Hour);
                Console.WriteLine(item.Day);
                Console.WriteLine(item.WfKor);
            }

            var lastList = from item in xe.Descendants("data")
                           select new Weather()
                           {
                               Hour = item.Element("hour").Value,
                               Day = item.Element("day").Value,
                               wfKor = item.Element("wfKor").Value
                           };
            foreach(var item in lastList)
                Console.WriteLine(item);

        }

        private void button8_Click(object sender, EventArgs e)
        {
            string url = "https://www.weather.go.kr/w/rss/dfs/hr1-forecast.do?zone=2714051000";
            XElement xe = XElement.Load(url);//xml형식으로 불러옴

            List<Weather> list = (from item in xe.Descendants("data")
                                 select new Weather()
                                 {
                                     Hour = item.Element("hour").Value,
                                     Day = item.Element("day").Value,
                                     wfKor = item.Element("wfKor").Value
                                 }).ToList<Weather>();
            dataGridView1.DataSource = null;
            dataGridView1.DataSource = list;

        }

        private void button9_Click(object sender, EventArgs e)
        {
            string url = "https://www.weather.go.kr/w/rss/dfs/hr1-forecast.do?zone=2714051000";
            XElement xe = XElement.Load(url);//xml형식으로 불러옴

            List<Weather> list = (from item in xe.Descendants("data")
                                  select new Weather()
                                  {
                                      Hour = item.Element("hour").Value,
                                      Day = item.Element("day").Value,
                                      wfKor = item.Element("wfKor").Value
                                  }).ToList<Weather>();
            weatherBindingSource.DataSource = list;
        }
    }
}
