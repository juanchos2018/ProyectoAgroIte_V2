using System;
using System.Collections.Generic;
using System.Text;

namespace CEntidad
{
    public  class Categoria
    {
        public int IdCategoria { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Producto> Producto { get; set; }
    }
}
