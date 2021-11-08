using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CEntidad
{
   public class Asociacion
    {
        [Key]
        public int IdAsociacion { get; set; }

        [StringLength(15)]
        public string Ruc { get; set; }

        [StringLength(150)]
        public string Razon_Social { get; set; }

        [StringLength(250)]
        public string Descripcion { get; set; }

        [StringLength(50)]
        public string Departamento { get; set; }

        [StringLength(50)]
        public string Provincia { get; set; }

        [StringLength(100)]
        public string Direccion { get; set; }

        //  public int? IdAgricultor { get; set; }

        [StringLength(9)]
        public string Telefono { get; set; }

        [StringLength(150)]
        public string Representante { get; set; }

        public int? Integrantes { get; set; }

        [NotMapped]
        public Object Name { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<Producto> Producto { get; set; }


        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<Agricultor> Agricultor { get; set; }
    }
}
