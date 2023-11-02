using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp06
{
    public class BattleCruiser : IConveyancable
    {
        private string name;
        public string Name 
        { get => name;
            set => name = value; }

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
