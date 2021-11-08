using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
   public class Vehiculos
    {
        [Key]
        public int IdVehiculo { get; set; }

        [StringLength(20)]
        public string Marca { get; set; }

        [StringLength(20)]
        public string Modelo { get; set; }

        [StringLength(20)]
        public string Año { get; set; }

        [StringLength(20)]
        public string Tipo { get; set; }

        [StringLength(20)]
        public string Placa { get; set; }

        public decimal? Capacidad { get; set; }

        public int? Estado { get; set; }

        public decimal? Precio { get; set; }

        [StringLength(100)]
        public string Unidad_Medida { get; set; }

        [StringLength(50)]
        public string Tipo_Carga { get; set; }

        [StringLength(10)]
        public string Carga_Total { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transportador> Transportador { get; set; }



    }
}
