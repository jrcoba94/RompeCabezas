using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StartBlocklyALPHA.BO
{
    public class UsuarioBO
    {
        public UsuarioBO() { }

        int usuarioId;
        string nombre;
        string apellido;
        string contraseña;
        string correoE;

        public int UsuarioId
        {
            get { return usuarioId; }
            set { usuarioId = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        public string CorreoE
        {
            get { return correoE; }
            set { correoE = value; }
        }

        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }
    }
}