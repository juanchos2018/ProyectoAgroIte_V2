<template>
  <card>
      <br><br><br>
    

    <b-form @submit.prevent="updateProfile">
      <h6 class="heading-small text-muted mb-4">Agregar Actividad</h6>
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
        <button type="button" class="btn btn-primary" @click="Registrar">
        Registrar
        </button>
    </b-form>
  </card>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      modelo: {
        nombre: "",
      },
    };
  },
  methods: {
     updateProfile() {
      alert('Your data: ' + JSON.stringify(this.user));
     },
      Registrar() {    
        let me =this;
      axios({
        method: "post",
        url: "Actividad/SetActividad",
        data: me.modelo,
      })
        .then((response) => {
            console.log(response);
            alert("Registrado");

           //  me.Confirmacion()
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
