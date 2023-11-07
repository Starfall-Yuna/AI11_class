using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParkingCarManager
{
    //참고코드(특정한 사람의 컴퓨터를 공통 DB로 쓰고 싶을 때)
    //https://timeboxstory.tistory.com/10
    //이 링크대로만 하면 연결은 되고, 권한은 없음
    //보안 -> 로그인 -> 서버역할에 다 체크해줘야 다른 데서도 제어가 가능함!

    //db 연결하는 부분
    /*
     public static void ConnectDB()
        {//접속해주는 함수
            try
            {
                string connect = string.Format("Data Source={0};" +
                "Initial Catalog = {1};" +
                "Persist Security Info = True;"+
                "User ID=team;Password=1234",
                "192.168.0.84,1433", "Csharp_Team");
                conn = new SqlConnection(connect);
                conn.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.WriteLine("connect Fail");
            }
        }
     */
    //conn.ConnectionString = $"Data Source=192.168.0.111,1433; Initial Catalog = MYDB; Persist Security Info = True; User ID=user1; Password=1234";



    //mysql이나 oracle이랑 c# 연결하려면
    //nuget패키지가 필요함
    //하지만 mssql은 별도의 설치 없이 연결 가능함
    public class DBHelper
    {
        //DB 연결 및 테이블 데이터 다룰 때 필요한 객체들
        private static SqlConnection conn = new SqlConnection();
        public static SqlDataAdapter da;
        public static DataSet ds;
        public static DataTable dt;
        private const string TABLENAME = "parkingCarManager";//테이블명
        //DB 연결하는 메서드
        private static void ConnectDB()
        {
            string dataSource = "local";
            string db = "CarManager"; //DB명
            string security = "SSPI";
            conn.ConnectionString =
                $"Data Source=({dataSource}); initial Catalog={db};" +
                $"integrated Security={security};" +
                "Timeout=3";
            conn.Open();

        }
        //테이블에 있는 데이터 읽어들이는 메서드
        //주차 공간 검사, 전체 조회 등의 역할을 함

        //디폴트 매개변수(일종의 오버로딩)
        //selectQuery(); 이렇게 호출하면 ps에 "-1"이 자동으로 할당됨
        //selectQuery("5"); 이렇게 호출하면 ps에 "5"가 할당됨
        public static void selectQuery(string ps="-1")
        {
            try
            {
                ConnectDB();//DB연결
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                if (ps.Equals("-1"))
                    cmd.CommandText = "select * from " + TABLENAME;
                else
                    cmd.CommandText = $"select * from {TABLENAME} where parkingSpot='{ps}'";
                da = new SqlDataAdapter(cmd); //쿼리문을 활용하여 데이터 불러오는 것
                ds = new DataSet();
                da.Fill(ds, TABLENAME); //ds에 테이블을 채워넣음
                dt = ds.Tables[0];//만약 여러개의 테이블을 불러왔다면 그 중 첫번째꺼 갖고옴
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }
            finally
            {
                conn.Close();//DB 연결이 잘못되더라도 연결 끊어주는 건 꼭 해줌
            }
        }
        //주차 or 출차
        public static void updateQuery(string parkingSpot,string carNumber,
            string driverName,string phoneNumber,bool isRemove)
        {

        }
        private static void executeQuery(string ps, string cmd)
        {

        }
        public static void deleteQuery(string ps)
        {

        }
        public static void insertQuery(string ps)
        {

        }
    }
}
