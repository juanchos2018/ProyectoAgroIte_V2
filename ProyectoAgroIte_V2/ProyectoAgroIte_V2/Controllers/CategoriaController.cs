using CEntidad;
using CNegocio;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoAgroIte_V2.Controllers
{
    [ApiController]
    public class CategoriaController : Controller
    {
        private readonly IConfiguration _configuration;
        public CategoriaController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }

        [Route("Categoria/GetCategoria")]
        public JsonResult GetCategoria()
        {
            NCategoria categoria = new NCategoria();
            var query = categoria.GetCategoria();
            return Json(query);
        }

        [Route("Categoria/SetCategoria")]
        public IActionResult Guardar([FromBody] Categoria d)
        {
            NCategoria categoria = new NCategoria();
            try
            {
                var result = categoria.SetCategoria(d);
                string msg;
                string estado;
                if (result == "OK") { msg = "Datos Insertados Correctamente"; estado = "OK"; }
                else if (result.Substring(0, 24) == "Violation of PRIMARY KEY")
                { msg = "la caetegoria ya se encuentra registrado"; estado = "ERROR"; }
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
    }
}
