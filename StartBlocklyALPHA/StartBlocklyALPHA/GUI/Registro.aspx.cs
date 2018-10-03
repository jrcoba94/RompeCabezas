using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StartBlocklyALPHA.BO;
using StartBlocklyALPHA.Service;

namespace StartBlocklyALPHA.GUI
{
    public partial class Registro : System.Web.UI.Page
    {
        UserCTRL oUser = new UserCTRL();
        UsuarioBO oUserBO = new UsuarioBO();
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Focus();
        }
        public void limpiar()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
        private void Mensaje(string ex)
        {
            string mensaje = ex;
            mensaje = mensaje.Replace(Environment.NewLine, "\\n");
            mensaje = mensaje.Replace("\n", "\\n");
            mensaje = mensaje.Replace("'", "\"");
            ClientScript.RegisterClientScriptBlock(typeof(Page), "Error", "<script> alert('" + mensaje + "');</script>");
        }
        protected void Button1_Click(object sender, System.EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "")
            {
                Mensaje("Algunos campos estan vacíos");
            }
            else
            {
                if (TextBox5.Text == TextBox4.Text)
                {
                    oUserBO.Nombre = TextBox1.Text;
                    oUserBO.Apellido = TextBox2.Text;
                    oUserBO.CorreoE = TextBox3.Text;
                    oUserBO.Contraseña = TextBox4.Text;

                    i = oUser.registrarUsers(oUserBO);

                    if (i == 0)
                    {
                        Mensaje("Los datos No fueron guardados con éxito");
                    }
                    else
                    {
                        Mensaje("Los datos fueron guardatos con éxito");
                        limpiar();
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }
    }
}