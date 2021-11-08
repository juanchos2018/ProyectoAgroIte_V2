<template>
    <div>
    <div class="form-row">
         <b-form-group    class="col-md-6">
               <label class="control-label font-weight-bold text-info">Titulo </label> 
              <b-input type="text" v-model="titulo" ></b-input>
          </b-form-group>          
   </div>   
   <div class="form-row">
      <b-form-group  class="col-md-6">
            <label class="control-label font-weight-bold text-info">Descripcion </label> 
            <b-form-textarea
              id="textarea"
              v-model="descripcion"
              placeholder="Descripcion..."
              rows="3"
              max-rows="6"
            ></b-form-textarea>
        </b-form-group>    
         <b-form-group class="col-md-3" style="margin-top:-50px">
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
   <div class="form-row">
        <b-overlay :show="show"  no-wrap>      
         </b-overlay>
         <b-form-group class="col-md-4">
            <b-button variant="primary"  style="display: inline-block;margin-top:15px;width:50% " 
              :disabled="show"   @click="upload">Subir</b-button>    
          </b-form-group>
        <!--  <b-form-group  class="col-md-2">
              <label class="control-label font-weight-bold text-info">Imagen </label> <br>
              <input type="file" id="files" ref="files" multiple v-on:change="handleFileUploads"/>
                      <div id="preview">
                        <img v-if="url" :src="url"  width="200"/>
                      </div>  
          </b-form-group> -->        
     </div>  
    </div>
</template>

<script>

import axios from  'axios';
import firebase from '@/firebase'
export default {
    data()
      {
       return{              
               descripcion:'',
               titulo:'',
               IdEmpresa:'',
               telefono:'970780836',
               NombreEmpresa:'',
               img_empresa:'https://firebasestorage.googleapis.com/v0/b/fir-app-cf755.appspot.com/o/NuevoProducto%2Fimgjuancho.jpg?alt=media&token=b48c6e91-3f3e-4f13-81cc-87d1e6e1908a',
               files: [],
               url: null,
               show: false,
               fileRecords: [],
               fileRecordsForUpload: [],             
        }
    },
    created()
    {
        firebase.auth().onAuthStateChanged(user =>  {
        if (user) {          
        //  this.NombreUsuario=user.displayName;
          this.IdEmpresa=user.uid;        
          this.DatosUsuario(this.IdEmpresa);

        } else {       
          console.log("no logueado")
        }
        });
    },
    methods:{             
            handleFileUploads(e){
                this.files = this.$refs.files.files;
                 const file = e.target.files[0];
                // this.files = e.target.files[0];
                 this.url = URL.createObjectURL(file);
              //  var validFileRecords = e.filter((fileRecord) => !fileRecord.error);
            //   this.fileRecordsForUpload = this.fileRecordsForUpload.concat(validFileRecords);
            },            
            upload(){
              // esto apra subir archivos 
                    this.show = true;
                    let data = new FormData();                
                   for( var i = 0; i < this.files.length; i++ ){
                            let file = this.files[i];
                            data.append('files[' + i + ']', file);
                    }
                    data.append('nombre_usuario', this.NombreEmpresa)
                    data.append('descripcion_noticia',this.descripcion)
                    data.append('image_empresa',this.img_empresa)
                    data.append('key_usuario',this.IdEmpresa)
                    data.append('titulo',this.titulo)
                    data.append('telefono',this.telefono)
                    let config = {
                      header : {
                      'Content-Type' : 'multipart/form-data'
                      }
                    }
                    axios.post('Publicar/SubirPublicacion', data, config).then(response => {
                         console.log(response);
                         this.show = false;
                         if (response.status==200){
                            this.Confirmacion()
                         }                           
                    }) .catch(function(error){
                        console.log(error)
                         this.show = false;
                        console.log('Error!');
                });
             },
             upload1: function(){
                var self = this;
                this.$refs.profilePicRef.upload(this.uploadUrl, this.uploadHeaders, [this.profilePic]).then(function(){
                  self.uploaded = true;
                  setTimeout(function(){
                    // self.profilePic.progress(0);          
                  }, 500);
                });
            },
            Notificar(){
              axios.post('Publicar/Set_Notificar').then(response => {
                         console.log(response);
                         this.show = false;
                    }) .catch(function(error){
                        console.log(error)
                         this.show = false;
                        console.log('Error!');
                 });                     
            },
            Confirmacion(){
              this.$swal.fire({
                  position: 'top-end',
                  icon: 'success',
                  title: 'Publicado ..',
                  showConfirmButton: false,
                  timer: 1500
                })
             },
              DatosUsuario(id_usuario){		  
                    let me = this;                      
                    axios({ method: 'get',
                            url: 'Usuario/ObtenerUsuario/'+id_usuario,                                       
                          })
                         .then(response => {  
                              me.NombreEmpresa=response.data.data.nombre_usuario;  
                          }).catch(function (error) {
                              console.log(error);
                    });
	             },
         }
}
</script>
<style scoped>
#fileso {
  position: relative;
  top: 150px;
  font-family: calibri;
  width: 150px;
  padding: 10px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border: 1px dashed #BBB;
  text-align: center;
  background-color: #DDD;
  cursor: pointer;
}
 #profile-pic-demo .drop-help-text {
    display: none;
  }
  #profile-pic-demo .is-drag-over .drop-help-text {
    display: block;
  }
  #profile-pic-demo .profile-pic-upload-block {
    border: 2px dashed transparent;
    padding: 20px;
    padding-top: 0;
  }

  #profile-pic-demo .is-drag-over.profile-pic-upload-block {
    border-color: #AAA;
  }
  #profile-pic-demo .vue-file-agent {
    width: 180px;
    float: left;
    margin: 0 15px 5px 0;
    border: 0;
    box-shadow: none;
  }
</style>