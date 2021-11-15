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


        public Frecuencia EditFrecuencia(Frecuencia c)
        {
            using (var db = new ClsConexion())
            {
                var resul = db.Frecuencia
                    .Where(d => d.Idfrecuencia == c.Idfrecuencia)
                    .FirstOrDefault();
                resul.Nombre = c.Nombre;
                db.SaveChanges();
                return resul;
            }
        }
        public Frecuencia InfoFrecuencia(int id)
        {
            using (var db = new ClsConexion())
            {
                return db.Frecuencia.Where(x => x.Idfrecuencia == id).FirstOrDefault();
            }
        }
    }
}
