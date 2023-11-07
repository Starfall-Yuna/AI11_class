using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HeyKaKaoAPIMap
{
    public class Locale //지역 정보 저장 클래스
    {
        public string Name { get; set; }
        public double Lat { get; set; }
        public double Lng { get; set; }

        public Locale(string name, double lat, double lng)
        {
            Name = name;
            Lat = lat;
            Lng = lng;
        }
        public override string ToString()
        {
            return Name;
        }
    }
}
