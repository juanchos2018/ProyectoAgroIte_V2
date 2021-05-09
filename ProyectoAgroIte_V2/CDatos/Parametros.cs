using System;
using System.Collections.Generic;
using System.Text;

namespace CDatos
{
    public sealed class Parametros
    {
        private static string _pc_Servidor;

        private static string _pc_BaseDatos;

        private static string _pc_Usuario;

        private static string _pc_Contrasena;

        public static string pc_Servidor
        {
            get
            {
                return Parametros._pc_Servidor;
            }
            set
            {
                Parametros._pc_Servidor = value;
            }
        }

        public static string pc_BaseDatos
        {
            get
            {
                return Parametros._pc_BaseDatos;
            }
            set
            {
                Parametros._pc_BaseDatos = value;
            }
        }

        public static string pc_Usuario
        {
            get
            {
                return Parametros._pc_Usuario;
            }
            set
            {
                Parametros._pc_Usuario = value;
            }
        }

        public static string pc_Contrasena
        {
            get
            {
                return Parametros._pc_Contrasena;
            }
            set
            {
                Parametros._pc_Contrasena = value;
            }
        }
    }
}
