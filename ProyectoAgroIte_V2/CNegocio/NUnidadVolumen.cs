using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
    public class NUnidadVolumen
    {
        public List<UnidadVolumen> GetUnidadVolumen()
        {
            using (var db = new ClsConexion())
            {
                var lista = db.UnidadVolumen.ToList();
                return lista;
            }
        }
        public string SetUnidadVolumen(UnidadVolumen data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.UnidadVolumen.Add(data);
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
    }
}
