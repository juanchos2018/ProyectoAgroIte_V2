using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
    public  class NActividad
    {
        public List<Actividad> GetActividad()
        {
            using (var db = new ClsConexion())
            {
                var lista = db.Actividad.ToList();
                return lista;
            }
        }
        public string SetActividad(Actividad data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Actividad.Add(data);
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

        public string GetActividad(int id)
        {
            using (var db = new ClsConexion())
            {
                return db.Actividad
                    .Where(d => d.IdActividad ==id)
                    .Select(d => d.Nombre)
                    .First();
            }
        }
    }
}
