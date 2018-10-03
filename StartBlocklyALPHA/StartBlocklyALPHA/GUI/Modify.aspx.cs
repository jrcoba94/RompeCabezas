using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StartBlocklyALPHA.BO;
using StartBlocklyALPHA.DAO;
using StartBlocklyALPHA.Service;

namespace StartBlocklyALPHA.GUI
{
    public partial class Modify : System.Web.UI.Page
    {
        BlockBO oBlocksBO = new BlockBO();
        BlocksCTRL oBlocksCTRL = new BlocksCTRL();
        int idUsers;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["value"].ToString());
            txtBolck.Text = Session["value"].ToString();
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
                oBlocksBO.Date = DateTime.Now.ToString("G");
                oBlocksBO.BlocksS = txtExportBlocks.Text;
                oBlocksBO.Titu = txtNombre.Text;
                oBlocksBO.IdUser = idUsers; //Convert.ToInt32(Session["id"].ToString());
                i = oBlocksCTRL.AltaR(oBlocksBO);
                Response.Redirect("Proyectos.aspx");

            }
            i = oBlocksCTRL.AltaR(oBlocksBO);
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

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            txtBolck.Text = "";
            Response.Redirect("../GUI/Proyectos.aspx");
        }
    }
}