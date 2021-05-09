using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace CEntidad
{
    public   class Finca
    {
        [Key]
        public int IdFinca { get; set; }

        [StringLength(50)]
        public string Nombre { get; set; }

        [StringLength(50)]
        public string Pais { get; set; }

        [StringLength(100)]
        public string Departamento { get; set; }

        [StringLength(100)]
        public string Municipio { get; set; }

        [StringLength(100)]
        public string Via_Acceso { get; set; }

        [StringLength(100)]
        public string Fuente_Agua { get; set; }

        [StringLength(50)]
        public string Almacen_Agua { get; set; }

        public int? IdUsuario { get; set; }

        public int? IdUnidadExtension { get; set; }
    }
}
