using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StartBlocklyALPHA.BO;
using StartBlocklyALPHA.Service;
using StartBlocklyALPHA.DAO;
using System.Data;

namespace StartBlocklyALPHA.GUI
{
    public partial class Proyectos : System.Web.UI.Page
    {
        Connection con = new Connection();
        UsuarioBO oUsuario = new UsuarioBO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"].Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write(Session["Usuario"].ToString());
                oUsuario.Nombre = Session["Usuario"].ToString();
            }
            testeo(); //carga de los proyectos
        }

        public DataTable listaB()
        {
            DataTable dt;
            DataTable dtUser;

            BlockBO oBlocksBO = new BlockBO();
            BlocksCTRL oBlocksCTRL = new BlocksCTRL();

            UsuarioBO oUsuarioBO = new UsuarioBO();
            UserCTRL oUserCtrl = new UserCTRL();

            dtUser = oUserCtrl.devuelveUser(oUsuarioBO).Tables[0];
            int id = Convert.ToInt32(dtUser.Rows[0]["userId"].ToString());
            oBlocksBO.IdUser = id;
            dt = oBlocksCTRL.devuelveLigas(oBlocksBO).Tables[0];
            return dt;
        }

        public void testeo()
        {
            GridView1.DataSource = listaB();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            BlockBO oBlocksBO = new BlockBO();
            BlocksCTRL oBlocksCTRL = new BlocksCTRL();

            if (e.CommandName == "Elim")
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                int id = (int)GridView1.DataKeys[indice].Value;
                oBlocksBO.Id = Convert.ToInt32(id);
                oBlocksCTRL.BajaR(oBlocksBO);
                testeo();
            }
            if (e.CommandName == "Detalle")
            {
                //mandar id al modifi

                int indice = Convert.ToInt32(e.CommandArgument);
                int id = (int)GridView1.DataKeys[indice].Value;
                oBlocksBO.Id = id;
                DataTable dt;
                dt = oBlocksCTRL.devuelveLigas(oBlocksBO).Tables[0];
                //datos a pasar en modify
                //int IdB = indice;
                //string dateB = dt.Rows[indice]["Fecha"].ToString();
                txtBlocky.Text = dt.Rows[indice]["Bloques"].ToString();
                // MostrarDatos();
                string val = txtBlocky.Text;//val = contenido en el textbox

                Session["value"] = val;
                Response.Redirect("../GUI/Modify.aspx");
                testeo();
            }
        }

        protected void lbNuevo_Click(object sender, EventArgs e)
        {
            DataTable dtUser;

            UsuarioBO oUsuarioBO = new UsuarioBO();
            UserCTRL oUserCtrl = new UserCTRL();

            dtUser = oUserCtrl.devuelveUser(oUsuarioBO).Tables[0];
            int id = Convert.ToInt32(dtUser.Rows[0]["userId"].ToString());
            Session["id"] = id;
            Response.Redirect("../GUI/Traductor.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}