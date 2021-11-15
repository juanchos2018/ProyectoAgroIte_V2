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
    public class FrecuenciaController : Controller
    {
        private readonly IConfiguration _configuration;
        public FrecuenciaController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }

        [Route("Frecuencia/GetFrecuencia")]
        public JsonResult GetFrecuencia()
        {
            NFrecuencia frecuencia = new NFrecuencia();
            var query = frecuencia.GetFrecuencia();
            return Json(query);
        }

        [Route("Frecuencia/SetFrecuencia")]
        public IActionResult Guardar([FromBody] Frecuencia d)
        {
            NFrecuencia frecuencia = new NFrecuencia();
            try
            {
                var result = frecuencia.SetFrecuencia(d);
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


        [Route("Frecuencia/InfoFrecuencia")]
        public JsonResult InfoFrecuencia([FromBody] Frecuencia d)
        {
            int id = d.Idfrecuencia;
            NFrecuencia frecuencia = new NFrecuencia();
            var query = frecuencia.InfoFrecuencia(id);
            return Json(query);
        }

        [Route("Frecuencia/EditFrecuencia")]
        public IActionResult EditFrecuencia([FromBody] Frecuencia d)
        {
            try
            {
                NFrecuencia frecuencia = new NFrecuencia();
                var result = frecuencia.EditFrecuencia(d);
                string msg;
                string estado;
                var data = new
                {
                    estado = "OK",
                    msg = "Datos Actualizados",

                };
                return Json(data);
                //  return Json(salida);
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }


    }
}
