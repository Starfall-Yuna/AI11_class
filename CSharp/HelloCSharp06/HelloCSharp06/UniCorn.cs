using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp06
{
    public class UniCorn : GameCharacter, IRiderable, IFlierable
    {
        public override void fight()
        {
            MessageBox.Show("말발굽으로 때린다.");
        }

        public void Fly()
        {
            MessageBox.Show("말처럼 울면서 새처럼 난다");
        }

        public void run()
        {
            MessageBox.Show("말처럼 달린다");
        }

        public void stop()
        {
            MessageBox.Show("말처럼 멈춘다");
        }
    }
}
