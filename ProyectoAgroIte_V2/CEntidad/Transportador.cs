using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
  public  class Transportador
    {
        [Key]
        public int IdTransportador { get; set; }

        public int? IdVehiculo { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(20)]
        public string Tefono { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        public int? Disponibilidad { get; set; }

    }
}
