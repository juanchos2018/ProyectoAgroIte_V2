using CDatos;
using CEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CNegocio
{
  public  class NCategoria
    {
        public List<Categoria> GetCategoria()
        {
            using (var db = new ClsConexion())
            {
                // var lista = db.Asociacion.ToList();
                // return lista;
                var lista = new List<Categoria>();
                var query = db.Categoria.ToList();
                foreach (var item in query)
                {
                    var name = new
                    {
                        first = item.Nombre,
                        last = item.Nombre
                    };
                    lista.Add(new Categoria()
                    {
                        IdCategoria = item.IdCategoria,
                        Name = name,
                        Nombre = item.Nombre
                     

                    });

                }
                return lista;
            }
        }

        public string SetCategoria(Categoria data)
        {
            using (var db = new ClsConexion())
            {
                try
                {
                    var sss = db.Categoria.Add(data);
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
