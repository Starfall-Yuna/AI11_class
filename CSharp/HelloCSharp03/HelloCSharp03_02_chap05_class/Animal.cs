using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloCSharp03_02_chap05_class
{
    public class Animal
    {
        public string name { get; set; }
        public int age { get; set; }

        private int id;//소문자
        public int Id { get { return id; } set { id = value; } }//대문자

        private string species;
        public string Species 
        { get => species; set => species = value; }

        private string masterName;
        public string getMasterName()
        {
            return masterName;
        }
        public void setMasterName(string masterName)
        {
            this.masterName = masterName;
        }

    }
}
