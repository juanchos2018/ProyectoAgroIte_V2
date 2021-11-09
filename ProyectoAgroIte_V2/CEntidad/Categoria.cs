using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace CEntidad
{
    public  class Categoria
    {
        public int IdCategoria { get; set; }
        public string Nombre { get; set; }
        [NotMapped]
        public Object Name { get; set; }

        public virtual ICollection<Producto> Producto { get; set; }
    }
}
