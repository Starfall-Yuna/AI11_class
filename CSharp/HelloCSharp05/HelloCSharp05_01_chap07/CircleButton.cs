using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HelloCSharp05_01_chap07
{

    //Button을 상속받아서
    //그리는 메서드를 오버라이드 하여서
    //새로운 컨트롤(=컴포넌트)을 만들어 냈다.
    public class CircleButton : Button
    {
        protected override void OnPaint(PaintEventArgs pevent)
        {
            GraphicsPath g = new GraphicsPath();
            g.AddEllipse(0,0,ClientSize.Width,ClientSize.Height);
            this.Region = new System.Drawing.Region(g);
            base.OnPaint(pevent);
        }
    }
}
