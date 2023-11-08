using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParkingCarManager
{
    public class DataManager
    {
        public static List<ParkingCar> Cars = new List<ParkingCar>();
        static DataManager()
        {
            Load();
        }
        public static void Load()
        {
            try
            {
                //select * from parkingCarManager;
                DBHelper.selectQuery();//전체 조회를 한다.
                Cars.Clear();
                foreach(DataRow item in DBHelper.dt.Rows)
                {
                    ParkingCar car = new ParkingCar();
                    car.parkingSpot = item["parkingspot"].ToString();
                    car.carNumber = item["carNumber"].ToString();
                    car.driverName = item["driverName"].ToString();
                    car.phoneNumber = item["phoneNumber"].ToString();
                    car.parkingTime = item["parkingTime"].ToString() == "" ?
                        new DateTime() : DateTime.Parse(item["parkingTime"].ToString());
                    Cars.Add(car);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
            }
        }


        //주차 및 출차용 Save
        //Save("1","11","111","1111") // 주차
        //Save("1","11","111","1111",true) // 출차
        //Save("1",null,null,null,true) // 출차
        public static void Save(string ps, string carnumber, 
            string driverName, string phoneNumber, bool isRemove=false)
        {
            try
            {
                DBHelper.updateQuery(ps, carnumber, driverName, phoneNumber, isRemove);
            }
            catch (Exception)
            {

            }
        }
        //주차공간 추가 삭제용 Save
        public static bool Save(string cmd, string ps, out string contents)
        {
            DBHelper.selectQuery(ps); //해당 공간이 있는 지 여부 체크

            contents = "";
            if(cmd.Equals("insert"))
                return DBInsert(ps,ref contents);
            else
                return DBDelete(ps,ref contents);
        }
        private static bool DBInsert(string ps, ref string contents)
        {
           if(DBHelper.dt.Rows.Count==0) //해당 주차 공간이 없는 경우
            {
                DBHelper.insertQuery(ps);
                contents = $"주차공간 {ps} 추가됨";
                return true;
            }
           else
            {
                contents = "해당 공간 이미 있음";
                return false;
            }
        }
        private static bool DBDelete(string ps, ref string contents) 
        {
            if (DBHelper.dt.Rows.Count == 0) //해당 주차 공간이 없는 경우
            {
                contents = "해당 공간 없음(삭제 불가능)";
                return false;
            }
            else
            {
                DBHelper.deleteQuery(ps);
                contents = $"주차공간 {ps} 삭제됨";
                return true;
            }
        }
        public static void printLog(string contents)
        {
            //실행 프로그램이랑 같은 경로에 LogFolder라는 폴더 정보
            DirectoryInfo di = new DirectoryInfo("LogFolder");
            if (di.Exists == false) //그 폴더가 없다면
                di.Create(); // 그 폴더를 새로 만든다.
                             //@"LogFolder\ParkingHistory.txt"
                             //"LogFolder\\ParkingHistory.txt"
                             //true : append 옵션, false를 적거나 이 부분을 아예 안 적으면
                             //새로운 내용이 나올때마다 ParkingHistory.txt에 덮어쓰기를 함
                             //즉 내용이 누적되지 않음

            //메모리를 할당하고 나서, 다 쓰고 나면 자동으로 소멸시켜 줌
            using (StreamWriter w = new StreamWriter
               (@"LogFolder\ParkingHistory.txt", true))
            { 
                w.WriteLine(contents);
            }
            
        }



    }
}
