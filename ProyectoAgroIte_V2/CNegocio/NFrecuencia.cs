using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
    public class NFrecuencia
    {
        public List<Frecuencia> GetFrecuencia()
        {
            using (var db = new ClsConexion())
            {
                var lista = db.Frecuencia.ToList();
                return lista;
            }
        }
        public string SetFrecuencia(Frecuencia data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Frecuencia.Add(data);
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
