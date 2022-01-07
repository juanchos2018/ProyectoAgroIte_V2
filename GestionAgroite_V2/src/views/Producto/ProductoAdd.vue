<template>


<b-container>
  <div>
      <br><br><br>
   <b-card
        class="mt-3"
        header="Agregar Producto"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
    <form action="">   

            <div class="form-row">
                <b-form-group label="Categoria:" class="col-md-4">
                  <b-form-select
                    :options="itemCategorias"
                    v-model="producUser.IdCategoria"
                    id="inline-form-custom-select-pref"
                    class="mb-2 mr-sm-2 mb-sm-0"
                  ></b-form-select>
                </b-form-group>

                <b-form-group label="Nombre de Producto:" class="col-md-8">
                  <b-form-input
                    v-model="producUser.Nombre_Producto"
                    required
                  ></b-form-input>
                </b-form-group>
              </div>

              <div class="form-row">

                   <b-form-group label="Asociacion:" class="col-md-3">
                  <b-form-select
                    :options="itemAsociacion"
                    v-model="producUser.IdAsociacion"
                    id="inline-form-custom-select-pref"
                    class="mb-2 mr-sm-2 mb-sm-0"
                  ></b-form-select>
                </b-form-group>
                <b-form-group label="Precio:" class="col-md-2">
                  <b-form-input
                    
                    v-model="producUser.Precio_Referencial"
                    required
                  ></b-form-input>
                </b-form-group>
                <b-form-group label="Descropcion Producto:" class="col-md-7">
                  <b-form-input
                    type="text"
                    v-model="producUser.Descripcion_Producto"
                    required
                  ></b-form-input>
                </b-form-group>
              </div>

              <div class="form-row">

                <b-form-group label="Cantidad Producida:" class="col-md-2">
                  <b-form-input
                    type="number"
                    v-model="producUser.Cantidad_Producida"
                    required
                  ></b-form-input>
                </b-form-group>
              <b-form-group label="Cantidad Min:" class="col-md-2">
                  <b-form-input
                    type="number"
                    v-model="producUser.Cantidad_Minima"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group label="Cantidad Max:" class="col-md-2">
                  <b-form-input
                    type="number"
                    v-model="producUser.Cantidad_Maxima"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group label="Fecha Inicio:" class="col-md-3">
                  <b-form-input
                    type="date"
                    v-model="producUser.Fecha_Inicio"
                    required
                  ></b-form-input>
                </b-form-group>
                <b-form-group label="Fecha Fin:" class="col-md-3">
                  <b-form-input
                    type="date"
                    v-model="producUser.Fecha_Fin"
                    required
                  ></b-form-input>
                </b-form-group>
              </div>

              <div class="form-row">
                <b-form-group label="Unidad Medioda:" class="col-md-4">
                  <b-form-select
                    :options="itemUnidadVolumen"
                    v-model="producUser.IdUnidad_Volumen"
                    id="inline-form-custom-select-pref"
                    class="mb-2 mr-sm-2 mb-sm-0"
                  ></b-form-select>
                </b-form-group>
                <b-form-group label="Frecuenca:" class="col-md-4">
                  <b-form-select
                    :options="itemFrecuecia"
                    v-model="producUser.Idfrecuencia"
                    id="inline-form-custom-select-pref"
                    class="mb-2 mr-sm-2 mb-sm-0"
                  ></b-form-select>
                </b-form-group>
                <b-form-group label="imagen:" class="col-md-4">                

                  <span class="btn btn-primary btn-file">
                  Imagen<input   type="file"
                        id="files"
                        ref="files"
                        name="myfile"
                        v-on:change="handleFileUploads">
                    </span>
                </b-form-group>
              </div>
              
              <div>
                    <b-button
                type="button"
                variant="primary"
                @click="RegistrarProducto" >
             
                Registrar</b-button
              >             
        </div>
      
      <hr />
      <div>
      
      </div>
    </form>
     </b-card>
  </div>

  </b-container>
</template>

<script>
import axios from  'axios';

