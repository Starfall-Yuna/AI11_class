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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            chart1.Series[0].Points.AddXY(0.0, 10);
            chart1.Series[0].Points.Add(new double[] {2.0});
            chart1.Series[0].Name = "level";
            chart1.Series.Add("data");
            chart1.Series[0].Points.Add(new double[] { 5.0 });
            chart1.Series[1].Points.Add(new double[] { 20.0 });
            chart1.Series[1].Points.Add(new double[] { 50.0 });

            chart2.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            for (int i = 0; i < 10; i++)
                chart2.Series["Series1"].Points.AddXY(i, i + 10);
        }
    }
}
