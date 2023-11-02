using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp06
{
    public class Dron : IFlierable
    {
        public void Fly()
        {
            MessageBox.Show("위이잉~");
        }
    }
}
