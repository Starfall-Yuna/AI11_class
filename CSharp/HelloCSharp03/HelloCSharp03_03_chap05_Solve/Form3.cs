using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp03_03_chap05_Solve
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
            button1.Text = "가위";
            button2.Text = "바위";
            button3.Text = "보";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int com = new Random().Next(3);//0,1,2
            //0 = 가위
            //1  = 바위
            //2 = 보

            if(com==0)
                MessageBox.Show("무승부");
            else if(com==1)
                MessageBox.Show("유저 패배. 컴퓨터 승");
            else
                MessageBox.Show("유저 승리. 컴퓨터 패배");


        }

        private void button2_Click(object sender, EventArgs e)
        {
            int com = new Random().Next(3);//0,1,2
            //0 = 가위
            //1  = 바위
            //2 = 보

            if (com == 0)
                MessageBox.Show("유저 승리. 컴퓨터 패배");
            else if (com == 1)
                MessageBox.Show("무승부");
            else
                MessageBox.Show("유저 패배. 컴퓨터 승");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int com = new Random().Next(3);//0,1,2
            //0 = 가위
            //1  = 바위
            //2 = 보

            if (com == 0)
                MessageBox.Show("유저 패배. 컴퓨터 승");
            else if (com == 1)
                MessageBox.Show("유저 승리. 컴퓨터 패배");
            else
                MessageBox.Show("무승부");
        }
    }
}
