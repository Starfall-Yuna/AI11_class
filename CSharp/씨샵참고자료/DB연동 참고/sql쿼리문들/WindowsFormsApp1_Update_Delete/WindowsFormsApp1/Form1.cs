using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        enum MyEnum
        {
            CUST_ID, BIRTH_DT
        }

        public SqlConnection conn = new SqlConnection();

        public Form1()
        {
            InitializeComponent();
        }

        private void ConnectDB()
        {
            conn.ConnectionString = string.Format("Data Source=({0}); " +
                    "Initial Catalog = {1};" +
                    "Integrated Security = {2};" +
                    "Timeout = 3"
                    , "local", "MYDB1", "SSPI");
            //conn.ConnectionString = $"Data Source=({"local"}); Initial Catalog={"MYDB1"}; Timeout=3";
            conn = new SqlConnection(conn.ConnectionString);
            conn.Open();
        }

        private void Query_Select()
        {
            ConnectDB();

            //SQL 명령어 선언
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT * FROM TB_CUST";

            //DataAdapter와 DataSet으로 DB table 불러오기
            SqlDataAdapter da = new SqlDataAdapter(cmd); //select 구문이 들어감
            DataSet ds = new DataSet();
            da.Fill(ds, "TB_CUST"); //SELECT * FROM TB_CUST의 결과가 da에 입력됨

            //dataGridView에 DB에서 가져온 데이터 입력하기
            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "TB_CUST";
            conn.Close(); //연결 해제

        }

        private void button_Select_Click(object sender, EventArgs e)
        {
            Query_Select();
        }

        private void Query_Insert()
        {
            try
            {
                ConnectDB();
                string sqlcommand = "Insert Into TB_CUST (CUST_ID, BIRTH_DT) values (@parameter1,@parameter2)";
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                //Column 명은 별도의 파라메터 형태로 선언함
                //SQL Injection을 방지하고자 함(SQL Injection : 유효하지 않은 데이터를 이용한 공격) 예: +나 ' 기호를 이용한 공격
                cmd.Parameters.AddWithValue("@parameter1", textBox_ID.Text);
                cmd.Parameters.AddWithValue("@parameter2", textBox_Birth.Text);
                cmd.CommandText = sqlcommand;
                cmd.ExecuteNonQuery(); //쿼리 실행
                conn.Close();
            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message + Environment.NewLine + e.StackTrace);
            }
        }

        private void button_Insert_Click(object sender, EventArgs e)
        {
            Query_Insert(); //테이블에 입력한 데이터 추가
            Query_Select(); //추가된 데이터가 포함된 테이블 출력
        }

        private void Query_Update()
        {
            ConnectDB();
            //sqlComm.CommandText = "update tbl_member set addr=@param3 where id=@param1 and name=@param2";
            /*
             * UPDATE  Table1        SET           PWD = '1234', NickName='토순이'        WHERE ID = 'test'
             */
            string sqlcommand = "Update TB_CUST set CUST_ID = @parameter1, BIRTH_DT = @parameter2 where BIRTH_DT = @parameter3";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@parameter1", textBox_ID.Text);
            cmd.Parameters.AddWithValue("@parameter2", textBox_Birth.Text);
            cmd.Parameters.AddWithValue("@parameter3", textBox_Birth.Text);
            cmd.CommandText = sqlcommand;
            cmd.ExecuteNonQuery(); //쿼리 실행
            conn.Close();

        }

        private void button_Update_Click(object sender, EventArgs e)
        {
            Query_Update();
            Query_Select(); //추가된 데이터가 포함된 테이블 출력
        }

        private void Query_Delete()
        {//sqlComm.CommandText = "delete tbl_member where id=@param1 and name=@param2 and addr=@param3";
         //delete from TB_CUST where cust_id = '1'

            ConnectDB();
            string sqlcommand = "Delete TB_CUST where BIRTH_DT = @parameter1";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@parameter1", textBox_Birth.Text);
            cmd.CommandText = sqlcommand;
            cmd.ExecuteNonQuery(); //쿼리 실행
            conn.Close();
        }

        private void button_Delete_Click(object sender, EventArgs e)
        {
            Query_Delete();
            Query_Select(); //추가된 데이터가 포함된 테이블 출력
        }

        private void dataGridView1_CurrentCellChanged(object sender, EventArgs e)
        {
            try
            {
                var book = dataGridView1.CurrentRow;

                textBox_ID.Text = dataGridView1.CurrentRow.Cells[(int)MyEnum.CUST_ID].Value.ToString();
                textBox_Birth.Text = dataGridView1.CurrentRow.Cells[(int)MyEnum.BIRTH_DT].Value.ToString();
            }
            catch(Exception)
            {

            }
        }
    }
}
