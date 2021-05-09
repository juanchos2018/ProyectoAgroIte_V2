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
    public class UnidadVolumenController : Controller
    {

        private readonly IConfiguration _configuration;
        public UnidadVolumenController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }

        [Route("UnidadVolumen/GetUnidadVolumen")]
        public JsonResult GetCategoria()
        {
            NUnidadVolumen uni = new NUnidadVolumen();
            var query = uni.GetUnidadVolumen();
            return Json(query);
        }

        [Route("UnidadVolumen/SetUnidadVolumen")]
        public IActionResult Guardar([FromBody] UnidadVolumen d)
        {
            NUnidadVolumen uni = new NUnidadVolumen();
            try
            {
                var result = uni.SetUnidadVolumen(d);
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
