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
    public class ActividadController : Controller
    {
        private readonly IConfiguration _configuration;
        public ActividadController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }

        [Route("Actividad/GetActividad")]        
        public JsonResult GetActtividad()
        {
            NActividad actividad = new NActividad();
            var query = actividad.GetActividad();
            return Json(query);
        }

        [Route("Actividad/SetActividad")]
        public IActionResult Guardar([FromBody] Actividad d)
        {
            NActividad cliente = new NActividad();
            try
            {
                var result = cliente.SetActividad(d);
                string msg;
                string estado;
                if (result == "OK") { msg = "Datos Insertados Correctamente"; estado = "OK"; }
                else if (result.Substring(0, 24) == "Violation of PRIMARY KEY")
                { msg = "EL Cliente ya se encuentra registrado"; estado = "ERROR"; }
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
