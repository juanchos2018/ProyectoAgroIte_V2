using CEntidad;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

namespace CDatos
{
  public  class ClsConexion:DbContext
    {
        public virtual DbSet<Actividad> Actividad { get; set; }

        public virtual DbSet<Categoria> Categoria { get; set; }

        public virtual DbSet<Frecuencia> Frecuencia { get; set; }

        public virtual DbSet<UnidadVolumen> UnidadVolumen { get; set; }

        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Producto> Producto { get; set; }

        // Nuevos Registros


        public virtual DbSet<Asociacion> Asociacion { get; set; }

        //UnidadVolumen
        protected override void OnConfiguring(DbContextOptionsBuilder optionBuilder)
        {
           
            //string connectionString = @"Data Source=" + Parametros.pc_Servidor + ";Initial Catalog=" + Parametros.pc_BaseDatos + ";User Id=" + Parametros.pc_Usuario + ";Password=" + Parametros.pc_Contrasena;
            string connectionString = @"server=" + Parametros.pc_Servidor + ";port=3306;user =" + Parametros.pc_Usuario + ";Password=" + Parametros.pc_Contrasena+";database="+Parametros.pc_BaseDatos;
            optionBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           // multi key
             modelBuilder.Entity<Actividad>()
                 .HasKey(c => new { c.IdActividad, });

            modelBuilder.Entity<Categoria>()
               .HasKey(c => new { c.IdCategoria, });

            modelBuilder.Entity<Frecuencia>()
             .HasKey(c => new { c.Idfrecuencia, });

            modelBuilder.Entity<UnidadVolumen>()
             .HasKey(c => new { c.IdUnidadVolumen, });

            modelBuilder.Entity<Usuario>()
            .HasKey(c => new { c.IdUsuario, c.IdActividad });

            modelBuilder.Entity<Producto>()
           .HasKey(c => new { c.IdProducto,c.IdCategoria, });

            // Nuevos Registros


            modelBuilder.Entity<Asociacion>()
             .HasKey(c => new { c.IdAsociacion });

        }
    }
}
