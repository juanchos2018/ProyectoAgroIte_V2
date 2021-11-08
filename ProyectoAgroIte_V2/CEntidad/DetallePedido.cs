using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
   public class DetallePedido
    {
        [Key]
        public int IdDetallePedido { get; set; }

        public int? IdPedido { get; set; }

        public int? IdProducto { get; set; }

        public decimal? Cantidad { get; set; }

        public decimal? Subtotal { get; set; }

        public virtual Pedido Pedido { get; set; }

        public virtual Producto Producto { get; set; }
    }
}
