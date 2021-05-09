using System;
using System.Collections.Generic;
using System.Text;

namespace CEntidad
{
   public class Actividad
    {
        public int IdActividad { get; set; }
        public string Nombre { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Usuario> Usuario { get; set; }
    }
}
