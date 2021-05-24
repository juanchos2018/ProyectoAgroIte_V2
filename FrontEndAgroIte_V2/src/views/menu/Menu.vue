<template>
  <div class="">
    <b-container class="bv-example-row">
      <b-row>
        <!--   <div  class="d-md-none" >
                <b-button-group>
                <b-button>Button 1</b-button>
                <b-button>Button 2</b-button>
                <b-button>Button 3</b-button>
                </b-button-group>
            </div> -->
        <div class="d-md-down-none">
          <b-card>
            <b-list-group>
              <center>
                <img
                  :src="ApiRutaNetCore + RutaMIFoto"
                  class="img1"
                  alt="Avatar"
               
                /><br />
                <br />
                <h5>{{ NombreUsuario }}</h5>
                 <b-spinner variant="primary" v-if="loanding" label="Spinning"></b-spinner>
                    <div >
                   
                   <!-- <input
                      type="file"
                      id="files"
                      ref="files"
                      name="myfile"
                      v-on:change="handleFileUploads"
                    />-->
               <label data-v-3a42fd9f="" data-v-10d1d8f2="" label="file" class="button file-input">
            <svg data-v-3a42fd9f="" width="30px" height="30px" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload-cloud">
            <polyline data-v-3a42fd9f="" points="16 16 12 12 8 16">
              </polyline>
              <line data-v-3a42fd9f="" x1="12" y1="12" x2="12" y2="21"></line>
              <path data-v-3a42fd9f="" d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"></path>
              <polyline data-v-3a42fd9f="" points="16 16 12 12 8 16"></polyline></svg>
                <input data-v-3a42fd9f="" id="file2" type="file"   ref="file2"  @change="EditPhoto" style="display: none;">          
          </label>   
                  </div>
              </center>
              <br />
              <b-list-group-item href="#" class="flex-column align-items-start"  @click="MostrarAgregarProducto">
                <div class="d-flex w-100 justify-content-between">
                  <h4 class="mb-1">Agregar Productos</h4>  
               
                </div>               
              </b-list-group-item>

              <b-list-group-item href="#" class="flex-column align-items-start active"   @click="MosrarMisProductos">
                <div class="d-flex w-100 justify-content-between">
                  <h4 class="mb-1">Mis Productos</h4>
               
                </div>               
              </b-list-group-item>
              <b-list-group-item href="#" class="flex-column align-items-start"  @click="MostrarMiPerfil">
                <div class="d-flex w-100 justify-content-between">
                  <h4 class="mb-1">Mis Datos</h4>
                
                </div>              
              </b-list-group-item>
            </b-list-group>
          </b-card>
        </div>
        <b-col>
          <div v-if="MisProductos">
            <div class="row my-4">
              <div class="col-12">
                <h2 class="noo-sh-title">Mis Productos</h2>
              </div>
              <div
                class="col-sm-6 col-lg-4"
                v-for="item in itemMisProductos"
                :key="item.key"
              >
                <div class="hover-team">
                  <div class="our-team">
                    
                       <b-img thumbnail fluid   v-bind:src="ApiRutaNetCore + item.rutaImagen" alt="Image 1"></b-img>

                    <div class="team-content">
                      <h5 class="title">
                        <b
                          ><i class="fa fa-fire"></i>&nbsp;
                          {{ item.nombre_Producto }}</b
                        >
                      </h5>

                    </div>
                    <ul class="social">
                      <li>
                        <a href="#" @click="ViewEditProduct(item.idProducto)">    <b-icon icon="pencil-fill"></b-icon></a>
                      </li>
                      <li>
                        <a href="#" @click="MessageDelete(item.idProducto)"> <b-icon icon="trash2-fill"></b-icon></a>
                      </li>
                    </ul>
                    <div class="icon">
                      <b-icon  font-scale="2" icon="plus"></b-icon>
                    </div>
                  </div>
                  <div class="team-description">
                    <p>
                      <b>&nbsp;{{ item.Descripcion_Producto }}</b>
                    </p>
                  </div>
                  <hr class="my-0" />
                </div>
              </div>
            </div>
          </div>

          <div v-if="AgregarProducto">
            <b-card>
              <div class="col-12">
                <h4 class="noo-sh-title">Agregar Producto</h4>
              </div>
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
                <b-form-group label="Precio:" class="col-md-4">
                  <b-form-input
                    type="number"
                    v-model="producUser.Precio_Referencial"
                    required
                  ></b-form-input>
                </b-form-group>
                <b-form-group label="Descropcion Producto:" class="col-md-8">
                  <b-form-input
                    type="text"
                    v-model="producUser.Descripcion_Producto"
                    required
                  ></b-form-input>
                </b-form-group>
              </div>

              <div class="form-row">
                <b-form-group label="Cantidad Producida:" class="col-md-4">
                  <b-form-input
                    type="number"
                    v-model="producUser.Cantidad_Producida"
                    required
                  ></b-form-input>
                </b-form-group>
                <b-form-group label="Fecha Inicio:" class="col-md-4">
                  <b-form-input
                    type="date"
                    v-model="producUser.Fecha_Inicio"
                    required
                  ></b-form-input>
                </b-form-group>

                <b-form-group label="Fecha Fin:" class="col-md-4">
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
              <div v-if="producUser.IdProducto==''">
                    <b-button
                type="button"
                variant="primary"
                @click="RegistrarProducto" >
                <b-spinner v-if="loanding" small type="grow"></b-spinner>
                Registrar</b-button
              >
             
              </div>
              <div v-else>
                      <b-button
                type="button"
                variant="primary"
                @click="MessageUpdate" >
                <b-spinner v-if="loanding" small type="grow"></b-spinner>
                Modificar</b-button
              >
                 
              </div>
            
            </b-card>
          </div>

          <div v-if="VerMiPerfil">
               <div class="col-12">
                   <br>
                <h4 class="noo-sh-title">Mis Datos</h4>
              </div>
            <div class="form-row">
              <b-form-group label="Nombre:" class="col-md-4">
                <b-form-input
                  v-model="Nombres"
                  type="text"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group label="Apellido:" class="col-md-4">
                <b-form-input v-model="Apellidos" required></b-form-input>
              </b-form-group>

              <b-form-group label="Correo:" class="col-md-4">
                <b-form-input
                  v-model="Correo"
                  type="email"
                  required
                ></b-form-input>
              </b-form-group>
            </div>

            <div class="form-row">
              <b-form-group label="Direccion:" class="col-md-4">
                <b-form-input
                  v-model="Direccion"
                  type="text"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group label="Actividad:" class="col-md-2">
                <b-form-input
                  v-model="Actividad"
                  type="email"
                  required
                ></b-form-input>
              </b-form-group>

              <b-form-group label="Tipo Documeto:" class="col-md-2">
                <b-form-select
                  :options="itemTipoDocumento"
                  v-model="Tipo_Documento"
                  class="mb-2 mr-sm-2 mb-sm-0"
                ></b-form-select>
              </b-form-group>
              <b-form-group label="Numero Documento:" class="col-md-4">
                <b-form-input
                  type="text"
                  v-model="Num_Identificacion"
                  required
                ></b-form-input>
              </b-form-group>
            </div>

            <div class="form-row">
             
              <b-form-group label="Usuario:" class="col-md-4">
                <b-form-input
                  v-model="Alias"
                  type="text"
                  required
                ></b-form-input>
              </b-form-group>
              <b-form-group label="Contraseña:" class="col-md-4">
                <b-form-input
                  v-model="Contrasena"
                  type="password"
                  required
                ></b-form-input>
              </b-form-group>
                <b-form-group label="Celular:" class="col-md-4">
                <b-form-input
                  v-model="Celular"
                  type="number"
                  required
                ></b-form-input>
              </b-form-group>
            </div>

            <div class="form-row">
            

              <b-form-group label="Organizacion:" class="col-md-4">
                <b-form-input
                  v-model="Organizacion"
                  type="text"
                  required
                ></b-form-input>
              </b-form-group>
            </div>
            <b-button type="button" variant="primary" @click="MessageUpdate2">
              <b-spinner v-if="loanding" small type="grow"></b-spinner>
              Guardar</b-button
            >
            
          </div>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
