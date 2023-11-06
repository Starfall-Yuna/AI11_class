using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HeyGoodBye
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            chart1.Series[0].Name = "C#실력";
            chart1.Series[0].Points.AddXY(1, 2);
            chart1.Series[0].Points.AddXY(2, 1);
            chart1.Series[0].Points.AddXY(3, 5);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new Form2().ShowDialog();   
        }
    }
}
