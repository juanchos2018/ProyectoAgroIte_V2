<template>
     <div>
        
    <div>   
        <h5>Lista Actividad</h5>
  <b-button  size="lg" variant="primary" @click="Actividadadd">Agregar</b-button>
<br><br>            
      <div class="row" id="listaproyectos">             
       <div  class="col-4" v-for="item in items" :key="item.idActividad" >                
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
         this.ListarActividades();     
    },
    created(){
    },
    methods:{        
         ListarActividades(){
             let me = this;           
              axios({
                      method: 'get',
                      url: 'Actividad/GetActividad',
                                       
                  })
                  .then(response => {                      
                      me.items = response.data;                     

                  }).catch(function (error) {
                      console.log("errorde : "+error);
              });
         },
         Actividadadd(){
             this.$router.push('/app/actividadadd');
         }
    }
}
</script>
