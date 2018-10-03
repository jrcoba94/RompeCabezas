using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using StartBlocklyALPHA.DAO;

namespace StartBlocklyALPHA.Service
{
    public class UserCTRL
    {
        UsuariosDAO res = new UsuariosDAO();

        public int registrarUsers(object obj)
        {
            int resultado = 0;
            resultado = res.insertarUsuario(obj);
            return resultado;
        }

        public DataSet devuelveUser(object obj)
        {
            UsuariosDAO datos = new UsuariosDAO();
            DataSet ds = new DataSet();
            ds = datos.devuelveUsuarios(obj);
            return ds;
        }
    }
}