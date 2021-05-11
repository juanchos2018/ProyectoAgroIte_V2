using CEntidad;
using CNegocio;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoAgroIte_V2.Controllers
{
    [ApiController]
    public class ProductoController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IHostingEnvironment _env;
        public ProductoController(IConfiguration configuration, IHostingEnvironment env)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
            _env = env;
        }

        [Route("Producto/SetProducto")]
        //public IActionResult SubirArchivos(IFormCollection UploadedFiles)
        public IActionResult Guardar(IFormCollection UploadedFiles)
        {
            Producto pro = new Producto();
            NProducto nusuario = new NProducto();
            string filePath = "";
            pro.IdCategoria = int.Parse( UploadedFiles["IdCategoria"].ToString());
            pro.Nombre_Producto = UploadedFiles["Nombre_Producto"].ToString();
            pro.Precio_Referencial = int.Parse(UploadedFiles["Precio_Referencial"].ToString());        
            pro.Descripcion_Producto = UploadedFiles["Descripcion_Producto"].ToString();
            pro.Fecha_Inicio = UploadedFiles["Fecha_Inicio"].ToString();
            pro.Fecha_Fin = UploadedFiles["Fecha_Fin"].ToString();
            pro.Cantidad_Producida = UploadedFiles["Cantidad_Producida"].ToString();
            pro.IdUnidad_Volumen = int.Parse(UploadedFiles["IdUnidad_Volumen"].ToString());
            pro.Idfrecuencia = int.Parse( UploadedFiles["Idfrecuencia"].ToString());
            pro.IdUsuario =int.Parse( UploadedFiles["IdUsuario"].ToString());          

            string ruta = Path.Combine(_env.WebRootPath, "img/product");
            long size = UploadedFiles.Files.Sum(f => f.Length);
            string fileName = "";
            string rutaimguser = "";
            if (size == 0)
            {
                rutaimguser = "img/product/default.png";
            }
            else
            {
                foreach (var formFile in UploadedFiles.Files)
                {
                    if (formFile.Length > 0)
                    {
                        fileName = pro.IdUsuario + "-" + formFile.FileName;
                        filePath = Path.Combine(ruta, fileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            formFile.CopyTo(fileStream);
                        }
                    }
                }
                // rutaimguser = filePath;
                rutaimguser = "img/product/" + fileName;
            }
            pro.RutaImagenes_Producto = rutaimguser;        

            try
            {
                var result = nusuario.SetProducto(pro);
                string msg;
                string estado;
                if (result == "OK") { msg = "Datos Insertados Correctamente"; estado = "OK"; }
                else if (result.Substring(0, 24) == "Violation of PRIMARY KEY")
                { msg = "Producto ya se encuentra registrado"; estado = "ERROR"; }
                else { msg = "Hubo un error "; estado = "ERROR"; }
                var salida = new
                {
                    Estado = estado,
                    Mensaje = msg,
                    detalle = result
                };
                return Json(salida);
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }
       
        [Route("Producto/GetMyProducto")]
        public JsonResult GetProductos([FromBody] Usuario d)
        {
            int idusu = d.IdUsuario;
            NProducto producs = new NProducto();
            var query = producs.GetMyProductos(idusu);
            return Json(query);
        }

        [Route("Producto/GetProductoAll")]
        public JsonResult GetProductosAll()
        {           
            NProducto producs = new NProducto();
            var query = producs.GetProductosAll();
            return Json(query);
        }
    }
}
