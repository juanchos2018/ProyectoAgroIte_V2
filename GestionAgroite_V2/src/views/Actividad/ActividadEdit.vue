<template>
  <card>
    <br><br><br>
    <b-form @submit.prevent="updateProfile">
      <h6 class="heading-small text-muted mb-4">Editar Actividad</h6>
      <div class="pl-lg-4">
        <b-row>
          <b-col lg="6">
            <base-input
              type="text"
              label="Nombre"
              placeholder="Nombre"
             v-model="modelo.nombre" 
            >
            </base-input>
          </b-col>      
        </b-row>       
      </div>
      <hr class="my-4"> 
        <button type="button" class="btn btn-primary" @click="Editar">
          Guardar
        </button>
    </b-form>
  </card>
</template>
<script>
import axios from "axios";

export default {

 props: ["id"],

 data() {
    return {
      modelo: {
        nombre: "",
        idActividad:0
      },
    };
  },

  mounted(){
      this.InfoActividad();
  },
  methods: {
     updateProfile() {
      alert('Your data: ' + JSON.stringify(this.user));
     },
     InfoActividad(){
        let me = this;
        me.modelo.idActividad=me.id;
        let data =me.modelo;
        axios({
            method: "post",
            url: "Actividad/InfoActividad",
            data:data
        })
        .then((response) => {
          me.modelo = response.data;
        })
        .catch(function (error) {
          console.log("errorde : " + error);
        });
     },
     Editar() {    
        let me =this;
        me.modelo.idActividad=me.id;
        axios({
            method: "post",
            url: "Actividad/EditActividad",
            data: me.modelo,
        })
        .then((response) => {
            console.log(response);
            alert("Actualizado");
        
        })
        .catch(function(error) {
          console.log(error);
        })
        .finally(() => {});
    },
  }
};
</script>
<style></style>
