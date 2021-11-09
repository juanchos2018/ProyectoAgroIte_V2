<template>
     <div>
        
    <div>   
        <h5>Lista Categoria</h5>
  <b-button  size="lg" variant="primary" @click="categoriaadd">Agregar</b-button>
<br><br>            
      <div class="row" id="listaproyectos">             
       <div  class="col-4" v-for="item in items" :key="item.idCategoria" >                
        <b-card no-body class="overflow-hidden" style="max-width: 340px;"  bg-variant="dark" text-variant="white" footer-tag="footer">
            <b-row no-gutters>
            <b-col md="3">
                <div class="UserAvatar__IconImage-hmym9w-1 jtNJTZ" >
                    <center> 
                        <img src="../../assets/imgusuario.png" alt="Avatar" class="avatar1">                    
                    </center>
                </div>     
            </b-col>
            <b-col md="8">
                <b-card-body >                   
                <b-card-title> {{item.nombre}}  </b-card-title>                    
                             
                </b-card-body>                
            </b-col>
            </b-row>            
                <template #footer>
                    <div style="float:right">
                         <b-button variant="success" >   Editar</b-button>
                    </div>
                       
                </template>
        </b-card>
<br>
     
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
        }
    },
     mounted(){
         this.ListarCategorias();     
    },
    created(){
    },
    methods:{        
         ListarCategorias(){
             let me = this;           
              axios({
                      method: 'get',
                      url: 'Categoria/GetCategoria',
                                       
                  })
                  .then(response => {                      
                      me.items = response.data;                     

                  }).catch(function (error) {
                      console.log("errorde : "+error);
              });
         },
         categoriaadd(){
             this.$router.push('/app/categoriaadd');
         }
    }
}
</script>