using CDatos;
using CEntidad;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
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

        public IEnumerable GetMyProductos(int idusuario)
        {
            //using (var db = new ClsConexion())
            //{
            //    var lista = db.Producto.Where(x=>x.IdUsuario==idusuario).ToList();
            //    return lista;
            //}

            using (var db = new ClsConexion())
            {
                var lista = (from pro in db.Producto
                             join usu in db.Usuario on pro.IdUsuario equals usu.IdUsuario
                             where pro.IdUsuario==idusuario
                             select new
                             {
                                 IdProducto = pro.IdProducto,
                                 Nombre_Producto = pro.Nombre_Producto,
                                 RutaImagen = pro.RutaImagenes_Producto,
                                 Descripcion = pro.Descripcion_Producto,
                                 Precio = pro.Precio_Referencial,
                                 Nombres = usu.Nombres,
                                 Apellidos = usu.Apellidos,
                                 Direccion = usu.Direccion

                             }).ToList();

                return lista;
            }
        }
        public List<Producto> GetProductosAll()
        {
            using (var db = new ClsConexion())
            {
                var lista = db.Producto
                    .Include(x=>x.Categoria).ToList();            
                return lista;
            }
        }

        public IEnumerable GetProductosAll2()
        {
            using (var db = new ClsConexion())
            {
                var lista = (from pro in db.Producto
                     join usu in db.Usuario on pro.IdUsuario equals usu.IdUsuario
                     select new
                     {
                         IdProducto = pro.IdProducto,
                         Nombre_Producto = pro.Nombre_Producto,
                         RutaImagen=pro.RutaImagenes_Producto,
                         Descripcion = pro.Descripcion_Producto,
                         Precio = pro.Precio_Referencial,
                         Nombres = usu.Nombres,
                         Apellidos=usu.Apellidos,
                         Direccion=usu.Direccion

                     }).ToList();

                return lista;
            }
        }

        public Producto GetProduct(int idproducto)
        {
            using (var db = new ClsConexion())
            {
                return db.Producto.Where(x=>x.IdProducto== idproducto).FirstOrDefault();
            }
        }
        public Producto UpdateProduct(Producto c)
        {
            using (var db = new ClsConexion())
            {
                var resul = db.Producto
                    .Where(d => d.IdUsuario == c.IdUsuario && d.IdProducto==c.IdProducto)
                    .FirstOrDefault();
                resul.Nombre_Producto = c.Nombre_Producto;
                resul.Descripcion_Producto = c.Descripcion_Producto;
                resul.Cantidad_Producida = c.Cantidad_Producida;
                resul.IdCategoria = c.IdCategoria;
                resul.Precio_Referencial = c.Precio_Referencial;
                resul.Fecha_Inicio = c.Fecha_Inicio;
                resul.Fecha_Fin = c.Fecha_Fin;
                resul.IdUnidad_Volumen = c.IdUnidad_Volumen;
                resul.Idfrecuencia = c.Idfrecuencia;
                resul.RutaImagenes_Producto = c.RutaImagenes_Producto;
                db.SaveChanges();
                return resul;
            }
        }
        public string Delete(Producto data)
        {
            using (var db = new ClsConexion())
            {
                var detalle = db.Producto
                    .Where(d => d.IdProducto==data.IdProducto && d.IdUsuario==data.IdUsuario).ToList();
                foreach (var item in detalle)
                {
                    db.Producto.Remove(item);
                }
                var resultado = db.SaveChanges();
                return "OK";
            }
        }
    }
}
