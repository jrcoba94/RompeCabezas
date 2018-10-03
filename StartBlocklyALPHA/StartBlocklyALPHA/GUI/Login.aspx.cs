using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StartBlocklyALPHA.Service;
using StartBlocklyALPHA.BO;
using System.Data;

namespace StartBlocklyALPHA.GUI
{
    public partial class Login : System.Web.UI.Page
    {
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {

            TextBox1.Focus();
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
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox1.Text;

            DataTable dt = new DataTable();
            UsuarioBO oUserBO = new UsuarioBO();
            UserCTRL oUserCTRL = new UserCTRL();
            oUserBO.Nombre = TextBox1.Text;
            oUserBO.Contraseña = TextBox2.Text;
            dt = oUserCTRL.devuelveUser(oUserBO).Tables[0];

            if (dt.Rows.Count > 0)
            {
                Session["Usuario"] = user;
                limpiar();
                Mensaje("Datos correctos");
                Response.Redirect("Proyectos.aspx");
            }
            else
            {
                if (i == 0)
                {
                    Mensaje("Datos incorrectos");
                    limpiar();
                }
            }
        }
    }
}