<template>
    <div class="">

        <b-container class="bv-example-row">           
        <b-row >
           <!--   <div  class="d-md-none" >
                <b-button-group>
                <b-button>Button 1</b-button>
                <b-button>Button 2</b-button>
                <b-button>Button 3</b-button>
                </b-button-group>
            </div> -->
            <div class="d-md-down-none">            
            <b-card >
           <b-list-group>
                 <center>
                 <img src="https://placekitten.com/300/300" class="img1" alt="Avatar">
                 </center>
              <br>
             <b-list-group-item href="#" class="flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Agregar Productos</h5>
        <small>3 days ago</small>
        </div>
        <b-button variant="outline-primary" style="float:right" @click="MostrarAgregarProducto" >Mostrar</b-button>    
     </b-list-group-item>

    <b-list-group-item href="#" class="flex-column align-items-start" >
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Mis Productos</h5>
        <small class="text-muted">3 days ago</small>
        </div>
        <b-button variant="outline-primary" style="float:right" @click="MosrarMisProductos" >Mostrar</b-button>    
    </b-list-group-item>

    <b-list-group-item href="#"  class="flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Disabled List group item</h5>
        <small class="text-muted">3 days ago</small>
        </div>
  <b-button variant="outline-primary" style="float:right" >Button</b-button>
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
                <div class="col-sm-6 col-lg-3" v-for="item in itemMisProductos" :key="item.key">
                    <div class="hover-team">
                        <div class="our-team">
                         
                     <img   v-bind:src="ApiRutaNetCore + item.rutaImagenes_Producto"  style="height:200px;">
                            <div class="team-content">
                                <h3 class="title"><b><i class="fa fa-fire"></i>&nbsp; {{item.nombre_Producto}}</b></h3> <span class="post">item.Categoria.Nombre</span>
                            </div>
                            <ul class="social">
                                <li>
                                    <a href="#" class=" fa fa-edit"></a>
                                </li>
                                <li>
                                    <a href="#" class="fa fa-trash"></a>
                                </li>


                            </ul>
                            <div class="icon"> <i class="fa fa-plus" aria-hidden="true"></i> </div>
                        </div>
                        <div class="team-description">
                            <p><b>&nbsp;{{item.Descripcion_Producto}}</b></p>
                        </div>
                        <hr class="my-0">
                    </div>
                </div>
            
        </div>                 
                </div>
                <div v-if="AgregarProducto">
                    <b-card>
                    <div class="form-row">
            <b-form-group      
                label="Categoria:"      
                class="col-md-4"               
            >
               <b-form-select      
                 :options="itemCategorias"  
                 v-model="IdCategoria"      
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>

            <b-form-group 
                label="Nombre de Producto:" 
                class="col-md-8" >
                <b-form-input        
                   v-model="Nombre_Producto"
                  required
                ></b-form-input>
            </b-form-group>            
        </div>
         <div class="form-row">  
            <b-form-group      
                label="Precio:"      
                class="col-md-4"               
            >
                <b-form-input   
                type="number"      
                v-model="Precio_Referencial"
                required
                ></b-form-input>
            </b-form-group>
            <b-form-group      
                label="Descropcion Producto:"      
                class="col-md-8"               
               >
                <b-form-input   
                type="text"      
                v-model="Descripcion_Producto"
                required
                ></b-form-input>
            </b-form-group>
        </div>

        <div class="form-row">
            <b-form-group      
                label="Cantidad Producida:"      
                class="col-md-4"              
            >
                <b-form-input      
                  type="number"  
                  v-model="Cantidad_Producida" 
                   required
                ></b-form-input>
            </b-form-group>
 <b-form-group 
                label="Fecha Inicio:" 
                class="col-md-4" >
              <b-form-input   
                type="date"      
                v-model="Fecha_Inicio"
                required
                ></b-form-input>
            </b-form-group>
           

                <b-form-group      
                label="Fecha Fin:"      
                class="col-md-4"
            
            >
                  <b-form-input   
                type="date"      
                v-model="Fecha_Fin"
                required
                ></b-form-input>
            </b-form-group>
            
        </div>

        <div class="form-row">
           <b-form-group 
                label="Unidad Medioda:" 
                class="col-md-4" >
                   <b-form-select         
                    :options="itemUnidadVolumen"   
                    v-model="IdUnidad_Volumen"   
                    id="inline-form-custom-select-pref"
                    class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>
             <b-form-group      
                label="Frecuenca:"      
                class="col-md-4"
                
            >
             <b-form-select        
               :options="itemFrecuecia"   
                v-model="Idfrecuencia"       
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>   
            <b-form-group 
                label="iamgen:" 
                class="col-md-4" >
               <div class="upload-btn-wrapper">
            <button class="btn1">Imagen</button>
            <input type="file"  id="files" ref="files" name="myfile" v-on:change="handleFileUploads"  />
            </div>
            </b-form-group>  

                  </div>
                         <b-button type="button" variant="primary" @click="RegistrarProducto">
                               <b-spinner v-if="loanding" small type="grow"></b-spinner>
                             Registrar</b-button>
                    </b-card>                  
                </div>
            </b-col>
        
        </b-row>
    </b-container>

  
    </div>
</template>
<script>
import axios from "axios";

