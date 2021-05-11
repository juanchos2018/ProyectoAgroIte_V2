using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
   public class NUsuario
    {

        public string SetUsuario(Usuario data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Usuario.Add(data);
                    var result = db.SaveChanges();
                    if (result > 0)
                    {
                        return "OK";
                    }
                    else
                    {
                        return "Error";
                    }
                }
                catch (Exception e)
                {
                    return e.InnerException.Message.ToString();
                }
            }
        }

        public Usuario GetLogin(Usuario Login)
        {
            using (var db = new ClsConexion())
            {
                return db.Usuario
                    .Where(d => d.Contraseña == Login.Contraseña)
                    .Where(d => d.Alias == Login.Alias)                    
                    .FirstOrDefault();
            }
        }
    }
}
