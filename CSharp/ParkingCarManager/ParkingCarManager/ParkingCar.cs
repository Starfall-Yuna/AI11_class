using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ParkingCarManager
{
    public class ParkingCar
    {
        public string parkingSpot { get; set; } //주차 공간
        public string carNumber { get; set; } //자동차 번호
        public string driverName { get; set; } //차 주인 이름
        public string phoneNumber { get; set; } //차 주인 연락처
        public DateTime parkingTime { get; set; } //주차 시점
    }
}
