<template>
  <div>
    <div class="container">
      <div>


           <b-card
        class="mt-3"
        header="Agregar Actividad"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <form>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label>Nombre</label>
              <input v-model="modelo.nombre" class="form-control" />
            </div>
            <div class="form-group col-md-6">
              <br />
            </div>
          </div>

          <button type="button" class="btn btn-primary" @click="Registrar">
            Registrar
          </button>
        </form>
         </b-card>
      </div>
    </div>
  </div>
</template>

<script>
import Widget from "@/components/Widget/Widget";
import axios from "axios";
export default {
  components: { Widget },
  data() {
    return {
      retorno: false,
      errorMessage: null,   
     
      modelo: {
        nombre: "",
      },
    };
  },
  methods: { 

    Registrar() {    
        let me =this;
      axios({
        method: "post",
        url: "Actividad/SetActividad",
        data: me.modelo,
      })
        .then((response) => {
          console.log(response);
            me.Confirmacion()
        })
        .catch(function(error) {
          console.log(error);
        })
        .finally(() => {});
    },
    Confirmacion() {
      this.$swal.fire({
        position: "top-end",
        icon: "success",
        title: "Registrado ..",
        showConfirmButton: false,
        timer: 1500,
      });
    },
  },
  created() {},
};
</script>
