<template>
    <div>
        <div>
          <!-- Menu Opciones -->
        <b-nav pills>
           <b-button type="button"  class="m-1 p-2 px-4 btn-xs" @click="Nuevo" variant="primary" > 
            <i class="fa fa-plus-circle"></i> Nuevo
         </b-button>
        </b-nav>
        
      </div>
      <div>  
          <b-card class="mt-3" header="Listado de Publicaciones"             
            header-text-variant="white"
            header-tag="header"
            header-bg-variant="primary">   
            <b-form >            
            </b-form>    
            <div class="">
              <b-table hover :items="items" :fields="fields">
                 <template v-slot:cell(acciones)="{ item }">
                    <b-button variant="primary" size="sm" class="m-1" @click="IrSolicitudes(item.key_noticia)"> Ver Solicitudes</b-button>
                   <b-button variant="primary" size="sm" class="m-1"> Editar</b-button>
                
                 </template>
              </b-table>
            </div>              
            <!-- Fin tabla -->
           </b-card> 
        </div>
      <div>
  </div>
 </div>
</template>
<script>

import axios from  'axios';
import firebase from '@/firebase'

 export default{
     
        data(){
            return{
                datos:{
                  id_usuario:'IdEmpresa1',
                  nombre:'',                      
                },
                fields: [                       
                         { label:"Titulo", key: 'titulo', sortable: false },
                         { label:"Descripcion", key: 'descripcion_noticia', sortable: false },
                         { label:"Fecha", key: 'fecha_noticia', sortable: false },    
                         { label:"Cantidad", key: 'contador', sortable: false },    
                         { label:"Acciones", key: 'acciones', sortable: false },
                ],
                items:[],
                Buscar:"",
                DialogCliente:false,
            }
        },
        created () {
            firebase.auth().onAuthStateChanged(user =>  {
            if (user) {          
            //  this.NombreUsuario=user.displayName;
              this.datos.id_usuario=user.uid;        
             
              this.GetPublicaciones();

            } else {       
              console.log("no logueado")
            }
            });
            
        },

        methods:{
          Nuevo(){
                 this.$router.push({name:"publicaciones"});
          },        
          GetPublicaciones(){
                  let me = this;
                  axios({
                      method: 'post',
                      url: 'Publicar/GetPublicaciones',
                      data:me.datos,                     
                  })
                  .then(response => {
                      console.log(response.data);
                      me.items = response.data;                      

                  }).catch(function (error) {
                      console.log(error);
              });
          },
          IrSolicitudes(ed){
              console.log(ed);
              var id= String(ed);              
              this.$router.push({name:"Solicitudes",params:{id} });

          }
    }

}
</script>
<style src="./publicaciones.scss" lang="scss" scoped/>