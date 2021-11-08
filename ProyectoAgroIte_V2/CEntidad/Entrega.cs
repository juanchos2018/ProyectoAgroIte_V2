using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
  public  class Entrega
    {
        [Key]
        public int IdEntrega { get; set; }

        public int? IdVenta { get; set; }

        [StringLength(11)]
        public string Fecha_Envio { get; set; }

        [StringLength(11)]
        public string Fechar_Entrega { get; set; }

        [StringLength(100)]
        public string Detalles { get; set; }

        [StringLength(100)]
        public string Direccion { get; set; }

        [StringLength(50)]
        public string Fecha_Pedido { get; set; }

        public int? Estado { get; set; }

        public virtual Pedido  Pedido { get; set; }

    }
}
