<template>
    
    <div>
        
         <div>
            <label for="nomnre"> id</label>
            <br>
                <input type="text" v-model="id" placeholder="id">
        </div>
        <div>
            <label for="nomnre"> nambre</label>
            <br>
                <input type="text"  v-model="nombre" placeholder="nombre">
        </div>
         <div>
             <label >apellido</label>
             <br>
                <input type="text" v-model="apellido" placeholder="apellido">
        </div>

       <b-button @click="Registrar">Guardar</b-button>
    </div>
</template>

<script>
import axios from  'axios';
export default {
    
    data(){
        return{
            id:'',
            nombre:'',
            apellido:'',

            datos:{
               id:'',
               nombre:'',
               apellido:''     
            }
        }
    },
    methods:{

        Registrar(){

                this.datos.id=this.id;
                this.datos.nombre=this.nombre;
                this.datos.apellido=this.apellido;

                axios({
                      method: 'post',
                      url: 'Usuario/Guardar',
                      data:this.datos,
                  })
                  .then(response => {
                      
                       console.log(response)
                  }).catch(function (error) {
                      console.log(error);
                  }) .finally(() => {
                     
                  })
        }
    }

    
}
</script>