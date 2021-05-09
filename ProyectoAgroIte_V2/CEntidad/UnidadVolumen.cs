using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
   public class UnidadVolumen
    {
        [Key]
        public int IdUnidadVolumen { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }
    }
}
