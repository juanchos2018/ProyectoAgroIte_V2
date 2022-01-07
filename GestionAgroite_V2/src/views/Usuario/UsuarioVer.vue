<template>


<b-container>
  <div>
      <br><br><br>   
   <b-card
        class="mt-3"
        header="Detalle Usuario"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
    <form action="">
      <div class="form-row">
        <b-form-group
          id="input-group-3"
          label="Actividad"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-select
           
            :options="itemActividad"  
            v-model="Usuario.idActividad"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-select>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Nombre:"
          label-for="input-2"
          class="col-md-3"
          disabled
         >
          <b-input class="p-2 px-4 btn-xs"  disabled v-model="Usuario.nombres"> </b-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Apellidos:"
          label-for="input-2"
          class="col-md-3"
          
        >
          <b-input class="p-2 px-4 btn-xs" disabled v-model="Usuario.apellidos">
          </b-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Tipo Documento"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-select
            :options="itemTipoDocumento"
            v-model="Usuario.tipo_Documento"
            required
            class="p-2 px-4 btn-xs"
            disabled
          >
          </b-form-select>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Numero Documento"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Email"
            v-model="Usuario.num_Identificacion"
            required
            class="p-2 px-4 btn-xs"
            disabled
          >
          </b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Celular"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Email"
            v-model="Usuario.celular"
            required
            class="p-2 px-4 btn-xs"
            disabled
          >
          </b-form-input>
        </b-form-group>
        <b-form-group
          id="input-group-3"
          label="Direccion"
          label-for="input-1"
          class="col-md-3"
          disabled
        >
          <b-form-input
            id="Email"
            v-model="Usuario.direccion"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Correo"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Email"
            v-model="Usuario.correo"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>
      </div>

      <div class="form-row">
       

        <b-form-group
          id="input-group-3"
          label="Organizacion"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Direccion"
            v-model="Usuario.organizacion"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>
        <b-form-group
          id="input-group-3"
          label="Descripcion"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Telefono"
            v-model="Usuario.descripcion"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>

         <b-form-group class="col-md-3" >
            <b-form-group  class="col-md-2">
              <label class="control-label font-weight-bold text-info">Imagen </label> <br>
              <input type="file" id="files" ref="files"  v-on:change="handleFileUploads"/>
                      <div id="preview">
                        <img v-if="url" :src="url"  width="200"/>
                      </div>  
          </b-form-group>
          <!--  <VueFileAgent   :multiple="false" ref="files"  v-model="files"   @select="handleFileUploads($event)"  class="profile-pic-upload-block">    
             </VueFileAgent>  -->
        </b-form-group>   
      </div>
      <hr />
      <div>
        <b-button type="button" variant="primary" @click="SavedUser" class="p-2 px-4 btn-xs">
          Guardar
        </b-button>
      </div>
    </form>
     </b-card>
  </div>

  </b-container>
</template>

<script>
import axios from  'axios';

export default {
   props:['idusuario'],
   data() {
    return {
      TipoDocumentos: [],
      itemActividad: [],
      itemTipoDocumento:[],
      Usuario: {
        idUsuario: 0,
        idActividad: 0,
        nombres: "",
        apellidos: "",
        tipo_Documento: "",
        num_Identificacion: "",  
        celular: "",
        direccion: "",
        correo: "",        
        organizacion: "",
        descripcion: "",
      },
      modelo:{
        IdUsuario: 0,
        IdActividad: 0,
      },
      files: [],
      url: null,
      show:false
    };
  },
  mounted() {
    //Load 
    this.getActividad();
    this.InfoUsuario();
  },
  created() {
      this.itemTipoDocumento.push({text:"DNI",value:0},{text:"RUC",value:1})
  },
  methods: {

    InfoUsuario(){
        let me = this;
        me.modelo.idUsuario=me.idusuario       
        let data =me.modelo;
         console.log(data)
        axios({
            method: "post",
            url: "Usuario/GetUsuario2",
            data: data
        })
        .then((response) => {
            console.log(response);
            me.Usuario = response.data;
        })
        .catch(function (error) {
          console.log("errorde : " + error);
        });
    }, 
    getActividad() {
      let me = this;
      axios({
        method: "get",
        url: "Actividad/GetActividad",
      })
        .then((response) => {
             var tipoDcumento=[];  
            tipoDcumento=response.data;            
             tipoDcumento.map(function(x){
                   me.itemActividad.push({text: x.nombre,value:x.idActividad});
             });   
        })
        .catch(function(error) {
          console.log(error);
        });
    },
      handleFileUploads(e){
            this.files = this.$refs.files.files;
            const file = e.target.files[0];               
            this.url = URL.createObjectURL(file);
            
     },
     SavedUser(){
         ///  this.show = true;
            let data = new FormData();                
            for( var i = 0; i < this.files.length; i++ ){
                    let file = this.files[i];
                    data.append('files[' + i + ']', file);
            }
            data.append('IdActividad',this.Usuario.IdActividad)
            data.append('Nombres',this.Usuario.Nombres)
            data.append('Apellidos',this.Usuario.Apellidos)
            data.append('Tipo_Documento',this.Usuario.Tipo_Documento),
            data.append('Num_Identificacion',this.Usuario.Num_Identificacion)
            data.append('RutaFoto_Perfil',this.Usuario.IdActividad)
            data.append('Celular',this.Usuario.Celular)
            data.append('Direccion',this.Usuario.Direccion)
            data.append('Correo',this.Usuario.Correo),
            data.append('Contraseña',this.Usuario.Contraseña)
            data.append('Organizacion',this.Usuario.Organizacion)
            data.append('Descripcion',this.Usuario.Descripcion)

            let config = {
                header : {
                'Content-Type' : 'multipart/form-data'
                }
            }
            axios.post('Usuario/SetUsuario', data, config).then(response => {
                 //   console.log(response);
                  ///  this.show = false;
                    if (response.status==200){
                         this.Confirmacion()
                       //  alert("REgistrado we");
                    }                           
               }).catch(function(error){
                console.log(error)
                  ///  this.show = false;
                console.log('Error!');
                });
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
