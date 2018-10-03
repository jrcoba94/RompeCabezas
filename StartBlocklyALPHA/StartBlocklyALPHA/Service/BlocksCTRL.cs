using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using StartBlocklyALPHA.DAO;

namespace StartBlocklyALPHA.Service
{
    public class BlocksCTRL
    {
        BlocksDAO res = new BlocksDAO();

        public int AltaR(object obj)
        {
            int resultado = 0;
            resultado = res.InsertarRE(obj);
            return resultado;
        }
        public int BajaR(object obj)
        {
            int resultado = 0;
            resultado = res.EliminarRE(obj);
            return resultado;
        }
        public int CambioR(object obj)
        {
            int resultado = 0;
            resultado = res.EditarRE(obj);
            return resultado;
        }

        public DataSet devuelveLigas(object obj)
        {
            BlocksDAO datos = new BlocksDAO();
            DataSet ds = new DataSet();
            ds = datos.devuelveBlocks(obj);
            return ds;
        }
    }
}