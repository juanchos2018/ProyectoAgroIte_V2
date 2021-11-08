<template>
     <div>
        
    <div>   
      <div class="row" id="listaproyectos">             
       <div  class="col-4" >                
        <b-card no-body class="overflow-hidden" style="max-width: 340px;"  bg-variant="dark" text-variant="white" footer-tag="footer">
            <b-row no-gutters>
            <b-col md="3">
                <div class="UserAvatar__IconImage-hmym9w-1 jtNJTZ" >
                    <center> 
                        <img src="../../assets/imgusuario.png" alt="Avatar" class="avatar1">                    
                    </center>
                </div>     
            </b-col>
            <b-col md="6">
                <b-card-body >                   
                <b-card-title> pepepe  </b-card-title>                    
                <b-card-text>
                    45442432
                </b-card-text>                
                </b-card-body>                
            </b-col>
            </b-row>            
                <template #footer>
                    <div style="float:right">
                         <b-button variant="success" @click="Chat">   respodener</b-button>
                          <b-button variant="primary" style="margin-left:5px" @click="Detalle" > detalles</b-button>
                    </div>
                       
                </template>
        </b-card>
<br>
         <b-card no-body class="overflow-hidden" style="max-width: 340px;"  bg-variant="dark" text-variant="white" footer-tag="footer">
            <b-row no-gutters>
            <b-col md="3">
                <div class="UserAvatar__IconImage-hmym9w-1 jtNJTZ" >
                    <center> 
                        <img src="../../assets/imgusuario.png" alt="Avatar" class="avatar1">                    
                    </center>
                </div>     
            </b-col>
            <b-col md="6">
                <b-card-body >                   
                <b-card-title> andres  </b-card-title>                    
                <b-card-text>
                    45442432
                </b-card-text>                
                </b-card-body>                
            </b-col>
            </b-row>            
                <template #footer>
                    <div style="float:right">
                         <b-button variant="success" @click="Chat">   respodener</b-button>
                          <b-button variant="primary" style="margin-left:5px" @click="Detalle" > detalles</b-button>
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
    
     
    },
    created(){

    },
    methods:{
         DatosId(){
            var id = this.$route.params.id
            if(id){
                console.log("recibe we");
               
               console.log(id);
                this.ListarSolicutdes(id);
            
            }            
         },
         Detalle(){
            this.$router.push({name:"taxistasdetalle"});
         },
         Chat(){
                this.$router.push({name:"chat"});
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
                      console.log(response.data);
                      me.items = response.data;                      

                  }).catch(function (error) {
                      console.log(error);
              });
         }
    }
}
</script>
<style src="./taxista.scss" lang="scss"   />
