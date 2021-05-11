using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CEntidad
{
   public class Usuario
    {
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public Usuario()
        //{
        //    Finca = new HashSet<Finca>();
        //    Pago = new HashSet<Pago>();
        //    Producto = new HashSet<Producto>();
        //}

        [Key]
        public int IdUsuario { get; set; }


        [NotMapped]
        public int IdActividad { get; set; }

        [StringLength(500)]
        public string Nombres { get; set; }

        [StringLength(500)]
        public string Apellidos { get; set; }

        public int? Tipo_Documento { get; set; }

        [StringLength(10)]
        public string Num_Identificacion { get; set; }

       // public byte[] Foto_Perfil { get; set; }

        public string RutaFoto_Perfil { get; set; }

        [StringLength(500)]
        public string Celular { get; set; }

        [StringLength(500)]
        public string Direccion { get; set; }

        [StringLength(500)]
        public string Correo { get; set; }

        //[Required]
        [StringLength(500)]
        public string Alias { get; set; }

        //[Required]
        [StringLength(500)]
        public string Contraseña { get; set; }

        [StringLength(500)]
        public string Organizacion { get; set; }

        [StringLength(500)]
        public string Descripcion { get; set; }

        public virtual Actividad Actividad { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Finca> Finca { get; set; }
    }
}
