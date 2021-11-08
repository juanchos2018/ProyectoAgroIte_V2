using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
  public  class Pedido
    {

        [Key]
        public int IdPedido { get; set; }

        [StringLength(50)]
        public string Fecha { get; set; }

        public int? Estado { get; set; }

        public int? IdUsuario { get; set; }

        public decimal? Total { get; set; }

        public decimal? IGV { get; set; }

        public int IdTransportador { get; set; }

        public string Punto_Entrega { get; set; }

        public int? IdAgricultor { get; set; }
        [StringLength(20)]
        public string Latitud { get; set; }

        [StringLength(20)]
        public string Longitud { get; set; }

        public virtual Agricultor Agricultor { get; set; }


        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<Compra> Compra { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetallePedido> DetallePedido { get; set; }

        public virtual Transportador Transportador { get; set; }
        
        public virtual Usuario Usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Venta> Venta { get; set; }


    }
}