import axios from "axios";
import decode from "jwt-decode";

export default {
  data() {
    return {
      MisProductos: false,
      AgregarProducto: true,
      VerMiPerfil: false,
      NewProduct:true,
      itemCategorias: [],
      itemUnidadVolumen: [],
      itemFrecuecia: [],
      itemMisProductos: [],
      producUser:{
        IdProducto:'',
        IdCategoria: "",    
        Nombre_Producto: "",
        Precio_Referencial: "",
        Descripcion_Producto: "",
        Fecha_Inicio: "",
        Fecha_Fin: "",
        Cantidad_Producida: "",
        IdUnidad_Volumen: "",
        Idfrecuencia: "",
        IdUsuario: null,
        RutaImagenes_Producto:''
      },
      files: [],
      file: "",
      url: null,
      loanding: false,
      ApiRutaNetCore: "",
      NombreUsuario: "",
      Token: "",
      RutaMIFoto: "",
      DatosUsuario: "",
      //datos user
      itemTipoDocumento: [],
      itemActividad: [],
      Actividad:'',
      Nombres:'',
      Apellidos: "",
      Tipo_Documento: "",
      Num_Identificacion: "",
      Celular: "",
      Direccion: "",
      Correo: "",
      IdActividad: "",
      Alias: "",
      Contrasena: "",
      Organizacion: "",
      Descripcion: "",
   
    };
  },
  created() {
    this.ListarCategorias();
    this.ListarUnidadVolumen();
    this.ListarFrecuencia();
    this.ListarActividad();
    this.Documentos();

    this.ApiRutaNetCore = this.RutaNetCore;
  },
  mounted() {
    if (localStorage.token) this.Token = localStorage.token;
    this.datosUsuario = decode(this.Token);
   
    this.NombreUsuario = this.datosUsuario.Nombre;
    this.RutaMIFoto = this.datosUsuario.Img;
    this.producUser.IdUsuario=this.datosUsuario.Id
  },
  methods: {
    MosrarMisProductos() {
      this.MisProductos = true;
      this.VerMiPerfil = false;
      this.AgregarProducto = false;
      this.ListarMisProductos();
    },
    MostrarAgregarProducto() {
      this.CleanControl()
      this.NewProduct=true;
      this.MisProductos = false;
      this.VerMiPerfil = false;
      this.AgregarProducto = true;
    },
    MostrarMiPerfil() {
       this.MisProductos = false;
       this.AgregarProducto = false;
       this.VerMiPerfil = true;
       this.MisDatosPerosnales();
    }, 
    MisDatosPerosnales(){
          let me = this;          
         axios({
              method: 'post',
              url: this.RutaNetCore+'Usuario/GetUsuario',
              data: {
                IdUsuario:parseInt(me.producUser.IdUsuario),               
              }
          })
          .then(response => {        
            console.log(response.data)                
                me.Correo=response.data.correo; 
                me.Nombres=response.data.nombres  
                me.Apellidos=response.data.apellidos  
                me.Celular=response.data.celular    
                me.Alias=response.data.alias     
                me.Direccion=response.data.direccion       
                me.Num_Identificacion=response.data.num_Identificacion

                let objIndex = me.itemActividad.findIndex(obj=> obj.value ==response.data.idActividad);
                me.Actividad= me.itemActividad[objIndex].text;
                me.Tipo_Documento=response.data.tipo_Documento
                me.Organizacion=response.data.organizacion
              })  
    },
    EditarUser(){
        let me = this;
        let data={IdUsuario:parseInt( me.producUser.IdUsuario),
        Nombres: me.Nombres,
        Apellidos:  me.Apellidos,
        Alias: me.Alias,
        Correo: me.Correo,
        Direccion:me.Direccion,
        Celular:me.Celular}
        axios
        .post(this.RutaNetCore + "Usuario/UpdateUsuario",data)
        .then((response) => {
         console.log(response.data);
          me.Mensaje(); 
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    EditPhoto(){
              this.loanding = true;
              this.file = this.$refs.file2.files[0];
              //this.path = URL.createObjectURL(this.$refs.file.files[0]);
              let formData = new FormData();
              formData.append('file', this.file);
              formData.append('IdUsuario', parseInt(this.IdUsuario));                         
              axios.post(this.RutaNetCore + 'Usuario/SetPhoto', formData,
                 {
                  headers: {
                    'Content-Type': 'multipart/form-data'
                  }
              })
              .then(function (response) {
                  this.loanding = false;
                  if(!response.data){
                    alert('File not uploaded.');                    
                  }else{
                    this.Mensaje();
                   }             
              })
              .catch(function (error) {
                  console.log(error);
                  this.loanding = false;
          });
    },
    ListarCategorias() {
      let me = this;
      var cate = [];
      axios
        .get(this.RutaNetCore + "Categoria/GetCategoria")
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
    ListarUnidadVolumen() {
      let me = this;
      var uni = [];
      axios
        .get(this.RutaNetCore + "UnidadVolumen/GetUnidadVolumen")
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
    ListarFrecuencia() {
      let me = this;
      var uni = [];
      axios
        .get(this.RutaNetCore + "Frecuencia/GetFrecuencia")
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
    ListarMisProductos() {
      let me = this;
      let Usuario = {
        IdUsuario:parseInt( me.producUser.IdUsuario),
      };
      axios
        .post(this.RutaNetCore + "Producto/GetMyProducto", Usuario, {
          emulateJSON: true,
        })
        .then((response) => {
         
          me.itemMisProductos = response.data;
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
    RegistrarProducto() {
      this.loanding = true;
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

      let config = {
        header: {
          "Content-Type": "multipart/form-data",
        },
      };
      axios
        .post(this.RutaNetCore + "Producto/SetProducto", data, config)
        .then((response) => {       
          if (response.status == 200) {
            this.Confirmacion(response.data.mensaje);
            this.CleanControl();
          }
          this.loanding = false;
        })
        .catch(function(error) {
          console.log(error);
          this.loanding = false;
        });
    },
    Confirmacion(mensaje) {
      this.$swal({
        position: "top-end",
        icon: "success",
        title: mensaje,
        text: "texto",
        showConfirmButton: false,
        timer: 3000,
      });
    },
    Mensaje(){
        this.$Swal.fire('Se ha Modificado')
    },
    Documentos() {
      var Tipo_Documento = 0;
      var nombreDocumento = "Dni";
      var Tipo_Documento2 = 1;
      var nombreDocumento2 = "Ruc";
      this.itemTipoDocumento.push(
        { text: nombreDocumento, value: Tipo_Documento },
        { text: nombreDocumento2, value: Tipo_Documento2 }
      );
    },
    ListarActividad() {
      let me = this;
      var actividad = [];
      axios
        .get(this.RutaNetCore + "Actividad/GetActividad")
        .then((response) => {        
          actividad = response.data;
          actividad.map(function(x) {
            me.itemActividad.push({ text: x.nombre, value: x.idActividad });
          });
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    ViewEditProduct(id){      
           let me =this;      
            me.MostrarAgregarProducto()
            //me.NewProduct=false;
            let data={IdProducto:id}                       
            axios.post(me.RutaNetCore + 'Producto/GetProducto',data)
            .then(function (response) {
              console.log(response.data)    

              me.producUser.IdProducto= response.data.idProducto
              me.producUser.IdCategoria= response.data.idCategoria 
              me.producUser.Nombre_Producto= response.data.nombre_Producto 
              me.producUser.Descripcion_Producto= response.data.descripcion_Producto 
              me.producUser.Precio_Referencial= response.data.precio_Referencial 
              me.producUser.Cantidad_Producida= response.data.cantidad_Producida 
              me.producUser.Fecha_Inicio= response.data.fecha_Inicio       
              me.producUser.Fecha_Fin= response.data.fecha_Fin 
              me.producUser.IdUnidad_Volumen= response.data.idUnidad_Volumen 
              me.producUser.Idfrecuencia= response.data.idfrecuencia 
              me.producUser.RutaImagenes_Producto= response.data.rutaImagenes_Producto 
              
            })
            .catch(function (error) {
                console.log(error);                
        });
    },
    MessageUpdate2(){
          this.$swal({
              title: 'Desea Editar ?',                
              showCancelButton: true,
              confirmButtonText: `Si`,                  
                }).then((result) => {                  
                if (result.isConfirmed) {
                    this.EditarUser();                    
                } else if (result.isDenied) {
                  this.$swal('No Editado', '', 'info')
              }
        })
    },
    MessageUpdate(){
          this.$swal({
              title: 'Desea Editar ?',                
              showCancelButton: true,
              confirmButtonText: `Si`,                  
                }).then((result) => {                  
                if (result.isConfirmed) {
                    this.UpdateProducto();                    
                } else if (result.isDenied) {
                  this.$swal('No Editado', '', 'info')
              }
        })
    },
    MessageDelete(id){
         this.$swal({
              title: 'Desea Eliminar ?',                
              showCancelButton: true,
              confirmButtonText: `Si,Eliminar`,                  
                }).then((result) => {                  
                if (result.isConfirmed) {
                    this.DelteProduct(id)                 
                } else if (result.isDenied) {
                  this.$swal('No Eliminado', '', 'info')
              }
        })
    },
    UpdateProducto(){
      this.loanding = true;
      let data = new FormData();
      for (var i = 0; i < this.files.length; i++) {
        let file = this.files[i];
        data.append("files[" + i + "]", file);
      }
      data.append("IdProducto", this.producUser.IdProducto);
      data.append("RutaImagenes_Producto", this.producUser.RutaImagenes_Producto);
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

      let config = {
        header: {
          "Content-Type": "multipart/form-data",
        },
      };
      axios
        .post(this.RutaNetCore + "Producto/UpdateProducto", data, config)
        .then((response) => {       
          if (response.status == 200) {
            this.Confirmacion(response.data.mensaje);
            this.CleanControl();
          }
          this.loanding = false;
        })
        .catch(function(error) {
          console.log(error);
          this.loanding = false;
        });
    },
    DelteProduct(id){
      let me = this;
      let json = {
        IdProducto:id,
        IdUsuario:parseInt( me.producUser.IdUsuario),
      };
      axios
        .post(this.RutaNetCore + "Producto/DeleteProducto", json, {
          emulateJSON: true,
        })
        .then((response) => {
         
          alert(response.data)
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    CleanControl(){
        let me =this;
         me.producUser.IdProducto=""
         me.producUser.IdCategoria= ""    
         me.producUser.Nombre_Producto= ""
         me.producUser.Precio_Referencial= ""
         me.producUser.Descripcion_Producto= ""
         me.producUser.Fecha_Inicio=""
         me.producUser.Fecha_Fin=""
         me.producUser.Cantidad_Producida= ""
         me.producUser.IdUnidad_Volumen= ""
         me.producUser.Idfrecuencia=""      
         me.files=[] 
    }
  },
};
</script>

<style lang="css">
.img1 {
  border-radius: 50%;
  width:100px;
  height:100px;
}
.imgitem{
  width: 100%;
  max-width: 400px;
  height: auto; 
}


.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  outline: none;
  background: white;
  cursor: inherit;
  display: block;
}

</style>
