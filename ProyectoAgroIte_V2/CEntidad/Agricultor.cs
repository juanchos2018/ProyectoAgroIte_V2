using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
  public  class Agricultor
    {
        [Key]
        public int IdAgricultor { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(50)]
        public string Apellidos { get; set; }

        public int? Tipo_Documento { get; set; }

        [StringLength(12)]
        public string Num_Identificacion { get; set; }

        [StringLength(100)]
        public string Foto_Perfil { get; set; }

        [StringLength(9)]
        public string Celular { get; set; }

        [StringLength(200)]
        public string Direccion { get; set; }

        [StringLength(150)]
        public string Correo { get; set; }

        public int? Estado { get; set; }

     

        public int? IdAsociacion { get; set; }

        public virtual Asociacion Asociacion { get; set; }


        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<Pedido> Pedido { get; set; }


    }
}
