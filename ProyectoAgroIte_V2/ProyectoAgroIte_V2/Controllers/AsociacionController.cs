using CEntidad;
using CNegocio;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoAgroIte_V2.Controllers
{
    [ApiController]

    public class AsociacionController : Controller
    {

        private readonly IConfiguration _configuration;
        public AsociacionController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }

        [Route("Asociacion/GetAsociacion")]
        public JsonResult GetAsociacion()
        {
            NAsociacion actividad = new NAsociacion();
            var query = actividad.GetAsociacion();
            return Json(query);
        }


        [Route("Asociacion/GetAsociacionAll")]
        public JsonResult GetAsociacionAll()
        {
            NAsociacion actividad = new NAsociacion();
            var query = actividad.GetAsociacion2();
            return Json(query);
        }

        [Route("Asociacion/SetAsociacion")]
        public IActionResult Guardar([FromBody] Asociacion d)
        {
            NAsociacion asociacion = new NAsociacion();
            try
            {
                var result = asociacion.SetAsociacion(d);
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
