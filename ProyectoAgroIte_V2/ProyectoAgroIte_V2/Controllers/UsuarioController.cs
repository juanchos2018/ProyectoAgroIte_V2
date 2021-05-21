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
    public class UsuarioController : Controller
    {
        private readonly IHostingEnvironment _env;
        private readonly IConfiguration _configuration;
        public UsuarioController(IConfiguration configuration, IHostingEnvironment env)
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


        [Route("Usuario/SetUsuario")]
        //public IActionResult SubirArchivos(IFormCollection UploadedFiles)
        public IActionResult Guardar(IFormCollection UploadedFiles)
        {
            Usuario usu = new Usuario();
            string filePath = "";
            usu.Nombres             = UploadedFiles["Nombres"].ToString();
            usu.Apellidos           = UploadedFiles["Apellidos"].ToString();
            usu.Tipo_Documento      = int.Parse( UploadedFiles["Tipo_Documento"].ToString());
            usu.Num_Identificacion  = UploadedFiles["Num_Identificacion"].ToString();
            usu.Celular             = UploadedFiles["Celular"].ToString();
            usu.Direccion           = UploadedFiles["Direccion"].ToString();
            usu.Correo              = UploadedFiles["Correo"].ToString();
            usu.IdActividad         = int.Parse(UploadedFiles["IdActividad"].ToString());
            usu.Alias               = UploadedFiles["Alias"].ToString();
            usu.Contraseña          = UploadedFiles["Contrasena"].ToString();
            usu.Organizacion        = UploadedFiles["Organizacion"].ToString();
            usu.Descripcion         = UploadedFiles["Descripcion"].ToString();

            string ruta = Path.Combine(_env.WebRootPath, "img/user");
            long size = UploadedFiles.Files.Sum(f => f.Length);
            string fileName = "";
            string rutaimguser = "";
            if (size == 0)
            {
                rutaimguser = "img/user/default_user.png";
            }
            else
            {
                foreach (var formFile in UploadedFiles.Files)
                {
                    if (formFile.Length > 0)
                    {
                        fileName = usu.Num_Identificacion+"-"+formFile.FileName;
                        filePath = Path.Combine(ruta, fileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            formFile.CopyTo(fileStream);
                        }
                    }
                }
               // rutaimguser = filePath;
                rutaimguser = "img/user/" + fileName;
            }
            usu.RutaFoto_Perfil = rutaimguser;           
            NUsuario nusuario = new NUsuario();

            try
            {
                var result = nusuario.SetUsuario(usu);
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

        [Route("Usuario/GetUsuario")]
        public JsonResult GetId([FromBody] Usuario d)
        {
            NUsuario nusuario = new NUsuario();
            return Json(nusuario.GetUser(d));
        }

        [Route("Usuario/SetPhoto")]
        public JsonResult SetPhoto(IFormCollection UploadedFiles)
        {
            NUsuario nusuario = new NUsuario();
            Usuario usu = new Usuario();

            usu.IdUsuario = int.Parse( UploadedFiles["IdUsuario"].ToString());
            usu = nusuario.GetUser(usu);
            string imgactual = usu.RutaFoto_Perfil;
            string filePath = "";
            string ruta = Path.Combine(_env.WebRootPath, "img/user");
            long size = UploadedFiles.Files.Sum(f => f.Length);
            string fileName = "";
            string rutaimguser = "";
            if (size == 0)
            {
                rutaimguser = "img/user/default_user.png";
            }
            else
            {               
                string[] arrayruta = imgactual.Split("/");
                if (arrayruta[2].ToString() != "default_user.png")
                {
                    System.IO.File.Delete(Path.Combine(_env.WebRootPath, imgactual));
                }                             
                foreach (var formFile in UploadedFiles.Files)
                {
                    if (formFile.Length > 0)
                    {
                        fileName = usu.Num_Identificacion + "-" + formFile.FileName;
                        filePath = Path.Combine(ruta, fileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            formFile.CopyTo(fileStream);
                        }
                    }
                }               
                rutaimguser = "img/user/" + fileName;
            }
            usu.RutaFoto_Perfil = rutaimguser;
            var data= nusuario.UpdatePhoto(usu);
            var salida = new
            {
                estado = "OK",
                msg = "Datos Actualizados",
                img= rutaimguser

            };
            return Json(salida);
        }
        [Route("Usuario/UpdateUsuario")]
        public JsonResult UpdateUser([FromBody] Usuario d)
        {
            NUsuario nusuario = new NUsuario();
            var res = nusuario.UpdateUsuario(d);
            var data =new {
                estado = "OK",
                msg = "Datos Actualizados",
               
            };
            return Json(data);
        }
    }
}
