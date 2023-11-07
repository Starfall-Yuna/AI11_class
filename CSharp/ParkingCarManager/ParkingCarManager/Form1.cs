using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ParkingCarManager
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent(); 
            label1.Text = DateTime.Now.ToString
                ("yyyy-MM-dd HH:mm:ss");

            try //테이블에 데이터가 하나도 없게 되면 이 코드는 예외를 발생시킴
            {
                textBox1.Text = DataManager.Cars[0].parkingSpot;
                textBox2.Text = DataManager.Cars[0].carNumber;
                textBox3.Text = DataManager.Cars[0].driverName;
                textBox4.Text = DataManager.Cars[0].phoneNumber;
                textBox5.Text = textBox1.Text;
            }
            catch (Exception)
            {

            }
            if(DataManager.Cars.Count>0)
                dataGridView1.DataSource=DataManager.Cars;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            label1.Text = DateTime.Now.ToString
                ("yyyy-MM-dd HH:mm:ss");
        }
    }
}
