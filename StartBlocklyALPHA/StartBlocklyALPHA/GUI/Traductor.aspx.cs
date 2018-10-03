using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StartBlocklyALPHA.BO;
using StartBlocklyALPHA.Service;
using System.Data;

namespace StartBlocklyALPHA.GUI
{
    public partial class Traductor : System.Web.UI.Page
    {
        BlockBO oBlock = new BlockBO();
        BlocksCTRL oControl = new BlocksCTRL();
        int idUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["id"].ToString());
            idUsers = Convert.ToInt32(Session["id"].ToString());
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int i = 0;
            int estado = 1;

            if (txtNombre.Text.Trim().Length == 0)
            {
                mensaje = mensaje + "Debe generar Código \n" +
                                               "ó \n" +
                                   "Introducir un nombre al proyecto";
                estado = 0;
            }
            if (estado == 0)
            {
                Mensaje(mensaje);
                return;
            }
            else
            {
                oBlock.Date = DateTime.Now.ToString("G");
                oBlock.BlocksS = txtExportBlocks.Text;
                oBlock.Titu = txtNombre.Text;
                oBlock.IdUser = idUsers; //Convert.ToInt32(Session["id"].ToString());
                i = oControl.AltaR(oBlock);
                Response.Redirect("Proyectos.aspx");

            }
            i = oControl.AltaR(oBlock);
            if (i == 0)
            {
                Mensaje("Los datos No fueron guardados con éxito");
            }
            else
            {
                Mensaje("Los datos fueron guardatos con éxito");
                limpiar();
            }
        }

        private void Mensaje(string ex)
        {
            string mensaje = ex;
            mensaje = mensaje.Replace(Environment.NewLine, "\\n");
            mensaje = mensaje.Replace("\n", "\\n");
            mensaje = mensaje.Replace("'", "\"");
            ClientScript.RegisterClientScriptBlock(typeof(Page), "Error", "<script> alert('" + mensaje + "');</script>");
        }
        public void limpiar()
        {
            txtNombre.Text = "";
        }

        protected void btnProyectos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Proyectos.aspx");
        }
    }
}