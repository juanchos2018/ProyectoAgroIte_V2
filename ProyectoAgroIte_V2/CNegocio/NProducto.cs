using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
   public class NProducto
    {
        public string SetProducto(Producto data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Producto.Add(data);
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

        public List<Producto> GetMyProductos(int idusuario)
        {
            using (var db = new ClsConexion())
            {
                var lista = db.Producto.Where(x=>x.IdUsuario==idusuario).ToList();
                return lista;
            }
        }
        public List<Producto> GetProductosAll()
        {
            using (var db = new ClsConexion())
            {
                var lista = db.Producto.ToList();
                return lista;
            }
        }
    }
}
