<template>
  <b-container>
    <div>
      <br /><br /><br />
      <b-card
        class="mt-3"
        header="Agregar Frecuncia"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <form action="">
          <div class="form-row">
            <b-form-group
              id="input-group-3"
              label="Nombre:"
              label-for="input-2"
              class="col-md-4"
            >
              <b-input class="p-2 px-4 btn-xs" v-model="Model.Nombre">
              </b-input>
            </b-form-group>
          </div>

          <hr />
          <div>
            <b-button
              type="button"
              variant="primary"
              @click="Save"
              class="p-2 px-4 btn-xs"
            >
              Guardar
            </b-button>
          </div>
        </form>
      </b-card>
    </div>
  </b-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      itemActividad: [],
      itemTipoDocumento: [],
      Model: {     
        Nombre: '',
      },
    };
  },
  mounted() {},
  created() {},
  methods: {
    Save() {
      ///  this.show = true;
      let  me = this;
      let data =me.Model;
      axios({
        method: "post",
        url: "Frecuencia/SetFrecuencia",
        data: data,
      })
        .then((response) => {
          console.log(response);
           me.Confirmacion();
        })
        .catch(function (error) {
          console.log(error);
        })
        .finally(() => {});
    },
    Confirmacion() {
      this.$swal.fire({
        position: "top-end",
        icon: "success",
        title: "Registrado",
        showConfirmButton: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
