using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using StartBlocklyALPHA.BO;

namespace StartBlocklyALPHA.DAO
{
    public class UsuariosDAO
    {
        Connection con = new Connection();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataSet dsBlock = new DataSet();
        string sql;

        public UsuariosDAO() { }

        public int insertarUsuario(object obj)
        {

            UsuarioBO datos = (UsuarioBO)obj;
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();
            sql = "insert into Users(firstName,lastName,emailAdress,password) values('" + datos.Nombre + "','" + datos.Apellido + "','" + datos.CorreoE + "','" + datos.Contraseña + "')";
            cmd.CommandText = sql;
            int valor = cmd.ExecuteNonQuery();
            con.CerrarConexion();
            if (valor <= 0)
            {
                return 0;
            }
            return 1;
        }

        public DataSet devuelveUsuarios(object obj)
        {
            string cadenaWhere = "";
            bool edo = false;
            UsuarioBO data = (UsuarioBO)obj;
            cmd = new SqlCommand();
            da = new SqlDataAdapter();
            con = new Connection();
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();

            if (data.Nombre != null)
            {

                cadenaWhere = cadenaWhere + " firstName=@firstName and";
                cmd.Parameters.Add("@firstName", SqlDbType.VarChar);
                cmd.Parameters["@firstName"].Value = data.Nombre;
                edo = true;
            }

            if (data.Apellido != null)
            {

                cadenaWhere = cadenaWhere + " lastName=@lastName and";
                cmd.Parameters.Add("@lastName", SqlDbType.VarChar);
                cmd.Parameters["@lastName"].Value = data.Apellido;
                edo = true;
            }
            if (data.CorreoE != null)
            {

                cadenaWhere = cadenaWhere + " emailAdress=@emailAdress and";
                cmd.Parameters.Add("@emailAdress", SqlDbType.VarChar);
                cmd.Parameters["@emailAdress"].Value = data.CorreoE;
                edo = true;
            }

            if (data.Contraseña != null)
            {

                cadenaWhere = cadenaWhere + " password=@password and";
                cmd.Parameters.Add("@password", SqlDbType.VarChar);
                cmd.Parameters["@password"].Value = data.Contraseña;
                edo = true;
            }

            if (edo == true)
            {
                cadenaWhere = " WHERE " + cadenaWhere.Remove(cadenaWhere.Length - 3, 3);
            }

            sql = " SELECT * FROM Users" + cadenaWhere;

            cmd.CommandText = sql;
            da.SelectCommand = cmd;
            da.Fill(dsBlock);
            con.CerrarConexion();
            return dsBlock;
        }
    }
}