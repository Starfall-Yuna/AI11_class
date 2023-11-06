using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BookManager
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
            dataGridView1.DataSource = null;
            if (DataManager.users.Count > 0)
                dataGridView1.DataSource = DataManager.users;

            dataGridView1.CellClick += DataGridViewCellClick;
            button1.Click += AddUser;

            //무명 델리게이트
            //수정
            button2.Click += delegate (object s, EventArgs e)
            {
                try
                {
                    //Single : 괄호 안에 있는 메서드의 조건을
                    //만족하는 객체의 위치를 가져옴
                    //만약에 해당 조건을 충족하는 객체가 없으면
                    //Exception을 발생시킴
                    //여기서 리턴된 u는 DataManager.users 안에 있는
                    //요소의 위치를 참조하므로
                    //u.Name을 바꾸면 users에 있는 그 객체의 Name이 바뀜
                    User u = DataManager.users.Single
                    (x => x.Id == textBox1.Text);
                    u.Name = textBox2.Text;
                    try
                    {
                        //ID=1, Name=이동준이라는 사람이 책을 빌렸는 데
                        //Id=1인 사람이 김동준으로 이름을 바꿨다면
                        //book의 username 부분도 바꿔야 된다.
                        Book b = DataManager.books.Single
                        (x => x.userId == textBox1.Text);
                        b.userName = textBox2.Text;

                        //Book b = DataManager.books.Single
                        //(delegate(Book x) { return x.userId == textBox1.Text; });

                        //Book b = DataManager.books.Single(FindBook);

                    }
                    catch (Exception)
                    {

                        
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("없는 ID!");
                }
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = DataManager.users;
                DataManager.Save();
            };

            //EventHandler deleteBtn = delegate(object s, EventArgs e) { }
            //EventHandler deleteBtn = (s, e) =>
            //{
            //    try
            //    {
            //        User u = DataManager.users.Single(
            //            x => x.Id == textBox1.Text);
            //        DataManager.users.Remove(u);

            //        dataGridView1.DataSource = null;
            //        if (DataManager.users.Count > 0)
            //            dataGridView1.DataSource = DataManager.users;
            //        DataManager.Save();
            //    }
            //    catch (Exception)
            //    {

            //    }
            //};
            //button3.Click += deleteBtn;

            button3.Click += (s, e) =>
            {
                try
                {
                    User u = DataManager.users.Single(
                        x => x.Id == textBox1.Text);
                    DataManager.users.Remove(u);
                    dataGridView1.DataSource = null;
                    if(DataManager.users.Count > 0)
                        dataGridView1.DataSource = DataManager.users;
                    DataManager.Save();

                }
                catch (Exception)
                {

                }
            };

        }

        private bool FindBook(Book book)
        {
            return book.userId==textBox1.Text;
        }

        private void DataGridViewCellClick(object sender, DataGridViewCellEventArgs e)
        {
            User u = 
                (sender as DataGridView).CurrentRow.DataBoundItem as User;
            textBox1.Text = u.Id;
            textBox2.Text = u.Name;
        }
        private void AddUser(object s, EventArgs e)
        {
            //Exists : 메서드를 매개변수로 하는 메서드
            //저 괄호 안에 들어가는 메서드는 리턴 타입이 true나 false여야 함
            //여기서 x는 users에 있는 모든 사용자들을 의미
            //모든 사용자 중에서 textBox1.Text랑 일치하는 Id를 가진 사용자가
            //한 명이라도 있으면 true를 리턴하고
            //그러면 Exists 자체도 true를 리턴함
            //x=>x.Id==textBox1.Text : 이거 자체가 람다 형태로 들어간 메서드
            //매개변수는 User 타입 변수
            if (DataManager.users.Exists(x=>x.Id==textBox1.Text))
            {
                MessageBox.Show("해당 ID 이미 있음");
            }
            else
            {
                User u = new User() {Id =textBox1.Text,Name=textBox2.Text};
                DataManager.users.Add(u);
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = DataManager.users;
                DataManager.Save();
            }
        }
    }
}
