using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace StartBlocklyALPHA.DAO
{
    public class Connection
    {
        public Connection() { }

        SqlConnection con;

        public SqlConnection establecerConexion()
        {
            string cadena = "Data Source=.; initial catalog = BlocklyProject; integrated security=true";
            con = new SqlConnection(cadena);
            return con;
        }

        public void AbrirConexion()
        {
            con.Open();
        }

        public void CerrarConexion()
        {
            con.Close();
        }
    }
}