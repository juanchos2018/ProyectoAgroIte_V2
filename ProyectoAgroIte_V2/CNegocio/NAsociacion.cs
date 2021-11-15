using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
   public class NAsociacion
    {
        public List<Asociacion> GetAsociacion()
        {
            using (var db = new ClsConexion())
            {
               // var lista = db.Asociacion.ToList();
                // return lista;
                var lista = new List<Asociacion>();
                var query = db.Asociacion.ToList();
                foreach (var item in query)
                {
                    var name = new
                    {
                        first = item.Razon_Social,
                        last = item.Ruc
                    };
                    lista.Add(new Asociacion()
                    {
                        IdAsociacion = item.IdAsociacion,
                        Name = name,
                        Direccion=item.Direccion,
                        Descripcion = item.Descripcion,
                        Departamento = item.Departamento,
                        Telefono=item.Telefono

                    });

                }
                return lista;
            }
        }




        public List<Asociacion> GetAsociacion2()
        {
            using (var db = new ClsConexion())
            {
                // var lista = db.Asociacion.ToList();
                // return lista;              
                var query = db.Asociacion.ToList();              
                return query;
            }
        }

        public string SetAsociacion(Asociacion data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Asociacion.Add(data);
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
