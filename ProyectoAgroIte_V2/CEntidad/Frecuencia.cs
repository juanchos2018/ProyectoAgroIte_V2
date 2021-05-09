using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
    public class Frecuencia
    {
        [Key]
        public int Idfrecuencia { get; set; }

        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }
    }
}
