using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp06
{
    public class HCar : IConveyancable
    {
        private string brandName;
        //public string Name
        //{ get => brandName; 
        //    set => brandName=value; }
        public string Name
        {
            get { return "현대의 자랑 : " + brandName; }
            set { brandName = value; }
        }

        public void Fly()
        {
            throw new NotImplementedException();
        }

        public void run()
        {
            throw new NotImplementedException();
        }

        public void stop()
        {
            throw new NotImplementedException();
        }
    }
}
