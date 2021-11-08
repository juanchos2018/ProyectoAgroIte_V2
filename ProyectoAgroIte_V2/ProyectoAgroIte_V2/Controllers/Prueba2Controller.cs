using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoAgroIte_V2.Controllers
{
    public class Prueba2Controller : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
