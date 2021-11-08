<template>
     <div>        
    <div>   
      <div class="row" id="listaproyectos">             
       <div class="col-4" v-for="item in items" :key="item.key">  
              
        <b-card no-body class="overflow-hidden" style="max-width: 340px;"  bg-variant="dark" text-variant="white" footer-tag="footer">
            <b-row no-gutters>
            <b-col md="3">
                <div class="UserAvatar__IconImage-hmym9w-1 jtNJTZ" >
                    <center>                       
                     <div v-if="item.img_usuario=='default_value'">
                         <img src="../../assets/imgusuario.png" alt="Avatar" class="avatar1">  
                        </div>                            
                      <div v-else>
                          <img :src="item.img_usuario" alt="Avatar" class="avatar1">    
                       </div>                                         
                    </center>
                </div>     
            </b-col>
            <b-col md="8">
                <b-card-body >  
                <b-card-text>
                      {{item.nombre_usuario}}
                      {{item.dni_usuario}}
                </b-card-text>                
                </b-card-body>                
            </b-col>
            </b-row>            
                <template #footer>
                    <div style="float:right">
                         <b-button variant="success" @click="Chat(item.id_usuario)">   respodener</b-button>
                          <b-button variant="primary" style="margin-left:5px" @click="Detalle(item.id_usuario)" > detalles</b-button>
                    </div>                       
                </template>
          </b-card>
         </div>
      </div>
    </div>

    </div>
</template>

<script>

import axios from  'axios';
export default {
    
    data(){
        return{
          items:[],
          datos:{
            key_noticia:''
             }
        }
    },
     mounted(){
      this.DatosId()
     
    },
    created(){

    },
    methods:{
         DatosId(){
            var id = this.$route.params.id
            if(id){
                console.log("recibe we");
               
             
               this.ListarSolicutdes(id);
            
            }            
         },
         Detalle(id_usuario){
              //  console.log(id_usuario);
               // this.$router.push({name:"taxistasdetalle"});
                  this.$router.push('/app/taxistasdetalle/'+id_usuario);
         },
         Chat(id_usuario){
              //  this.$router.push({name:"chat"});
                this.$router.push('/app/chat/'+id_usuario);
         },
         ListarSolicutdes(id){
             let me = this;
              me.datos.key_noticia=id;
                  axios({
                      method: 'post',
                      url: 'Solicitude/GetSolicitudes',
                      data:me.datos,                     
                  })
                  .then(response => {
                   //   console.log(response.data);
                      me.items = response.data;                      

                  }).catch(function (error) {
                      console.log(error);
              });
         }
    }
}
</script>
<style src="./stile.scss" lang="scss"  />
