using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HeyLotto
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            List<Lotto> lottos = new List<Lotto>();
            int start = 1000;//1000회차부터 뿌릴 것
            while(true)
            {
                //using 영역이 끝나면 wc의 메모리가 자동 해제됨
                using (WebClient wc = new WebClient()) 
                {
                    var json
                        = wc.DownloadString("https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="+start);
                    var jArray = JObject.Parse(json);
                    if (jArray["returnValue"].ToString() == "fail")
                        break;
                    Lotto temp = new Lotto(
                        jArray["drwtNo1"].ToString(),
                        jArray["drwtNo2"].ToString(),
                        jArray["drwtNo3"].ToString(),
                        jArray["drwtNo4"].ToString(),
                        jArray["drwtNo5"].ToString(),
                        jArray["drwtNo6"].ToString(),
                        jArray["bnusNo"].ToString(),
                        jArray["drwNo"].ToString());
                    lottos.Add(temp);
                    start++;
                }
            }
            dataGridView1.DataSource = null;
            dataGridView1.DataSource = lottos;
        }
    }
}
