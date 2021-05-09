using CDatos;
using System;
using System.Collections.Generic;
using System.Text;

namespace CNegocio
{
    public class NConexion
    {
        public static void Conectar(string server, string db, string user, string pws)
        {
            Parametros.pc_Servidor = server;
            Parametros.pc_BaseDatos = db;
            Parametros.pc_Usuario = user;
            Parametros.pc_Contrasena = pws;
        }

    }
}
