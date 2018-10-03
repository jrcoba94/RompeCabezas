using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StartBlocklyALPHA.BO
{
    public class BlockBO
    {
        public BlockBO() { }


        int id;
        int idUser;
        string titu;
        string date;
        string blocksS;

        public int IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }

        public string Titu
        {
            get { return titu; }
            set { titu = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Date
        {
            get { return date; }
            set { date = value; }
        }

        public string BlocksS
        {
            get { return blocksS; }
            set { blocksS = value; }
        }
    }
}