export default {
  data() {
    return {
      TipoDocumentos: [],
      itemActividad: [],
      itemTipoDocumento:[],
     itemCategorias: [],
      itemUnidadVolumen: [],
      itemFrecuecia: [],
     itemAsociacion:[],
     producUser:{
        IdProducto:0,
        IdCategoria: "",    
        Nombre_Producto: "",
        Precio_Referencial: "",
        Descripcion_Producto: "",
        Fecha_Inicio: "",
        Fecha_Fin: "",
        Cantidad_Producida: 0,
        Cantidad_Minima:0,
        Cantidad_Maxima:0,
        IdUnidad_Volumen: "",
        Idfrecuencia: "",
        IdUsuario: 16,
        RutaImagenes_Producto:'',
        IdAsociacion:0
      },
      loanding: false,
      files: [],
      file: "",
      url: null,
      show:false
    };
  },
  mounted() {
  
    this.ListarCategorias();
    this.ListarUnidadVolumen();
    this.ListarFrecuencia();
    this.ListarAsociacion();
  },
  created() {
      this.itemTipoDocumento.push({text:"DNI",value:0},{text:"RUC",value:1})
  },
  methods: {   
     RegistrarProducto(){
         ///  this.show = true;
          //  this.loanding = true;
            let data = new FormData();
            for (var i = 0; i < this.files.length; i++) {
                let file = this.files[i];
                data.append("files[" + i + "]", file);
            }
            data.append("IdCategoria", this.producUser.IdCategoria);
            data.append("Nombre_Producto", this.producUser.Nombre_Producto);
            data.append("Precio_Referencial", this.producUser.Precio_Referencial);
            data.append("Descripcion_Producto", this.producUser.Descripcion_Producto);
            data.append("Fecha_Inicio", this.producUser.Fecha_Inicio);
            data.append("Fecha_Fin", this.producUser.Fecha_Fin);
            data.append("Cantidad_Producida", this.producUser.Cantidad_Producida);
            data.append("IdUnidad_Volumen", this.producUser.IdUnidad_Volumen);
            data.append("Idfrecuencia", this.producUser.Idfrecuencia);
            data.append("IdUsuario", this.producUser.IdUsuario);


            data.append("Cantidad_Minima", this.producUser.Cantidad_Minima);
            data.append("Cantidad_Maxima", this.producUser.Cantidad_Maxima);
            data.append("IdAsociacion", this.producUser.IdAsociacion);

            let config = {
                header: {
                "Content-Type": "multipart/form-data",
                },
            };
            axios
                .post("Producto/SetProducto2", data, config)
                .then((response) => {       
                if (response.status == 200) {
                    this.Confirmacion(response.data.mensaje);
                    this.CleanControl();
                }
              //  this.loanding = false;
                })
                .catch(function(error) {
                console.log(error);
             ///   this.loanding = false;
                });
        },
        ListarFrecuencia() {
            let me = this;
            var uni = [];
            axios
                .get("Frecuencia/GetFrecuencia")
                .then((response) => {
                uni = response.data;
                uni.map(function(x) {
                    me.itemFrecuecia.push({ text: x.nombre, value: x.idfrecuencia });
                });
                })
                .catch(function(error) {
                console.log(error);
                });
         },
         ListarAsociacion(){
            let me = this;
            var uni = [];
            axios
                .get("Asociacion/GetAsociacionAll")
                .then((response) => {
                uni = response.data;
                uni.map(function(x) {
                    me.itemAsociacion.push({
                    text: x.razon_Social,
                    value: x.idAsociacion,
                    });
                });
                })
            .catch(function(error) {
            console.log(error);
            });
         },
         ListarUnidadVolumen() {
            let me = this;
            var uni = [];
            axios
                .get( "UnidadVolumen/GetUnidadVolumen")
                .then((response) => {
                uni = response.data;
                uni.map(function(x) {
                    me.itemUnidadVolumen.push({
                    text: x.nombre,
                    value: x.idUnidadVolumen,
                    });
                });
                })
            .catch(function(error) {
            console.log(error);
            });
        },

         ListarCategorias() {
            let me = this;
            var cate = [];
            axios
            .get("Categoria/GetCategoria")
            .then((response) => {
            cate = response.data;
            cate.map(function(x) {
                me.itemCategorias.push({ text: x.nombre, value: x.idCategoria });
            });
            })
            .catch(function(error) {
            console.log(error);
            });
        },
         handleFileUploads(e) {
            this.files = this.$refs.files.files;
            const file = e.target.files[0];
            this.url = URL.createObjectURL(file);
          },
        Confirmacion(){
          this.$swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Registrado',
            showConfirmButton: false,
            timer: 1500
            })
        }  


  },
};
</script>

<style></style>
