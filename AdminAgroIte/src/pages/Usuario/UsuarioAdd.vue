<template>
  <div>
         <b-card
        class="mt-3"
        header="Agregar Usuario"
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
         
            v-model="Usuario.IdActividad"
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
        >
          <b-input class="p-2 px-4 btn-xs" v-model="Usuario.Nombres"> </b-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Apellidos:"
          label-for="input-2"
          class="col-md-3"
        >
          <b-input class="p-2 px-4 btn-xs" v-model="Usuario.Apellidos">
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
            v-model="Usuario.Tipo_Documento"
            required
            class="p-2 px-4 btn-xs"
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
            v-model="Usuario.Num_Identificacion"
            required
            class="p-2 px-4 btn-xs"
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
            v-model="Usuario.Celular"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>
        <b-form-group
          id="input-group-3"
          label="Direccion"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Email"
            v-model="Usuario.Direccion"
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
            v-model="Usuario.Correo"
            required
            class="p-2 px-4 btn-xs"
          >
          </b-form-input>
        </b-form-group>
      </div>

      <div class="form-row">
        <b-form-group
          id="input-group-3"
          label="Contraseña"
          label-for="input-NombreComercial"
          class="col-md-3"
        >
          <b-input class="p-2 px-4 btn-xs" v-model="Usuario.Contraseña">
          </b-input>
        </b-form-group>

        <b-form-group
          id="input-group-3"
          label="Organizacion"
          label-for="input-1"
          class="col-md-3"
        >
          <b-form-input
            id="Direccion"
            v-model="Usuario.Organizacion"
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
            v-model="Usuario.Descripcion"
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
</template>

<script>
import axios from  'axios';

export default {
  data() {
    return {
      TipoDocumentos: [],
      itemActividad: [],
      itemTipoDocumento:[],
      Usuario: {
        IdUsuario: 0,
        IdActividad: 0,
        Nombres: "",
        Apellidos: "",
        Tipo_Documento: "",
        Num_Identificacion: "",  
        Celular: "",
        Direccion: "",
        Correo: "",
        Contraseña: "",
        Organizacion: "",
        Descripcion: "",
      },
      files: [],
      url: null,
      show:false
    };
  },
  mounted() {
    this.getActividad();
  },
  created() {
      this.itemTipoDocumento.push({text:"DNI",value:0},{text:"RUC",value:1})
  },
  methods: {
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
           this.show = true;
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
                    console.log(response);
                    this.show = false;
                    if (response.status==200){
                         this.Confirmacion()
                    }                           
               }).catch(function(error){
                console.log(error)
                    this.show = false;
                console.log('Error!');
                });
             }  


  },
};
</script>

<style></style>
