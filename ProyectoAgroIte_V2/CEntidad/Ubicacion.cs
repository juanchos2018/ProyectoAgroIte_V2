using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
   public class Ubicacion
    {
        [Key]
        public int IdUbicacion { get; set; }

        public int IdAgricultor { get; set; }

        [Required]
        [StringLength(40)]
        public string latitud { get; set; }

        [Required]
        [StringLength(40)]
        public string longitud { get; set; }

        public DateTime? Fecha_Creacion { get; set; }

    }
}
