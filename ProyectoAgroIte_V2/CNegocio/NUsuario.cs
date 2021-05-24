using CDatos;
using CEntidad;
using Microsoft.EntityFrameworkCore;
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
        public Usuario GetUser(Usuario user)
        {
            using (var db = new ClsConexion())
            {
                return db.Usuario
                    .Where(d => d.IdUsuario == user.IdUsuario)
                    .FirstOrDefault();
            }
        }

        public Usuario UpdatePhoto(Usuario c)
        {
            using (var db = new ClsConexion())
            {
                var resul = db.Usuario
                    .Where(d => d.IdUsuario==c.IdUsuario)
                    .FirstOrDefault();

                resul.RutaFoto_Perfil = c.RutaFoto_Perfil;               
                db.SaveChanges();
                return resul;
            }
        }
        public Usuario UpdateUsuario(Usuario c)
        {
            using (var db = new ClsConexion())
            {
                var resul = db.Usuario
                    .Where(d => d.IdUsuario == c.IdUsuario)
                    .FirstOrDefault();
                resul.Nombres = c.Nombres;
                resul.Apellidos = c.Apellidos;
                resul.Alias = c.Alias;
                resul.Correo = c.Correo;
                resul.Direccion = c.Direccion;
                resul.Celular = c.Celular;
                resul.Organizacion = c.Organizacion;

                db.SaveChanges();
                return resul;
            }
        }
    }
}
