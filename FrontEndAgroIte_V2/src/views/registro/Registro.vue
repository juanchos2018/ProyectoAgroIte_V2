<template>
    <div class="container">
         <div class="form-row">
            <b-form-group      
                label="Nombre:"      
                class="col-md-4"
                description="Escriba su Nombre."
            >
                <b-form-input        
               v-model="Nombres"
                type="text"      
                required
                ></b-form-input>
            </b-form-group>

            <b-form-group 
                label="Apellido:" 
                class="col-md-4" >
                <b-form-input        
                  v-model="Apellidos"   
                  required
                ></b-form-input>
            </b-form-group>


             <b-form-group      
                label="Correo:"      
                class="col-md-4"
                description="Correo."
            >
                <b-form-input        
                v-model="Correo"
                type="email"      
                required
                ></b-form-input>
            </b-form-group>
        </div>

          <div class="form-row">
            <b-form-group      
                label="Direccion:"      
                class="col-md-4"
                description="Escriba su Direccion."
            >
                <b-form-input        
               v-model="Direccion"
                type="text"      
                required
                ></b-form-input>
            </b-form-group>

            <b-form-group 
                label="Actividad:" 
                class="col-md-4" >
                <b-form-select
                :options="itemActividad"   
                v-model="IdActividad"
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"
              
                ></b-form-select>
            </b-form-group>


             <b-form-group      
                label="Tipo Documeto:"      
                class="col-md-4"
                description="tipo documento."
            >
                 <b-form-select    
                  :options="itemTipoDocumento"
                  v-model="Tipo_Documento"
                  class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>
        </div>

        <div class="form-row">
            <b-form-group      
                label="Numero Documento:"      
                class="col-md-4"
                description="Numero Documento."
            >
                <b-form-input      
                  type="text"    
                  v-model="Num_Identificacion"  
                   required
                ></b-form-input>
            </b-form-group>

            <b-form-group 
                label="iamgen:" 
                class="col-md-4" >
                <input type="file" id="files" ref="files"   v-on:change="handleFileUploads" />
            </b-form-group>


             <b-form-group      
                label="Usuario:"      
                class="col-md-4"
                description="Usuario."
            >
                <b-form-input        
                v-model="Alias"
                type="text"      
                required
                ></b-form-input>
            </b-form-group>
        </div>

        <div class="form-row">
            <b-form-group      
                label="Contraseña:"      
                class="col-md-4"
                description="Escriba su Contraseña."
            >
                <b-form-input        
                v-model="Contrasena"
                type="password"      
                required
                ></b-form-input>
            </b-form-group>

            <b-form-group 
                label="Celular:" 
                class="col-md-4" >
                <b-form-input     
                 v-model="Celular"   
                  type="number"   
                  required
                ></b-form-input>
            </b-form-group>


             <b-form-group      
                label="Organizacion:"      
                class="col-md-4"
                description="Organizacion."
            >
                <b-form-input        
                v-model="Organizacion"
                type="text"      
                required
                ></b-form-input>
            </b-form-group>

             <b-button type="button" variant="primary" @click="Registar">
                  <b-spinner v-if="loanding" small type="grow"></b-spinner>
                 Registrar</b-button>

        </div>
        <br>
    </div>
</template>


<script>

import axios from "axios";

export default {
    data() {
      return {
        itemTipoDocumento:[],
        itemActividad:[],  
        Nombres:'',
        Apellidos:'',
        Tipo_Documento:'',
        Num_Identificacion:'',
        Celular:'',
        Direccion:'',
        Correo:'',
        IdActividad:'',
        Alias:'',
        Contrasena:'',
        Organizacion:'',
        Descripcion:'',        
        files: [],
        url: null,
        loanding: false,
   
      }
    },
    created() {
        this.ListarActividad()
        this.Documentos();
    },
    methods: {
         Documentos(){        
             //D:\Disco local\disco\TrabajosEncargados\ProyectoSemilleroUPT\ProyectoAgroIte_V2\ProyectoAgroIte_V2\wwwroot\img/user\45713875-garnanta.png
               var Tipo_Documento=0;
               var nombreDocumento="Dni"
               var Tipo_Documento2=1;
               var nombreDocumento2="Ruc"
               this.itemTipoDocumento.push({text: nombreDocumento,value:Tipo_Documento},{text: nombreDocumento2,value:Tipo_Documento2});
         },
         handleFileUploads(e){
                this.files = this.$refs.files.files;
                const file = e.target.files[0];                
                this.url = URL.createObjectURL(file);
                //Usuario
            
         },
        Registar(){            
               this.loanding = true;
                let data = new FormData();                
                for( var i = 0; i < this.files.length; i++ ){
                        let file = this.files[i];
                        data.append('files[' + i + ']', file);
                }
                data.append('Nombres', this.Nombres)
                data.append('Apellidos',this.Apellidos)
                data.append('Tipo_Documento',this.Tipo_Documento)
                data.append('Num_Identificacion',this.Num_Identificacion)
                data.append('Celular',this.Celular)
                data.append('Direccion',this.Direccion)
                data.append('Correo',this.Correo)
                data.append('IdActividad',this.IdActividad)
                data.append('Alias',this.Alias)
                data.append('Contrasena',this.Contrasena)
                data.append('Organizacion',this.Organizacion)
                data.append('Descripcion',this.Descripcion)
                let config = {
                    header : {
                            'Content-Type' : 'multipart/form-data'
                    }
                }
                axios.post(this.RutaNetCore+'Usuario/SetUsuario', data, config).then(response => {
                        console.log(response);
                   
                        if (response.status==200){
                          this.Confirmacion(response.data.Mensaje);
                        }      
                             this.loanding = false;                     
                }) .catch(function(error){
                    console.log(error)                       
                   
                     this.loanding = false;
            });
       },
      ListarActividad(){
               let me=this;
               var actividad=[];
               axios.get(this.RutaNetCore+'Actividad/GetActividad').then(response => {     
               console.log(response.data)                               
               actividad=response.data; 
               actividad.map(function(x){
                    me.itemActividad.push({text: x.nombre,value:x.idActividad});
                });  
            }).catch(function(error){
                console.log(error);
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