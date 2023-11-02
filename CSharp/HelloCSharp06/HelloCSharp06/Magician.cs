using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp06
{
    public class Magician : GameCharacter
    {
        public override string Die()
        {
            return "연기처럼 사라진다";
        }
        public override void fight()
        {
            MessageBox.Show("마법공격!");
        }
    }
}
