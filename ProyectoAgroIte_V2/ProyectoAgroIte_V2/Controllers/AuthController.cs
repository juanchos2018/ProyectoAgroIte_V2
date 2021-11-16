using CEntidad;
using CNegocio;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoAgroIte_V2.Controllers
{
    public class AuthController : Controller
    {
         private readonly IConfiguration _configuration;
        public AuthController(IConfiguration configuration)
        {
            _configuration = configuration;
            NConexion.Conectar(
                _configuration.GetConnectionString("Server"),
                _configuration.GetConnectionString("BaseDaDatos"),
                _configuration.GetConnectionString("User"),
                _configuration.GetConnectionString("Password")
            );
        }


        [HttpPost]
        [AllowAnonymous]
        [Route("Auth/Login")]
        public IActionResult Login([FromBody] Usuario login)
        {
            IActionResult response = Unauthorized();
            Usuario user = AuthenticateUser(login);
            if (user != null)
            {
                //Roles
                NActividad Roles = new NActividad();
                string activida = Roles.GetActividad(user.IdActividad);

                var tokenString = GenerateJWTToken(user, activida);
                response = Ok(new
                {
                    token = tokenString,
                    userDetails = new
                    {                        
                        IdUsuario = user.IdUsuario,
                        Nombre = user.Nombres,  
                        UrlFoto=user.RutaFoto_Perfil
                    },
                });
            }
            return response;
        }
        Usuario AuthenticateUser(Usuario loginCredentials)
        {
            NUsuario usuario = new NUsuario();
            Usuario user = usuario.GetLogin(loginCredentials);
            return user;
        }
        string GenerateJWTToken(Usuario userInfo, string activida)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:SecretKey"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);  

            string fullname = "";
            if (userInfo.Nombres == null)
            {
                fullname = "Usuario S.N.";
            }
            else
            {
                fullname = userInfo.Nombres.ToString();
            }

            var claims = new[]
            {
             ///   new Claim(JwtRegisteredClaimNames.Sub, userInfo.Alias),
                new Claim("Id", userInfo.IdUsuario.ToString()),
                new Claim("Nombre", fullname),
                new Claim("Img", userInfo.RutaFoto_Perfil),
                new Claim("Actividad",activida),               
                new Claim(ClaimTypes.Role,activida),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            };

            var token = new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(480),
                signingCredentials: credentials
            );
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
