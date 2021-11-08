using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
   public class Pago
    {
        [Key]
        public int IdPago { get; set; }

        [StringLength(50)]
        public string Num_Transaccion { get; set; }

        public int? IdUsuario { get; set; }

        public decimal? Cantidad { get; set; }

        [StringLength(50)]
        public string Fecha { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
