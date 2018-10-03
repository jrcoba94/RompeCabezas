using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using StartBlocklyALPHA.BO;

namespace StartBlocklyALPHA.DAO
{
    public class BlocksDAO
    {
        Connection con = new Connection();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        DataSet dsBlock = new DataSet();
        string sql;


        public int InsertarRE(object obj)
        {
            BlockBO datos = (BlockBO)obj;
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();
            sql = "Insert into SaveBlocks (userId,Fecha,Titulo,Bloques) values('" +
                datos.IdUser + "','" + datos.Date + "','" + datos.Titu + "','" + datos.BlocksS + "')";
            cmd.CommandText = sql;
            int valor = cmd.ExecuteNonQuery();
            con.CerrarConexion();
            if (valor == 0)
            {
                return 0;
            }
            return 1;


        }

        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        public int EditarRE(object obj)
        {
            BlockBO datos = (BlockBO)obj;
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();
            sql = "update SaveBlock set fecha='" + datos.Date + "',Bloques='" + datos.BlocksS + "'";
            cmd.CommandText = sql;
            int valor = cmd.ExecuteNonQuery();
            con.CerrarConexion();
            if (valor == 0)
            {
                return 0;
            }
            return 1;
        }
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

        public int EliminarRE(object obj)
        {
            BlockBO datos = (BlockBO)obj;
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();
            sql = "delete  from SaveBlocks where idsave='" + datos.Id + "'";
            cmd.CommandText = sql;

            int valor = cmd.ExecuteNonQuery();
            con.CerrarConexion();
            if (valor == 0)
            {
                return 0;
            }
            return 1;
        }

        /*public DataTable MostrarDatos() //para mostrar en el DataGrid
        {
            string sql = "Select * from SaveBlocks";
            SqlDataAdapter lista = new SqlDataAdapter(sql, con.establecerConexion());
            DataTable datos = new DataTable();
            lista.Fill(datos);
            con.CerrarConexion();
            return datos;

        }*/

        public DataSet devuelveBlocks(object obj)
        {
            string cadenaWhere = "";
            bool edo = false;
            BlockBO data = (BlockBO)obj;
            cmd = new SqlCommand();
            da = new SqlDataAdapter();
            con = new Connection();
            cmd.Connection = con.establecerConexion();
            con.AbrirConexion();

            if (data.Date != null)
            {

                cadenaWhere = cadenaWhere + " Fecha=@Fecha and";
                cmd.Parameters.Add("@Fecha", SqlDbType.VarChar);
                cmd.Parameters["@Fecha"].Value = data.Date;
                edo = true;
            }

            if (data.BlocksS != null)
            {

                cadenaWhere = cadenaWhere + " Bloques=@Bloques and";
                cmd.Parameters.Add("@Bloques", SqlDbType.Xml);
                cmd.Parameters["@Bloques"].Value = data.BlocksS;
                edo = true;
            }
            if (data.Titu != null)
            {

                cadenaWhere = cadenaWhere + " Titulo=@Titulo and";
                cmd.Parameters.Add("@Titulo", SqlDbType.VarChar);
                cmd.Parameters["@Titulo"].Value = data.Titu;
                edo = true;
            }

            if (data.IdUser > 0)
            {

                cadenaWhere = cadenaWhere + " userId=@userId and";
                cmd.Parameters.Add("@userId", SqlDbType.Int);
                cmd.Parameters["@userId"].Value = data.IdUser;
                edo = true;
            }

            if (edo == true)
            {
                cadenaWhere = " WHERE " + cadenaWhere.Remove(cadenaWhere.Length - 3, 3);
            }

            sql = " SELECT * FROM SaveBlocks " + cadenaWhere;

            cmd.CommandText = sql;
            da.SelectCommand = cmd;
            da.Fill(dsBlock);
            con.CerrarConexion();
            return dsBlock;
        }
    }
}