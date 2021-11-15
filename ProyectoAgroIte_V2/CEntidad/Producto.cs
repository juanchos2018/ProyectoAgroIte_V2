using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CEntidad
{
    public class Producto
    {
        [Key]
        public int IdProducto { get; set; }

        public int? IdCategoria { get; set; }

      
        [StringLength(100)]
        public string Nombre_Producto { get; set; }

        public decimal Precio_Referencial { get; set; }


        //public byte[] Imagenes_Producto { get; set; }

        public string RutaImagenes_Producto { get; set; }

        [StringLength(500)]
        public string Descripcion_Producto { get; set; }

        [StringLength(50)]
        public string Fecha_Inicio { get; set; }

        [StringLength(50)]
        public string Fecha_Fin { get; set; }

        [StringLength(500)]
        public decimal Cantidad_Producida { get; set; }

        [StringLength(500)]
        public decimal Cantidad_Minima { get; set; }

        [StringLength(500)]
        public decimal Cantidad_Maxima { get; set; }


        public int? IdUnidad_Volumen { get; set; }

        public int? Idfrecuencia { get; set; }

        public int? IdUsuario { get; set; }

        public int? IdAsociacion { get; set; }

        public virtual Categoria Categoria { get; set; }
        //[NotMapped]
        
    }
}