export default {
    
    data() {
        return{ 
            MisProductos:false,
            AgregarProducto:true,
            itemCategorias:[],
            itemUnidadVolumen:[],
            itemFrecuecia:[],
            itemMisProductos:[],
            IdCategoria:'',
            Nombre_Producto:'',
            Precio_Referencial:'',
            Descripcion_Producto:'',
            Fecha_Inicio:'',
            Fecha_Fin:'',
            Cantidad_Producida:'',
            IdUnidad_Volumen:'',
            Idfrecuencia:'',
            IdUsuario:16,
            files: [],
            url: null,
            loanding: false,
            ApiRutaNetCore:'',
        }
    },
    created() {
        this.ListarCategorias();
        this.ListarUnidadVolumen();
        this.ListarFrecuencia();
        this.ApiRutaNetCore=this.RutaNetCore;
    },
    methods: {
        MosrarMisProductos(){
            this.MisProductos=true;
            this.AgregarProducto=false;
            this.ListarMisProductos();
        },
        MostrarAgregarProducto(){
            this.MisProductos=false;
            this.AgregarProducto=true;
        },
        MostrarMiPerfil(){

        },
        ListarCategorias(){
               let me=this;
               var cate=[];
               axios.get(this.RutaNetCore+'Categoria/GetCategoria').then(response => { 
               cate=response.data; 
               cate.map(function(x){
                    me.itemCategorias.push({text: x.nombre,value:x.idCategoria});
                });  
            }).catch(function(error){
                console.log(error);
            });
        },
        ListarUnidadVolumen(){
               let me=this;
               var uni=[];
               axios.get(this.RutaNetCore+'UnidadVolumen/GetUnidadVolumen').then(response => { 
               uni=response.data; 
               uni.map(function(x){
                    me.itemUnidadVolumen.push({text: x.nombre,value:x.idUnidadVolumen});
                });  
            }).catch(function(error){
                console.log(error);
            });
        },
        ListarFrecuencia(){
                let me=this;
               var uni=[];
               axios.get(this.RutaNetCore+'Frecuencia/GetFrecuencia').then(response => { 
               uni=response.data; 
               uni.map(function(x){
                    me.itemFrecuecia.push({text: x.nombre,value:x.idfrecuencia});
                });  
            }).catch(function(error){
                console.log(error);
            });
        
        },
        ListarMisProductos(){
               let me=this;              
                let Usuario={
                 IdUsuario:this.IdUsuario
                }
               axios.post(this.RutaNetCore+'Producto/GetMyProducto',Usuario,{ emulateJSON: true}).then(response => { 
                 console.log(response.data)
                me.itemMisProductos=response.data;                 
            }).catch(function(error){
                console.log(error);
            });
        },
        handleFileUploads(e){
                this.files = this.$refs.files.files;
                const file = e.target.files[0];                
                this.url = URL.createObjectURL(file);            
         },
        RegistrarProducto(){
               this.loanding=true;
                let data = new FormData();                
                for( var i = 0; i < this.files.length; i++ ){
                        let file = this.files[i];
                        data.append('files[' + i + ']', file);
                }
                data.append('IdCategoria', this.IdCategoria)
                data.append('Nombre_Producto',this.Nombre_Producto)
                data.append('Precio_Referencial',this.Precio_Referencial)
                data.append('Descripcion_Producto',this.Descripcion_Producto)
                data.append('Fecha_Inicio',this.Fecha_Inicio)
                data.append('Fecha_Fin',this.Fecha_Fin)
                data.append('Cantidad_Producida',this.Cantidad_Producida)
                data.append('IdUnidad_Volumen',this.IdUnidad_Volumen)
                data.append('Idfrecuencia',this.Idfrecuencia)
                data.append('IdUsuario',this.IdUsuario)
            
                let config = {
                    header : {
                            'Content-Type' : 'multipart/form-data'
                    }
                }
                axios.post(this.RutaNetCore+'Producto/SetProducto', data, config).then(response => {
                        console.log(response);
                   
                        if (response.status==200){
                          this.Confirmacion(response.data.Mensaje);
                        }         
                          this.loanding=false;                  
                }) .catch(function(error){
                    console.log(error)
                         this.loanding=false;
                   
            });
        },
        Confirmacion(mensaje){
          this.$swal({
              position: 'top-end',
              icon: 'success',
              title: mensaje,
              text:'texto',
              showConfirmButton: false,
              timer: 3000
              })
       },
    }
}
</script>

<style lang="css">
.img1 {
  border-radius: 50%;
  width: 50%;
}

.upload-btn-wrapper {
  position: relative;
  overflow: hidden;
  display: inline-block;
}

.btn1 {
  border: 2px solid gray;
  color: gray;
  background-color: white;
  padding: 5px 15px;
  border-radius: 8px;
  font-size: 15px;
  font-weight: bold;
}

.upload-btn-wrapper input[type=file] {
  font-size: 100px;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
}



.our-team {
    box-shadow: 0 0 0 rgb(0 0 0 / 30%);
    overflow: hidden;
    position: relative;
    transition: all 0.3s ease 0s;
}

.hover-team:hover img {
    opacity: 0.5;
}

.our-team:hover img {
    opacity: 0.5;
}
.our-team img {
    width: 100%;
    height: auto;
    transition: all 0.3s ease-in-out 0s;
}

.our-team .team-content {
    color: #000;
    opacity: 1;
    position: absolute;
    bottom: 0px;
    left: 0px;
    background: #ffffff;
    padding-left: 55px;
    width: 100%;
    transition: all 0.3s ease 0s;
}
.our-team .social li {
    display: block;
}
.hover-team:hover .social li:nth-child(1) a {
    transition-delay: 0.3s;
}

.our-team .icon {
    width: 35px;
    height: 35px;
    line-height: 35px;
    background: #b0b435;
    text-align: center;
    color: #fff;
    position: absolute;
    bottom: 0;
}

.fa, .fas {
    font-weight: 900;
}

.fa, .far, .fas {
    font-family: "Font Awesome 5 Free";
}
.hover-team .team-content .title {
    border-bottom: 2px solid #b0b435;
}
.team-description {
    padding: 20px 0px;
}
.team-description p {
    font-size: 14px;
    margin: 0px;
}
</style>